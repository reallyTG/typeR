## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

library(foolbox)

## ------------------------------------------------------------------------
f <- function(x, y) {
    a <- x + y
    b <- x - y
    2 * a - b^2
}

## ------------------------------------------------------------------------
collect_symbols <- function(expr, ...) {
    list(symbols = as.character(expr))
}
callbacks <- analysis_callbacks() %>% with_symbol_callback(collect_symbols)
f %>% analyse() %>% analyse_with(callbacks)

## ------------------------------------------------------------------------
f %>% analyse() %>% analyse_with(callbacks) %>% 
    unlist(use.names = FALSE) %>% unique()

## ------------------------------------------------------------------------
f %>% analyse() %>% analyse_with(
    analysis_callbacks() %>% with_symbol_callback(
        function(expr, ...) list(symbols = as.character(expr))
    )
) %>% unlist(use.names = FALSE) %>% unique()

## ------------------------------------------------------------------------
collect_symbols <- . %>% analyse() %>% analyse_with(
    analysis_callbacks() %>% with_symbol_callback(
        function(expr, ...) list(symbols = as.character(expr))
    )
) %>% unlist(use.names = FALSE) %>% unique()

## ------------------------------------------------------------------------
f %>% collect_symbols()

## ------------------------------------------------------------------------
subst_symbol <- function(fn, var, val) {
    var <- rlang::enexpr(var)
    val <- rlang::enexpr(val)
    fn %>% rewrite() %>% rewrite_with(
        rewrite_callbacks() %>% with_symbol_callback(
            function(expr, ...) if (expr == var) val else expr
        )
    )
}

## ------------------------------------------------------------------------
f <- function(x, y) 2 * x + y ** 2

## ------------------------------------------------------------------------
f %>% subst_symbol(x, 3)

## ------------------------------------------------------------------------
subst_symbol <- function(fn, var, val) {
    var <- rlang::enexpr(var)
    val <- rlang::enexpr(val)
    fn %>% rewrite() %>% rewrite_with(
        rewrite_callbacks() %>% with_symbol_callback(
            function(expr, ...) if (expr == var) val else expr
        )
    ) %>% remove_formal_(var)
}
f %>% subst_symbol(x, 3)

## ------------------------------------------------------------------------
f <- function(x, y) x + y
f %>% rewrite() %>% rewrite_with(
    rewrite_callbacks() %>% with_symbol_callback(
        function(expr, ...) if (expr == quote(x)) 1 else expr
    ) %>% with_symbol_callback(
        function(expr, ...) if (expr == quote(y)) 1 else expr
    )
)

## ------------------------------------------------------------------------
f %>% rewrite() %>% rewrite_with(
    rewrite_callbacks() %>% with_symbol_callback(
        function(expr, ...) if (expr == quote(x)) 1 else expr
    ) %>% with_symbol_callback(
        function(expr, next_cb, ...) if (expr == quote(y)) 1 else next_cb(expr)
    )
)

## ------------------------------------------------------------------------
get_symbol <- function(expr, bottomup, ...) {
    bottomup <- merge_bottomup(bottomup)
    if (rlang::is_symbol(expr[[2]]))
        bottomup$variables <- c(as.character(expr[[2]]), bottomup$variables)
    bottomup
}
collect_symbols <- . %>% analyse() %>% analyse_with(
    analysis_callbacks() %>% 
        add_call_callback(`<-`, get_symbol) %>%
        add_call_callback(`=`, get_symbol)
    ) %>% unlist(use.names = FALSE) %>% unique()

## ------------------------------------------------------------------------
f <- function(x, y) {
    z <- x + y
    x + y + z
}
f %>% collect_symbols()

## ------------------------------------------------------------------------
f <- function(x, y) {
    a <- 2 * x + y
    g <- function(z) {
        a - z
    }
    g(-x)
}

## ------------------------------------------------------------------------
annotated_f <- f %>% rewrite()

## ------------------------------------------------------------------------
attr(body(annotated_f), "assigned_symbols")
attr(body(annotated_f), "bound")

## ------------------------------------------------------------------------
g_body <- body(annotated_f)[[3]][[3]][[3]]
g_body

## ------------------------------------------------------------------------
inline <- function(fn, f) {
    fn %>% rewrite_with(
        rewrite_callbacks() %>% add_call_callback(
            f, function(expr, ...) {
                new_expr <- body(f)
                attr(new_expr, "old_expr") <- expr
                new_expr
            }
        )
    )
}
reverse <- function(fn) {
    fn %>% rewrite_with(
        rewrite_callbacks() %>% with_call_callback(
            function(expr, ...) {
                old_expr <- attr(expr, "old_expr")
                if (!is.null(old_expr)) old_expr
                else expr
            }
        )
    )
}

## ------------------------------------------------------------------------
f <- function(x, y) x + y
g <- function(x) f(x, 2*x)
h <- g %>% rewrite() %>% inline(f)
h

## ------------------------------------------------------------------------
h %>% rewrite() %>% reverse()

## ------------------------------------------------------------------------
h <- rewrites[inline(f)] < function(x) f(x, 2*x)
h

## ------------------------------------------------------------------------
rewrites[inline(f),reverse()] < function(x) f(x, 2*x)

