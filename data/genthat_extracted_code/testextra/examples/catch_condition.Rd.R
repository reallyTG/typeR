library(testextra)


### Name: catch_condition
### Title: Catch a condition for testing.
### Aliases: catch_condition catch_all_conditions

### ** Examples

(cond <- catch_condition(stop("catch me.")))
class(cond)

my_fun <- function(){
    message("a message")
    warning("a warning")
    pkg_message("a package message", scope="test")
    pkg_warning("a package warning", scope="test")
    pkg_error("a package error", scope='test')
}
conditions <- catch_all_conditions(my_fun())
conditions$messages
conditions$warnings
conditions$error  # only one error can be caught at a time.




