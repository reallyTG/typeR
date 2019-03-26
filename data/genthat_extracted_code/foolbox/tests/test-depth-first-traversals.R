context("Depth first transformation")

test_that("we can do simple transformations", {
    calls <- c() # I put this here so lintr can see it, but
    # it is actually in the *transformed* function's
    # scope it will be found and not the transformator's.
    # In this test it is the same, though.

    log_calls_transform <- function(call_expr, env, ...) {
        call_fn <- eval(call_expr[[1]], envir = env)
        if (rlang::is_primitive(call_fn)) return(call_expr)
        if (!rlang::is_symbol(call_expr[[1]])) return(call_expr)
        # call is to a named function
        rlang::expr({
            calls <<- c(!!as.character(call_expr[[1]]), calls)
            !!call_expr
        })
    }
    cb <- rewrite_callbacks() %>% with_call_callback(log_calls_transform)

    f <- function(x) {
        if (x > 0) f(x - 1)
    }

    f <- depth_first_rewrite_function(f, cb)
    f(3)
    expect_equal(calls, c("f", "f", "f"))
})

test_that("we call callback on pairlist", {
    pairlist_called <- FALSE
    pairlist_cb <- function(call_expr, ...) {
        pairlist_called <<- TRUE
        call_expr
    }
    f <- function() function(x, y) x + y
    expect_equal(f()(2, 2), 4)

    expect_false(pairlist_called)
    cb <- rewrite_callbacks() %>% with_pairlist_callback(pairlist_cb)
    g <- depth_first_rewrite_function(f, cb)
    expect_true(pairlist_called)
    expect_equal(g()(2, 2), 4)
})

test_that("we call callback on primitive", {
    # it is actually pretty hard to see a "primitive" when
    # traversing quoted expressions, so this is the only
    # way I could think of to test this
    primitive_called <- FALSE
    primitive_cb <- function(expr, ...) {
        primitive_called <<- TRUE
        expr
    }
    cb <- rewrite_callbacks() %>% with_primitive_callback(primitive_cb)
    depth_first_rewrite_expr(`if`, cb, environment(), list())
    expect_true(primitive_called)

    primitive_called <- FALSE
    primitive_cb <- function(expr, ...) {
        primitive_called <<- TRUE
        expr
    }
    cb <- analysis_callbacks() %>% with_primitive_callback(primitive_cb)
    depth_first_analyse_expr(`if`, cb, environment(), list())
    expect_true(primitive_called)
})

test_that("we can call a callback for a specific function", {
    f <- function(x) x
    g <- function(y) y + f(y)
    f_cb <- function(expr, env, ...) {
        call_fn <- eval(expr[[1]], env)
        stopifnot(identical(call_fn, f))
        quote(2 + x)
    }

    cb <- rewrite_callbacks() %>% add_call_callback(fn = f, cb = f_cb)
    g_tr <- depth_first_rewrite_function(g, cb)
    expect_equal(body(g_tr), quote(y + (2 + x)))

    h <- function(z) 3 * z
    g <- function(y) h(y + f(y))
    g_tr <- depth_first_rewrite_function(g, cb)
    expect_equal(body(g_tr), quote(h(y + (2 + x))))

    h_cb <- function(expr, ...) {
        rlang::expr(3 * !!expr[[2]])
    }
    cb <- cb %>% add_call_callback(fn = h, h_cb)
    g_tr <- depth_first_rewrite_function(g, cb)
    expect_equal(body(g_tr), quote(3 * (y + (2 + x))))
})

test_that("we can handle call-callbacks when there are local functions", {
    f <- function(x) x

    f_cb <- function(expr, env, ...) {
        call_fn <- eval(expr[[1]], env)
        stopifnot(identical(call_fn, f))
        quote(2 + x)
    }
    cb <- rewrite_callbacks() %>% add_call_callback(fn = f, cb = f_cb)

    g <- function(y) y + f(y)
    g_tr <- foolbox:::depth_first_rewrite_function(g, cb)
    expect_equal(body(g_tr), quote(y + (2 + x)))

    h <- function(f, y) y + f(y)
    h_tr <- foolbox:::depth_first_rewrite_function(h, cb)
    expect_equal(body(h_tr), quote(y + f(y)))
})

test_that("we warn when we see unknown functions", {
    f <- function(x) x
    f_cb <- function(expr, env, ...) {
        call_fn <- eval(expr[[1]], env)
        stopifnot(identical(call_fn, f))
        quote(2 + x)
    }
    cb <- rewrite_callbacks() %>% add_call_callback(fn = f, cb = f_cb)

    g <- function(y) h(y) + f(y)
    g_tr <- expect_warning(
        depth_first_rewrite_function(g, cb),
        "The function h .*"
    )
    expect_equal(body(g_tr), quote(h(y) + (2 + x)))
})

test_that("we can pass user-data along in traversals", {
    f <- function(x) x

    f_cb <- function(expr, env, n, ...) {
        rlang::expr(!!n + x)
    }
    cb <- rewrite_callbacks() %>% add_call_callback(fn = f, cb = f_cb)

    g <- function(y) y + f(y)
    g_tr <- depth_first_rewrite_function(g, cb, n = 2)
    expect_equal(body(g_tr), quote(y + (2 + x)))
})

test_that("we can collect top-down information down a traversal", {
    collect_bound_variables <- function(expr, topdown, ...) {
        if (expr[[1]] == "function") {
            if (length(expr[[2]]) > 0)
                topdown$bound_vars <- c(names(expr[[2]]), topdown$bound_vars)
        }
        topdown
    }
    handle_pairlist <- function(expr, ...) {
        n <- names(expr)
        n[n != n]
    }
    collect_local_variables <- function(expr, bottomup, ...) {
        result <- unlist(bottomup)
        if (expr[[1]] == "<-" && rlang::is_symbol(expr[[2]])) {
            local_var <- as.character(expr[[2]])
            result <- c(local_var, result)
        }
        result
    }

    collect_unbound_variables <- function(expr, topdown, ...) {
        var <- as.character(expr)
        if (!(var %in% topdown$bound_vars)) {
            list(unbound = list(var))
        } else {
            list()
        }
    }

    cb <- analysis_callbacks() %>%
        with_symbol_callback(collect_unbound_variables) %>%
        with_pairlist_callback(handle_pairlist) %>%
        with_topdown_call_callback(collect_bound_variables)

    traverse <- function(fun) {
        depth_first_analyse_function(
            fun, cb,
            topdown = list(bound_vars = names(formals(fun)))
        )
    }
    f <- function(x, y) x + y
    expect_equal(traverse(f), list(unbound = list("+")))

    f <- function(x) x + y
    expect_equal(traverse(f), list(unbound = list("+", "y")))

    f <- function() x + y
    expect_equal(traverse(f), list(unbound = list("+", "x", "y")))

    f <- function() function(x) x + y
    expect_equal(traverse(f), list(unbound = list("function", "+", "y")))

    f <- function() function(x) function(y) x + y
    expect_equal(traverse(f), list(unbound = list("function", "function", "+")))

    f <- function(x) {
        y <- 2 * x
        x + y
    }
    # While y *is* bound, it is as a local variable. We cannot guarantee
    # to catch those, so I haven't tried in this test. The variable
    # appears twice because I do not remove duplicates in the test.
    expect_equal(traverse(f), list(unbound = list(
        "{", "<-", "y", "*", "+", "y"
    )))
})

test_that("we have an escape-hatch to skip past sub-trees", {
    symbols_seen <- c()
    collect_symbols <- function(expr, ...) {
        symbols_seen <<- c(as.character(expr), symbols_seen)
        expr
    }
    skip_function_def_bodies <- function(expr, topdown, skip, ...) {
        if (expr[[1]] == "function") skip(expr)
        topdown
    }

    cb <- rewrite_callbacks() %>%
        with_symbol_callback(collect_symbols) %>%
        with_topdown_call_callback(skip_function_def_bodies)
    collect <- . %>% rewrite() %>% rewrite_with(cb)

    f <- function(x, y) x + y + z
    collect(f)
    expect_equal(symbols_seen, c("z", "y", "x", "+", "+"))

    f <- function(x, y) {
        g <- function(w, u, v) w + u + v
        z <- g(1, 2, 3)
        x + y + z
    }
    symbols_seen <- c()
    collect(f)
    expect_equal(symbols_seen, c(
        "z", "y", "x", "+", "+", "g", "z", "<-", "g", "<-", "{"
    ))
})


test_that("we chain callbacks", {
    g <- function(x) 2 * x
    f <- function(x, y) g(x + y)

    first <- function(expr, next_cb, ...)
        next_cb(quote(g(y - x)), ...)
    cb <- rewrite_callbacks() %>%
        add_call_callback(g, first)
    f_tr <- depth_first_rewrite_function(f, cb)
    expect_equal(body(f_tr), quote(g(y - x)))

    second <- function(expr, ...) expr[[2]]
    cb <- rewrite_callbacks() %>%
        add_call_callback(g, second) %>%
        add_call_callback(g, first)

    f_tr <- depth_first_rewrite_function(f, cb)
    expect_equal(body(f_tr), quote(y - x))
})
