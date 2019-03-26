library(wrapr)


### Name: DebugFnW
### Title: Wrap a function for debugging.
### Aliases: DebugFnW

### ** Examples


saveDest <- paste0(tempfile('debug'),'.RDS')
f <- function(i) { (1:10)[[i]] }
df <- DebugFnW(saveDest,f)
# correct run
df(5)
# now re-run
# capture error on incorrect run
tryCatch(
   df(12),
   error = function(e) { print(e) })
# examine details
situation <- readRDS(saveDest)
str(situation)
# fix and re-run
situation$args[[1]] <- 6
do.call(situation$fn,situation$args)
# clean up
file.remove(saveDest)


f <- function(i) { (1:10)[[i]] }
curEnv <- environment()
writeBack <- function(sit) {
   assign('lastError', sit, envir=curEnv)
}
attr(writeBack,'name') <- 'writeBack'
df <- DebugFnW(writeBack,f)
tryCatch(
   df(12),
   error = function(e) { print(e) })
str(lastError)





