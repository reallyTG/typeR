
# function that makes the testing of the same expectation for multiple expressions easier
test_that_for_all <- function(X, desc, code, envir = parent.frame()){
  stopifnot(is.character(X))
  
  # capture name of the first argument
  name_x <- as.character(substitute(X)) %>% stringr::str_replace("s$", "")
  
  # capture testing code 
  code <- substitute(code)
  
  # for each element in x replace ".name_xs" with element and call testinf function 
  purrr::map(X, function(x){
      code_x <- substitute_q(code, list(.fun = as.symbol(x)) %>% purrr::set_names(paste0(".", name_x)))
      
      # copy source code refernce to new expression
      attr(code_x, "srcref") <- attr(code, "srcref")
      
      # call test_code function avoiding ::: operator
      do.call(get("test_code", envir = asNamespace("testthat")), list(test = paste(desc, "for", name_x, x), code = code_x), envir = envir)
    })
}


# adapted from the pryr package
substitute_q <- function (x, env) 
{
  stopifnot(is.language(x))
  call <- substitute(substitute(x, env), list(x = x))
  eval(call)
}
