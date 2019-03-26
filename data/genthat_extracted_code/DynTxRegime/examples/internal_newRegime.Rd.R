library(DynTxRegime)


### Name: .newRegime
### Title: Process and Store Decision Rule Information.
### Aliases: .newRegime .newRegime,function-method .newRegime,list-method
### Keywords: internal

### ** Examples


regime <- function(a,b,c,data){
            return(a*data$x1 + b*data$x2 + c*data$x3 < 0)
          }

regObj <- DynTxRegime:::.newRegime(object = regime)

is(regObj)

regime <- list()
regime[[1L]] <- function(a,data){
                  return(data$x1 < a)
                }

regime[[2L]] <- function(a,data){
                  return(data$x2 < a)
                }


regObj <- DynTxRegime:::.newRegime(object = regime)

is(regObj)



