library(rcheology)


### Name: fun_changed
### Title: Check if a core R function changed between R versions
### Aliases: fun_changed

### ** Examples

fun_changed("debugonce")
## No test: 
fun_changed("debugonce", "3.4.0", "3.4.3")
fun_changed("debugonce", "3.3.0", "3.4.3")
## End(No test)



