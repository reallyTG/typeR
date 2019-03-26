## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)
set.seed(1234)

## ------------------------------------------------------------------------
rescale <- function(x, y) {
    (y - mean(x)) / sd(x)
}

## ------------------------------------------------------------------------
rescale_curry <- function(x) function(y) {
    (y - mean(x)) / sd(x)
}

## ------------------------------------------------------------------------
rescale_curry_pe <- function(x) {
    mean_x <- mean(x)
    sd_x <- sd(x)
    function(y) (y - mean_x) / sd_x
}

## ---- cache=TRUE---------------------------------------------------------
time_uncurry <- function(f) {
    n <- 500
    x <- rnorm(1000,  0,   1)
    y <- rnorm(1000, 10, 100)
    replicate(n, f(x,y))
}
time_curry <- function(f) {
	n <- 500
    x <- rnorm(1000,  0,   1)
    y <- rnorm(1000, 10, 100)
    g <- f(x)
	replicate(n, g(y))
}

microbenchmark::microbenchmark(
    time_uncurry(rescale),
    time_curry(rescale_curry),
    time_curry(rescale_curry_pe)
)

## ------------------------------------------------------------------------
library(foolbox)

subst_var_callback <- function(var, val) {
    function(expr, ...) {
        if (expr == var) rlang::expr(!!val)
        else expr
    }
}

pe <- function(fn, var, val) {
    var <- rlang::enexpr(var) ; stopifnot(rlang::is_symbol(var))
    force(val)
    fn %>% rewrite() %>% rewrite_with(
        rewrite_callbacks() %>%
            with_symbol_callback(subst_var_callback(var, val))
    ) %>% remove_formal_(var)
}

## ------------------------------------------------------------------------
test_x <- rnorm(3, 0, 1) %>% round(digits = 2)
rescale_pe <- rescale %>% pe(x, test_x)
rescale_pe

test_y <- rnorm(5, 10, 100)
rescale(test_x, test_y)
rescale_pe(test_y)

## ---- cache=TRUE---------------------------------------------------------
microbenchmark::microbenchmark(
    time_uncurry(rescale), 
    time_curry(function(x) pe(rescale, x, x))
)

## ------------------------------------------------------------------------
eval_attempt <- function(expr, env) {
    tryCatch(rlang::expr(!!eval(expr, env)),
             error = function(e) expr)
}

call_callback <- function(expr, env, ...) {
    call_args_atomic <- rlang::call_args(expr) %>% 
        Map(rlang::is_atomic, .) %>% unlist
    if (any(!call_args_atomic)) expr
    else eval_attempt(expr, env)
}

pe <- function(fn, var, val) {
    var <- rlang::enexpr(var) ; stopifnot(rlang::is_symbol(var))
    force(val)
    fn %>% rewrite() %>% rewrite_with(
        rewrite_callbacks() %>%
            with_symbol_callback(subst_var_callback(var,val)) %>%
            with_call_callback(call_callback)
    ) %>% remove_formal_(var)
}

## ------------------------------------------------------------------------
rescale_pe <- rescale %>% pe(x, test_x)
rescale_pe
rescale(test_x, test_y)
rescale_pe(test_y)

## ---- cache=TRUE---------------------------------------------------------
microbenchmark::microbenchmark(
    time_uncurry(rescale), 
    time_curry(function(x) pe(rescale, x, x))
)

## ------------------------------------------------------------------------
make_rescale <- function(m) {
    function(x, y) (y - m(x))/sd(x)
}
closure_rescale <- make_rescale(mean)
closure_rescale %>% pe(x, test_x)

## ------------------------------------------------------------------------
rescale_ms <- function(x, y, mean, sd)
    (y - mean(x))/sd(x)

rescale_ms %>% pe(x, test_x)

## ------------------------------------------------------------------------
is_bound <- function(var, expr) {
    (rlang::is_symbol(var) || is.character(var)) &&
        as.character(var) %in% attr(expr, "bound")
}
call_callback <- function(expr, env, ...) {
    call_args_atomic <- rlang::call_args(expr) %>% 
        Map(rlang::is_atomic, .) %>% unlist
    if (any(!call_args_atomic) || is_bound(expr[[1]], expr)) expr
    else eval_attempt(expr, env) 
}

pe <- function(fn, var, val) {
    var <- rlang::enexpr(var) ; stopifnot(rlang::is_symbol(var))
    force(val)
    fn %>% rewrite() %>% rewrite_with(
        rewrite_callbacks() %>%
            with_symbol_callback(subst_var_callback(var,val)) %>%
            with_call_callback(call_callback)
    ) %>% remove_formal_(var)
}

rescale %>% pe(x, test_x)
rescale_ms %>% pe(x, test_x)

## ------------------------------------------------------------------------
rescale_ms %>% pe(x, test_x) %>% pe(mean, mean)
rescale_ms %>% pe(x, test_x) %>% pe(mean, mean) %>% pe(sd, sd)

## ------------------------------------------------------------------------
rescale_nested <- function(x, y) {
    move <- function(x, y) y - mean(x)
    move(x, y) / sd(x)
}
rescale_nested %>% pe(x, test_x)

## ------------------------------------------------------------------------
skip_overscoped_functions <- function(var_symbol) {
    var <- as.character(var_symbol)
    function(expr, skip, ...) {
        # in `function` expressions, the pair-list is element 2
        if (var %in% names(expr[[2]])) {
            skip(expr)
        }
    }
}
pe <- function(fn, var, val) {
    var <- rlang::enexpr(var) ; stopifnot(rlang::is_symbol(var))
    force(val)
    fn %>% rewrite() %>% rewrite_with(
        rewrite_callbacks() %>%
            with_symbol_callback(subst_var_callback(var,val)) %>%
            with_call_callback(call_callback) %>%
            add_topdown_callback(`function`, skip_overscoped_functions(var))
    ) %>% remove_formal_(var)
}

rescale_nested %>% pe(x, test_x)

## ------------------------------------------------------------------------
pe_call <- function(fun, expr) {
    params <- rlang::call_args(match.call(fun, expr))
    substitutable <- Map(rlang::is_atomic, params) %>% unlist
    not_substitutable <- params[!substitutable]
    params <- params[substitutable]
    param_names <- names(params)
    
    for (i in seq_along(params)) {
        var <- as.symbol(param_names[i])
        fun <- fun %>% pe_(var, params[[i]])
    }
    
    rlang::expr((!!fun)(!!!not_substitutable))
}

## ------------------------------------------------------------------------
collect_all_symbols <- function(expr) {
    expr %>% analyse_expr() %>% analyse_expr_with(
        analysis_callbacks() %>% with_symbol_callback(
            function(expr, ...) list(symbols = as.character(expr))
    )) %>% unlist(use.names = FALSE)
}

## ------------------------------------------------------------------------
save_local_functions <- function(expr, env, params, var, fun_table, ...) {
    if (!rlang::is_symbol(expr[[1]])) 
        return(expr)
    if (!rlang::is_call(expr[[3]]) || length(expr[[3]]) < 2 ||
        expr[[3]][[1]] != "function") 
        return(expr)
    
    fun_name <- as.character(expr[[2]])
    fun_formals <- expr[[3]][[2]]
    fun_body <- expr[[3]][[3]]
    
    fun_parameters <- names(fun_formals)
    fun_used_vars <- collect_all_symbols(fun_body)
    local_vars <- attr(expr, "bound")
    
    # figure out if the function uses local variables that are not
    # passed through the formal parameters
    closure_scope <- setdiff(fun_used_vars, fun_parameters)
    local_closure_scope <- intersect(local_vars, closure_scope)
    if (length(local_closure_scope) > 2) 
        return(expr) 
    if (length(local_closure_scope) == 1 &&
        local_closure_scope != as.character(var))       
        return(expr)
    
    # create the function and save it as an attribute
    stopifnot(!exists(fun_name, fun_table))
    fun_table[[fun_name]] <- eval(expr[[3]], env)
    
    expr
}

## ------------------------------------------------------------------------
call_callback <- function(expr, env, fun_table, ...) {
    call_args_atomic <- rlang::call_args(expr) %>% 
        Map(rlang::is_atomic, .) %>% unlist
    
    fun_name <- as.character(expr[[1]])
    if (all(call_args_atomic) && !is_bound(fun_name, expr))
        return(eval_attempt(expr, env))

    # if it exists in the function table, we can try a partial evaluation 
    # of it
    if (is_bound(fun_name, expr) && exists(fun_name, fun_table)) {
        fun <- fun_table[[fun_name]]
        
        # if we have all the arguments, we can just call the function
        # and insert the result
        if (all(call_args_atomic))
            return(do.call(fun, rlang::call_args(expr)))
        
        # otherwise, we have to try a partial substitution of the function
        return(pe_call(fun, expr))
    }
        
    expr
}

## ------------------------------------------------------------------------
pe_ <- function(fn, var, val) {
    stopifnot(rlang::is_symbol(var))
    force(val)
    fn %>% rewrite() %>% rewrite_with(
        rewrite_callbacks() %>%
            with_symbol_callback(subst_var_callback(var,val)) %>%
            with_call_callback(call_callback) %>%
            add_topdown_callback(`function`, skip_overscoped_functions(var)) %>%
            add_topdown_callback(`<-`, save_local_functions) %>%
            add_topdown_callback(`=`, save_local_functions),
        var = var, fun_table = rlang::new_environment()
    ) %>% remove_formal_(var)
}
pe <- function(fn, var, val) {
    var <- rlang::enexpr(var)
    pe_(fn, var, val)
}

rescale_nested <- function(x, y) {
    move <- function(x, y) y - mean(x)
    move(x, y) / sd(x)
}
rescale_nested %>% pe(x, test_x)

## ------------------------------------------------------------------------
rescale_nested_pe <- rescale_nested %>% pe(x, test_x)
rescale_nested_pe

rescale(test_x, test_y)
rescale_nested(test_x, test_y)
rescale_nested_pe(test_y)

## ------------------------------------------------------------------------
save_local_functions <- function(expr, env, params, var, fun_table, ...) {
    if (!rlang::is_symbol(expr[[1]])) 
        return(expr)
    if (!rlang::is_call(expr[[3]]) || length(expr[[3]]) < 2 ||
        expr[[3]][[1]] != "function") 
        return(expr)
    
    fun_name <- as.character(expr[[2]])
    stopifnot(!exists(fun_name, fun_table))
    fun_table[[fun_name]] <- eval(expr[[3]], env)
    
    expr
}

## ------------------------------------------------------------------------
rescale_nested <- function(x, y, m) {
    mean <- m
    move <- function(x, y) y - mean(x)
    move(x, y) / sd(x)
}

rescale_nested %>% pe(x, test_x)

