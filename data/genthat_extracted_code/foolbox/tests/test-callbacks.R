context("Callbacks")

test_that("Default callbacks look like they should", {
    callbacks <- rewrite_callbacks()
    expect_true(identical(
        callbacks$atomic, foolbox::identity_rewrite_callback
    ))
    expect_true(identical(
        callbacks$symbol, foolbox::identity_rewrite_callback
    ))
    expect_true(identical(
        callbacks$primitive, foolbox::identity_rewrite_callback
    ))
    expect_true(identical(
        callbacks$pairlist, foolbox::identity_rewrite_callback
    ))
    expect_true(identical(
        callbacks$call, foolbox::identity_rewrite_callback
    ))
})


test_that("We can set callbacks", {
    f <- function(x) {
        print("f")
        x
    }
    cb <- rewrite_callbacks() %>% with_atomic_callback(f)
    expect_equal(environment(cb$atomic)$fn, f)
    expect_equal(cb$pairlist, identity_rewrite_callback)
    expect_equal(cb$symbol, identity_rewrite_callback)
    expect_equal(cb$primitive, identity_rewrite_callback)
    expect_equal(cb$call, identity_rewrite_callback)

    cb <- rewrite_callbacks() %>% with_pairlist_callback(f)
    expect_equal(cb$atomic, identity_rewrite_callback)
    expect_equal(environment(cb$pairlist)$fn, f)
    expect_equal(cb$symbol, identity_rewrite_callback)
    expect_equal(cb$primitive, identity_rewrite_callback)
    expect_equal(cb$call, identity_rewrite_callback)

    cb <- rewrite_callbacks() %>% with_symbol_callback(f)
    expect_equal(cb$atomic, identity_rewrite_callback)
    expect_equal(cb$pairlist, identity_rewrite_callback)
    expect_equal(environment(cb$symbol)$fn, f)
    expect_equal(cb$primitive, identity_rewrite_callback)
    expect_equal(cb$call, identity_rewrite_callback)

    cb <- rewrite_callbacks() %>% with_primitive_callback(f)
    expect_equal(cb$atomic, identity_rewrite_callback)
    expect_equal(cb$pairlist, identity_rewrite_callback)
    expect_equal(cb$symbol, identity_rewrite_callback)
    expect_equal(environment(cb$primitive)$fn, f)
    expect_equal(cb$call, identity_rewrite_callback)

    cb <- rewrite_callbacks() %>% with_call_callback(f)
    expect_equal(cb$atomic, identity_rewrite_callback)
    expect_equal(cb$pairlist, identity_rewrite_callback)
    expect_equal(cb$symbol, identity_rewrite_callback)
    expect_equal(cb$primitive, identity_rewrite_callback)
    expect_equal(environment(cb$call)$fn, f)

    cb <- rewrite_callbacks() %>%
        with_primitive_callback(f) %>%
        with_call_callback(f)
    expect_equal(cb$atomic, identity_rewrite_callback)
    expect_equal(cb$pairlist, identity_rewrite_callback)
    expect_equal(cb$symbol, identity_rewrite_callback)
    expect_equal(environment(cb$primitive)$fn, f)
    expect_equal(environment(cb$call)$fn, f)
})

test_that("we can chain callbacks", {
    results <- c()
    tick <- function(expr, next_cb, ...) {
        results <<- c("called", results)
        next_cb(expr)
    }
    f <- function(x) x
    cb <- rewrite_callbacks() %>%
        with_symbol_callback(tick)
    f %>% rewrite() %>% rewrite_with(cb)
    expect_equal(results, "called")

    results <- c()
    cb <- cb %>% with_symbol_callback(tick)
    f %>% rewrite() %>% rewrite_with(cb)
    expect_equal(results, c("called", "called"))
})
