library(epiDisplay)


### Name: alpha
### Title: Cronbach's alpha
### Aliases: alpha alphaBest
### Keywords: database

### ** Examples

data(Cars93, package="MASS")
.data <- Cars93
attach(.data)
alpha(vars=c(Min.Price:MPG.highway, EngineSize), .data)
detach(.data)

data(Attitudes)
.data <-Attitudes
attach(.data)
alpha(qa1:qa18, .data)  # Needs full screen of Rconsole
alpha(qa1:qa18, var.labels.trunc=30, .data) 
                 # Fits in with default R console screen

alpha(qa1:qa18, reverse=FALSE, .data)

alphaBest(qa1:qa18, .data) -> best.alpha
best.alpha # .7621
tableStack(best.alpha$remaining, dataFrame=.data, reverse=TRUE)

# Manual attempts by trial and error give the following
alpha(c(qa1:qa9, qa15,qa18), .data) # .7644
detach(.data)
rm(list=ls())



