context("API/DSL for specifying transformation functions")

test_that("the functions for setting up transformations work", {
    f <- function(x) 2 + x
    g <- function(y) y + f(y)
    tr_g <- g %>% rewrite() %>% rewrite_with(
        rewrite_callbacks() %>%
            add_call_callback(f, function(expr, ...) {
                quote(2 + x)
            })
    )
    expect_equal(body(tr_g), quote(y + (2 + x)))

    tr_g_body <- body(g) %>% rewrite_expr() %>% rewrite_expr_with(
        rewrite_callbacks() %>%
            add_call_callback(f, function(expr, ...) {
                quote(2 + x)
            }),
        env = environment()
    )
    expect_equal(tr_g_body, quote(y + (2 + x)))
})

test_that("the functions for running analyses work", {
    collect_symbols <- function(expr, bottomup, ...) {
        list(syms = c(as.character(expr), merge_bottomup(bottomup)) %>%
                 unlist() %>% unique())
    }

    f <- function(x, y) 2 + x - y
    syms <- f %>% analyse() %>% analyse_with(
        analysis_callbacks() %>% with_symbol_callback(collect_symbols)
    )
    expect_equal(syms$syms, c("-", "+", "x", "y"))

    syms <- body(f) %>% analyse_expr() %>% analyse_expr_with(
        analysis_callbacks() %>% with_symbol_callback(collect_symbols)
    )
    expect_equal(syms$syms, c("-", "+", "x", "y"))
})

test_that("we can transform as part of a function definition", {

    f <- function(x) 2 * x
    g <- function(y) f(x)
    rewrite_f <- . %>% rewrite_with(
        rewrite_callbacks() %>% add_call_callback(f, function(expr, ...) quote(2 * x))
    )
    rewrite_g <- . %>% rewrite_with(
        rewrite_callbacks() %>% add_call_callback(g, function(expr, ...) quote(f(2)))
    )

    h <- rewrites[rewrite_f] < function(x, y) f(x + y)
    expect_equal(body(h), quote(2 * x))
    h <- rewrites[rewrite_g] < function(x, y) g(x + y)
    expect_equal(body(h), quote(f(2)))
    h <- rewrites[rewrite_g, rewrite_f] < function(x, y) g(x + y)
    expect_equal(body(h), quote(2 * x))
})
