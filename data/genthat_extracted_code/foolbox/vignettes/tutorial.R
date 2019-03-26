## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  fig.path = "man/figures/README-",
  out.width = "100%"
)

library(magrittr)
library(foolbox)

## ------------------------------------------------------------------------
f <- function(x) {
  y <- 2 * x
  x + y
}

## ------------------------------------------------------------------------
expr <- body(f)
expr[[1]]
expr[[2]]
expr[[3]]

## ------------------------------------------------------------------------
f <- function(x) 2 * x
g <- function(y) f(y)

## ------------------------------------------------------------------------
callbacks <- rewrite_callbacks() %>% 
    add_call_callback(f, function(expr, ...) quote(2 * x))

g %>% rewrite() %>% rewrite_with(callbacks)

## ------------------------------------------------------------------------
g %>% rewrite() %>% rewrite_with(
    rewrite_callbacks() %>% add_call_callback(f, function(expr, ...) quote(2 * x))
)

## ------------------------------------------------------------------------
subst_f <- . %>% rewrite() %>% rewrite_with(
    rewrite_callbacks() %>% add_call_callback(f, function(expr, ...) quote(2 * x))
)

## ------------------------------------------------------------------------
g %>% subst_f

## ------------------------------------------------------------------------
h <- rewrites[subst_f] < function(x) f(x) + 2 * f(x)
h

## ------------------------------------------------------------------------
set_invariant <- function(fn, var, predicate) {
    
    var <- rlang::enexpr(var)
    stopifnot(rlang::is_symbol(var))
    
    predicate <- rlang::enexpr(predicate)
    
    set_invariant_callback <- function(expr, ...) {
        if (expr[[2]] == var) {
            rlang::expr({
                !!var <- !!expr[[3]]
                stopifnot(!!predicate)
            })
        } else {
            expr    
        }
    }
    
    fn %>% rewrite() %>% rewrite_with(
        rewrite_callbacks() %>%
        add_call_callback(`<-`, set_invariant_callback) %>%
        add_call_callback(`=`, set_invariant_callback)
    )
}

## ------------------------------------------------------------------------
f <- function(x, y) {
    a <- x + y
    2 * a^2 + a
}

f %>% set_invariant(a, a > 0)

## ------------------------------------------------------------------------
f <- function(x, y) {
    a <- x + y
    g <- function(a) {
        a <- a + 42
        a
    }
    h <- function(x) {
        a <<- -x
        a^2
    }
    x <- h(y)
    2 * a^2 + g(-x)
}

f %>% set_invariant(a, a > 0)

## ------------------------------------------------------------------------
set_invariant <- function(fn, var, predicate) {
    
    var <- rlang::enexpr(var)
    stopifnot(rlang::is_symbol(var))
    
    predicate <- rlang::enexpr(predicate)
    
    set_invariant_callback <- function(expr, topdown, ...) {
        if (expr[[2]] == var) {
            if ( (expr[[1]] == "<-" || expr[[1]] == "=") &&  !(topdown$nested) ) {
                return(rlang::expr({
                    !!var <- !!expr[[3]]
                    stopifnot(!!predicate)
                }))
            }
            if (expr[[1]] == '<<-') {
                return(rlang::expr({
                    !!var <<- !!expr[[3]]
                    stopifnot(!!predicate)
                }))
            }
        }
        # if we don't return earlier, we keep the expression
        expr    
    }
    nested_functions_callback <- function(expr, skip, topdown, ...) {
        topdown$nested <- TRUE
        topdown
    }
    
    fn %>% rewrite() %>% rewrite_with(
        rewrite_callbacks() %>%
        add_call_callback(`<-`, set_invariant_callback) %>%
        add_call_callback(`=`, set_invariant_callback) %>%
        add_call_callback(`<<-`, set_invariant_callback) %>%
        add_topdown_callback(`function`, nested_functions_callback),
        topdown = list(nested=FALSE)
    )
}

## ------------------------------------------------------------------------
f <- function(x, y) {
    a <- x + y
    g <- function(a) {
        a <- a + 42
        a
    }
    h <- function(x) {
        a <<- -x
        a^2
    }
    x <- h(y)
    2 * a^2 + g(-x)
}

f %>% set_invariant(a, a > 0)

## ------------------------------------------------------------------------
f <- function(x, y) {
    a <- x + y
    2 * a^2 + a
}

f %>% set_invariant(a, a > 0) %>% set_invariant(a, is.numeric(a))

## ------------------------------------------------------------------------
inline <- function(fn, f) {
    
    # only inline if `f` has no assignments... otherwise, too much
    # analysis is needed for this simple example.
    check_assignment <- function(expr, ...) {
        stop("Assignment! I told you not to!")
    }
    f %>% analyse() %>% analyse_with(
        analysis_callbacks() %>%
            add_topdown_callback(`<-`, check_assignment) %>%
            add_topdown_callback(`=`, check_assignment)
    )
    
    defaults <- formals(f)
    remap_symbols <- function(expr, map, ...) {
        var_name <- as.character(expr)
        if (var_name %in% names(map)) {
            rlang::expr( ( !!map[[var_name]] ) )
        } else {
            expr
        }
    }
    remap_expr <- function(expr, map) {
        expr %>% rewrite_expr() %>% rewrite_expr_with(
            rewrite_callbacks() %>% with_symbol_callback(remap_symbols),
            map = map
        )
    }
    
    inline_callback <- function(expr, ...) {
        map <- defaults
        args <- as.list(match.call(f, expr)[-1])
        vars <- names(args)
        for (var in vars) {
            map[[var]] <- args[[var]]
        }
        for (var in names(defaults)) {
            if (! var %in% vars) {
                expr_with_varsubst <- eval(substitute(defaults[[var]], map)) 
                map[[var]] <- expr_with_varsubst %>% remap_expr(map)
            }
        }
        
        body(f) %>% remap_expr(map)
    }
    
    fn %>% rewrite() %>% rewrite_with(
        rewrite_callbacks() %>% 
            add_call_callback(f, inline_callback)
    )
}

## ------------------------------------------------------------------------
f <- function(x, y = x) 2 * x + y
g <- function(z) f(z - 3) + f(y = z + 3, x = 4)
g %>% inline(f)

## ------------------------------------------------------------------------
g <- rewrites[inline(f)] < function(z) f(z - 3) + f(y = z + 3, x = 4)
g

