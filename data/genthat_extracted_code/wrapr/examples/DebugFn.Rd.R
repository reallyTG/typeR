library(wrapr)


### Name: DebugFn
### Title: Capture arguments of exception throwing function call for later
###   debugging.
### Aliases: DebugFn

### ** Examples


saveDest <- paste0(tempfile('debug'),'.RDS')
f <- function(i) { (1:10)[[i]] }
# correct run
DebugFn(saveDest, f, 5)
# now re-run
# capture error on incorrect run
tryCatch(
   DebugFn(saveDest, f, 12),
   error = function(e) { print(e) })
# examine details
situation <- readRDS(saveDest)
str(situation)
# fix and re-run
situation$args[[1]] <- 6
do.call(situation$fn_name,situation$args)
# clean up
file.remove(saveDest)




