// Copyright (c) 2022, Sui Foundation
// SPDX-License-Identifier: Apache-2.0

#[lint_allow(self_transfer)]
/// A basic Hello World example for Sui Move, part of the Sui Move intro course:
/// https://github.com/sui-foundation/sui-move-intro-course
/// 
module sui_move_start::hello_world {

    use std::string;
    use sui::object::{Self, UID};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    /// An object that contains an arbitrary string
    struct HelloWorldObject has key, store {
        id: UID,
        /// A string contained in the object
        name: string::String
    }

    public fun mint(ctx: &mut TxContext) {
        let object = HelloWorldObject {
            id: object::new(ctx),
            name: string::utf8(b"Hello rickiey!")
        };
        transfer::public_transfer(object, tx_context::sender(ctx));
    }

}