library(rlang)


### Name: rst_abort
### Title: Jump to the abort restart
### Aliases: rst_abort

### ** Examples

# The `abort` restart is a bit special in that it is always
# registered in a R session. You will always find it on the restart
# stack because it is established at top level:
rst_list()

# You can use the `above` restart to jump to top level without
# signalling an error:
## Not run: 
##D fn <- function() {
##D   cat("aborting...\n")
##D   rst_abort()
##D   cat("This is never called\n")
##D }
##D {
##D   fn()
##D   cat("This is never called\n")
##D }
## End(Not run)

# The `above` restart is the target that R uses to jump to top
# level when critical errors are signalled:
## Not run: 
##D {
##D   abort("error")
##D   cat("This is never called\n")
##D }
## End(Not run)

# If another `abort` restart is specified, errors are signalled as
# usual but then control flow resumes with from the new restart:
## Not run: 
##D out <- NULL
##D {
##D   out <- with_restarts(abort("error"), abort = function() "restart!")
##D   cat("This is called\n")
##D }
##D cat("`out` has now become:", out, "\n")
## End(Not run)



