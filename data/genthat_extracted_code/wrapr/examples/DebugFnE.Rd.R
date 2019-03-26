library(wrapr)


### Name: DebugFnE
### Title: Capture arguments and environment of exception throwing function
###   call for later debugging.
### Aliases: DebugFnE

### ** Examples


saveDest <- paste0(tempfile('debug'),'.RDS')
f <- function(i) { (1:10)[[i]] }
# correct run
DebugFnE(saveDest, f, 5)
# now re-run
# capture error on incorrect run
tryCatch(
   DebugFnE(saveDest, f, 12),
   error = function(e) { print(e) })
# examine details
situation <- readRDS(saveDest)
str(situation)
# fix and re-run
situation$args[[1]] <- 6
do.call(situation$fn, situation$args, envir=situation$env)
# clean up
file.remove(saveDest)




