context("Static analysis")

## Collection ###########################################################
test_that("we can collect the symbols in a simple expression", {
    expr <- quote(42)
    res <- foolbox:::collect_assigned_symbols_in_expression(expr, env = environment())
    expect_equal(res, list())

    expr <- quote(x <- 42)
    res <- foolbox:::collect_assigned_symbols_in_expression(expr, env = environment())
    expect_equal(res, list(locals = "x"))
})

test_that("we can collect the symbols in a simple function", {
    f <- function() {
        42
    }
    res <- collect_assigned_symbols_in_function(f)
    expect_equal(res, character(0))

    f <- function() {
        x <- 42
    }
    res <- collect_assigned_symbols_in_function(f)
    expect_equal(res, "x")

    f <- function() {
        x <- 42
        y <- 24
        x + y
    }
    res <- collect_assigned_symbols_in_function(f)
    expect_equal(res, c("x", "y"))

    f <- function(x = 42) {
        y <- 24
        x + y
    }
    res <- collect_assigned_symbols_in_function(f)
    expect_equal(res, "y")

    # we shouldn't include formal arguments
    f <- function(x = 42) {
        x <- 42
        y <- 24
        x + y
    }
    res <- collect_assigned_symbols_in_function(f)
    expect_equal(res, "y")

    # we shouldn't include duplications
    f <- function(x = 42) {
        y <- x
        x <- 42
        y <- x + 2
        x + y
    }
    res <- collect_assigned_symbols_in_function(f)
    expect_equal(res, "y")
})

test_that("we can collect the symbols when there are for-loops", {
    f <- function(n) {
        for (i in 1:n) i
    }
    res <- collect_assigned_symbols_in_function(f)
    expect_equal(res, "i")

    f <- function(n) {
        x <- 0
        for (i in 1:n) {
            x <- x + i
        }
    }
    res <- collect_assigned_symbols_in_function(f)
    expect_equal(res, c("x", "i"))
})

test_that("we don't collect symbols we know are in a different scope", {
    f <- function(df) {
        with(df, z <- x + y)
    }
    res <- collect_assigned_symbols_in_function(f)
    expect_equal(res, character())

    f <- function(x) {
        y <- 2 * x
        function(x) {
            z <- 2 * x
        }
    }
    res <- collect_assigned_symbols_in_function(f)
    expect_equal(res, c("y"))
})


## Annotation ###########################################################
test_that("we can annotate with the symbols in a simple function", {
    f <- function() {
        42
    }
    res <- annotate_bound_symbols_in_function(f)
    expect_equal(attr(body(res), "assigned_symbols"), character(0))
    expect_equal(attr(body(res), "bound"), character(0))

    f <- function() {
        x <- 42
    }
    res <- annotate_bound_symbols_in_function(f)
    expect_equal(attr(body(res), "assigned_symbols"), "x")
    expect_equal(attr(body(res), "bound"), "x")

    f <- function() {
        x <- 42
        y <- 24
        x + y
    }
    res <- annotate_bound_symbols_in_function(f)
    expect_equal(attr(body(res), "assigned_symbols"), c("x", "y"))
    expect_equal(attr(body(res), "bound"), c("x", "y"))

    # when there is a formal parameter, that is also a bound variable
    # although it is not an assigned symbol.
    f <- function(x = 42) {
        y <- 24
        x + y
    }
    res <- annotate_bound_symbols_in_function(f)
    expect_equal(attr(body(res), "assigned_symbols"), "y")
    expect_equal(attr(body(res), "bound"), c("x", "y"))

    # If we analyse the full function, we might not want to consider
    # formal parameters as local variables, but inside the *body*
    # of this function, we do assign to `x`, so we include it in
    # the annotation. It defintely belongs in the bound variables.
    f <- function(x = 42) {
        x <- 42
        y <- 24
        x + y
    }
    res <- annotate_bound_symbols_in_function(f)
    expect_equal(attr(body(res), "assigned_symbols"), c("x", "y"))
    expect_equal(attr(body(res), "bound"), c("x", "y"))

    # we shouldn't include duplications
    f <- function(x = 42) {
        y <- x
        x <- 42
        y <- x + 2
        x + y
    }
    res <- annotate_bound_symbols_in_function(f)
    expect_equal(attr(body(res), "assigned_symbols"), c("y", "x"))
    # the bound variables see the formal parameter first, so x before y
    expect_equal(attr(body(res), "bound"), c("x", "y"))
})

test_that("we hande `=` assignments as well", {
    f <- function() {
        x <- 42
    }
    res <- annotate_bound_symbols_in_function(f)
    expect_equal(attr(body(res), "assigned_symbols"), "x")
    expect_equal(attr(body(res), "bound"), "x")

    f <- function() {
        x <- 42
        y <- 24
        x + y
    }
    res <- annotate_bound_symbols_in_function(f)
    expect_equal(attr(body(res), "assigned_symbols"), c("x", "y"))
    expect_equal(attr(body(res), "bound"), c("x", "y"))

    # when there is a formal parameter, that is also a bound variable
    # although it is not an assigned symbol.
    f <- function(x = 42) {
        y <- 24
        x + y
    }
    res <- annotate_bound_symbols_in_function(f)
    expect_equal(attr(body(res), "assigned_symbols"), "y")
    expect_equal(attr(body(res), "bound"), c("x", "y"))

    # If we analyse the full function, we might not want to consider
    # formal parameters as local variables, but inside the *body*
    # of this function, we do assign to `x`, so we include it in
    # the annotation. It defintely belongs in the bound variables.
    f <- function(x = 42) {
        x <- 42
        y <- 24
        x + y
    }
    res <- annotate_bound_symbols_in_function(f)
    expect_equal(attr(body(res), "assigned_symbols"), c("x", "y"))
    expect_equal(attr(body(res), "bound"), c("x", "y"))

    # we shouldn't include duplications
    f <- function(x = 42) {
        y <- x
        x <- 42
        y <- x + 2
        x + y
    }
    res <- annotate_bound_symbols_in_function(f)
    expect_equal(attr(body(res), "assigned_symbols"), c("y", "x"))
    # the bound variables see the formal parameter first, so x before y
    expect_equal(attr(body(res), "bound"), c("x", "y"))
})

test_that("we can annotate with symbols when there are for-loops", {
    f <- function(n) {
        for (i in 1:n) i
    }
    res <- annotate_bound_symbols_in_function(f)
    expect_equal(attr(body(res), "assigned_symbols"), "i")
    expect_equal(attr(body(res), "bound"), c("n", "i"))

    f <- function(n) {
        x <- 0
        for (i in 1:n) {
            x <- x + i
        }
    }
    res <- annotate_bound_symbols_in_function(f)
    expect_equal(attr(body(res), "assigned_symbols"), c("x", "i"))
    expect_equal(attr(body(res), "bound"), c("n", "x", "i"))
})

test_that("we don't annotate with symbols we know are in a different scope", {
    f <- function(df) {
        with(df, z <- x + y)
    }
    res <- annotate_bound_symbols_in_function(f)
    expect_equal(attr(body(res), "assigned_symbols"), character())
    expect_equal(attr(body(res), "bound"), "df")

    f <- function(x) {
        y <- 2 * x
        function(x) {
            z <- 2 * x
        }
    }
    res <- annotate_bound_symbols_in_function(f)
    expect_equal(attr(body(res), "assigned_symbols"), c("y"))
    expect_equal(attr(body(res), "bound"), c("x", "y"))

    nested_body <- body(res)[[3]][[3]]
    expect_equal(attr(nested_body, "assigned_symbols"), c("z"))
    # since the inner function is a cosure, it cna see "y". It can also
    # see x -- we have propagated both the inner and the outper, but ok
    # it doesn't matter... there should just be an x in scope.
    expect_equal(attr(nested_body, "bound"), c("x", "y", "z"))
})


test_that("we can handle local functions", {
    f <- function(x) {
        y <- 2 * x
        g <- function(x) {
            z <- 2 * x
        }
        g(y)
    }

    f_an <- annotate_bound_symbols_in_function(f)
    expect_equal(attr(body(f_an), "assigned_symbols"), c("y", "g"))
    expect_equal(attr(body(f_an), "bound"), c("x", "y", "g"))

    # Don't confuse named parameters with assignments
    f <- function(x) {
        y <- 2 * x
        g <- function(v = x) {
            z <- 2 * v
        }
        g(y)
    }

    f_an <- annotate_bound_symbols_in_function(f)
    expect_equal(attr(body(f_an), "assigned_symbols"), c("y", "g"))
    expect_equal(attr(body(f_an), "bound"), c("x", "y", "g"))

    nested_fun <- body(f_an)[[3]][[3]]
    expect_equal(attr(nested_fun, "assigned_symbols"), character(0))
    expect_equal(attr(nested_fun, "bound"), c("v", "x", "y", "g"))

    nested_body <- nested_fun[[3]]
    expect_equal(attr(nested_body, "assigned_symbols"), "z")
    expect_equal(attr(nested_body, "bound"), c("v", "x", "y", "g", "z"))

    f <- function(x) {
        y <- 2 * x
        g <- function(v = x) {
            z <- 2 * v
        }
        g(v = y)
    }

    f_an <- annotate_bound_symbols_in_function(f)
    expect_equal(attr(body(f_an), "assigned_symbols"), c("y", "g"))
    expect_equal(attr(body(f_an), "bound"), c("x", "y", "g"))

    nested_fun <- body(f_an)[[3]][[3]]
    expect_equal(attr(nested_fun, "assigned_symbols"), character(0))
    expect_equal(attr(nested_fun, "bound"), c("v", "x", "y", "g"))

    nested_body <- nested_fun[[3]]
    expect_equal(attr(nested_body, "assigned_symbols"), "z")
    expect_equal(attr(nested_body, "bound"), c("v", "x", "y", "g", "z"))

    # with <- in function call, we *should* consider it an assignment
    f <- function(x) {
        y <- 2 * x
        g <- function(v = x) {
            z <- 2 * v
        }
        g(v <- y)
    }

    f_an <- annotate_bound_symbols_in_function(f)
    expect_equal(attr(body(f_an), "assigned_symbols"), c("y", "g", "v"))
    expect_equal(attr(body(f_an), "bound"), c("x", "y", "g", "v"))

    nested_fun <- body(f_an)[[3]][[3]]
    expect_equal(attr(nested_fun, "assigned_symbols"), character(0))
    expect_equal(attr(nested_fun, "bound"), c("v", "x", "y", "g"))

    nested_body <- nested_fun[[3]]
    expect_equal(attr(nested_body, "assigned_symbols"), "z")
    expect_equal(attr(nested_body, "bound"), c("v", "x", "y", "g", "z"))


    # We shouldn't confuse a local function with
    # one from the tranformation-scope.
    g <- function() stop("outer")
    cb <- rewrite_callbacks() %>%
        add_call_callback(g, function(expr, ...) stop("don't call this"))
    expect_warning(
        res <- depth_first_rewrite_function(f_an, cb),
        "The function g is not processed .*"
    )
    expect_equal(body(f_an), body(res))
})
