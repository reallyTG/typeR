## ----nomessages, echo = FALSE--------------------------------------------
knitr::opts_chunk$set(
  warning = FALSE,
  message = FALSE,
  fig.height = 5,
  fig.width = 5
)
options(digits=4)
par(mar=c(3,3,1,1)+.1)

## ----echo=FALSE----------------------------------------------------------
set.seed(1)

## ------------------------------------------------------------------------
library(SimDesign)
# SimFunctions(comments=FALSE)

Design <- data.frame(N = c(10,20,30))

## ------------------------------------------------------------------------
Generate <- function(condition, fixed_objects = NULL) {
    ret <- with(condition, rnorm(N))
    ret
}

Analyse <- function(condition, dat, fixed_objects = NULL) {
    whc <- sample(c(0,1,2,3), 1, prob = c(.7, .20, .05, .05))
    if(whc == 0){
       ret <- mean(dat)
    } else if(whc == 1){
        ret <- t.test() # missing arguments
    } else if(whc == 2){
        ret <- t.test('invalid') # invalid arguments
    } else if(whc == 3){
        # throw error manually 
        stop('Manual error thrown') 
    }
    # manual warnings
    if(sample(c(TRUE, FALSE), 1, prob = c(.1, .9)))
    	warning('This warning happens rarely')
    if(sample(c(TRUE, FALSE), 1, prob = c(.5, .5)))
    	warning('This warning happens much more often')
    ret
}

Summarise <- function(condition, results, fixed_objects = NULL) {
    ret <- c(bias = bias(results, 0))
    ret
}

## ----include=FALSE-------------------------------------------------------
set.seed(1)

## ----cache=TRUE----------------------------------------------------------
result <- runSimulation(Design, replications = 100, 
                       generate=Generate, analyse=Analyse, summarise=Summarise)

## ------------------------------------------------------------------------
print(result)

## ------------------------------------------------------------------------
seeds <- extract_error_seeds(result)
head(seeds[,1:3])

## ----eval=FALSE----------------------------------------------------------
#  picked_seed <- seeds$Design_row_1.1..Error.in.t.test.default..invalid.....not.enough..x..observations.
#  runSimulation(Design[1,], replications = 100, load_seed=picked_seed, edit='analyse',
#                generate=Generate, analyse=Analyse, summarise=Summarise)

