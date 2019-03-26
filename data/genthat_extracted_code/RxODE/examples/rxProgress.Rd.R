library(RxODE)


### Name: rxProgress
### Title: RxODE progress bar functions
### Aliases: rxProgress rxTick rxProgressStop rxProgressAbort

### ** Examples

f <- function(){
  on.exit({rxProgressAbort()});
  rxProgress(100)
    for (i in 1:100) {
       rxTick()
       Sys.sleep(1 / 100)
    }
  rxProgressStop();
 }

## Not run: 
##D f();
## End(Not run)




