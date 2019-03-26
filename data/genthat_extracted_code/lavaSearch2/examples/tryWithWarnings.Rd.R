library(lavaSearch2)


### Name: tryWithWarnings
### Title: Run an Expression and Catch Warnings and Errors
### Aliases: tryWithWarnings

### ** Examples

FctTest <- function(x){
  return(log(x))
}
tryWithWarnings(FctTest(-1))
tryWithWarnings(FctTest(1))
tryWithWarnings(FctTest(xxxx))




