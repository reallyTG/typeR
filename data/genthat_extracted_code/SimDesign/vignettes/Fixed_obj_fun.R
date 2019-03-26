## ----nomessages, echo = FALSE--------------------------------------------
knitr::opts_chunk$set(
  warning = FALSE,
  message = FALSE,
  fig.height = 5,
  fig.width = 5
)
options(digits=4)
par(mar=c(3,3,1,1)+.1)

## ----include=FALSE-------------------------------------------------------
set.seed(1234)

## ------------------------------------------------------------------------
obj1 <- 10
obj2 <- 20

## ------------------------------------------------------------------------
myfun <- function(x) obj1 + obj2
myfun(1)

## ----eval = FALSE--------------------------------------------------------
#  library(parallel)
#  cl <- makeCluster(2)
#  res <- try(parSapply(cl=cl, 1:4, myfun))
#  res

## ----echo=FALSE----------------------------------------------------------
library(parallel)
cl <- makeCluster(2)
cat("Error in checkForRemoteErrors(val) : 
  2 nodes produced errors; first error: object 'obj1' not found")

## ------------------------------------------------------------------------
clusterExport(cl=cl, c('obj1', 'obj2'))
parSapply(cl=cl, 1:4, myfun)

## ----echo=FALSE----------------------------------------------------------
stopCluster(cl)

## ------------------------------------------------------------------------
library(SimDesign)
#SimFunctions(comments = FALSE)

### Define design conditions and number of replications
Design <- expand.grid(N = c(10, 20, 30))
replications <- 1000

# define custom functions and objects (or use source() to read these in from an external file)
SD <- 2
my_gen_fun <- function(n, sd) rnorm(n, sd = sd)
my_analyse_fun <- function(x) c(p = t.test(x)$p.value)
fixed_objects <- list(SD=SD)

#---------------------------------------------------------------------------

Generate <- function(condition, fixed_objects = NULL) {
    Attach(condition) # make condition names available (e.g., N)
    
    # further, can use with() to use 'SD' directly instead of 'fixed_objects$SD'
    ret <- with(fixed_objects, my_gen_fun(N, sd=SD))
    ret
}

Analyse <- function(condition, dat, fixed_objects = NULL) {
    ret <- my_analyse_fun(dat)
    ret
}

Summarise <- function(condition, results, fixed_objects = NULL) {
    ret <- EDR(results, alpha = .05)
    ret
}

#---------------------------------------------------------------------------

### Run the simulation
results <- runSimulation(Design, replications, verbose=FALSE, fixed_objects=fixed_objects,
                         generate=Generate, analyse=Analyse, summarise=Summarise, edit='none')
results

## ----eval=FALSE----------------------------------------------------------
#  results <- runSimulation(Design, replications, verbose=FALSE, fixed_objects=fixed_objects,
#                           generate=Generate, analyse=Analyse, summarise=Summarise, edit='none',
#                           parallel = TRUE)

