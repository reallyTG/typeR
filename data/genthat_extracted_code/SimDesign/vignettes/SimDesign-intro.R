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
options(digits = 2)

## ----comment=NA----------------------------------------------------------
library(SimDesign)
SimFunctions()

## ----eval=FALSE----------------------------------------------------------
#  SimFunctions('mysim')

## ----eval=FALSE----------------------------------------------------------
#  SimFunctions('mysim', singlefile = FALSE, comments = TRUE)

## ------------------------------------------------------------------------
Design <- expand.grid(sample_size = c(30, 60, 120, 240), 
                      distribution = c('norm', 'chi'))
Design

## ------------------------------------------------------------------------
Generate <- function(condition, fixed_objects = NULL) {
    N <- condition$sample_size
    dist <- condition$distribution
    if(dist == 'norm'){
        dat <- rnorm(N, mean = 3)
    } else if(dist == 'chi'){
        dat <- rchisq(N, df = 3)
    }
    dat
}

## ------------------------------------------------------------------------
Analyse <- function(condition, dat, fixed_objects = NULL) {
    M0 <- mean(dat)
    M1 <- mean(dat, trim = .1)
    M2 <- mean(dat, trim = .2)
    med <- median(dat)
    
    ret <- c(mean_no_trim=M0, mean_trim.1=M1, mean_trim.2=M2, median=med)
    ret
}

## ------------------------------------------------------------------------
Summarise <- function(condition, results, fixed_objects = NULL) {
    obs_bias <- bias(results, parameter = 3)
    obs_RMSE <- RMSE(results, parameter = 3)
    ret <- c(bias=obs_bias, RMSE=obs_RMSE, RE=RE(obs_RMSE))
    ret
}

## ----include=FALSE-------------------------------------------------------
set.seed(1234)

## ---- cache=TRUE---------------------------------------------------------
results <- runSimulation(Design, replications = 1000, generate=Generate, 
                         analyse=Analyse, summarise=Summarise)
results

## ------------------------------------------------------------------------
REs <- results[,grepl('RE\\.', colnames(results))]
data.frame(Design, REs)

## ---- include=FALSE------------------------------------------------------
set.seed(1)

## ------------------------------------------------------------------------
(condition <- Design[1, ])
dat <- Generate(condition)
dat

res <- Analyse(condition, dat)
res

## ------------------------------------------------------------------------
# repeat 1000x
results <- matrix(0, 1000, 4)
colnames(results) <- names(res)
for(i in 1:1000){
    dat <- Generate(condition)
    res <- Analyse(condition, dat)
    results[i, ] <- res
}
head(results)

## ------------------------------------------------------------------------
Summarise(condition, results) 

