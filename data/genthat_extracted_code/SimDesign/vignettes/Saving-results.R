## ----nomessages, echo = FALSE--------------------------------------------
knitr::opts_chunk$set(
  warning = FALSE,
  message = FALSE,
  fig.height = 5,
  fig.width = 5
)
options(digits=4)
par(mar=c(3,3,1,1)+.1)

## ------------------------------------------------------------------------
library(SimDesign)
# SimFunctions()

Design <- data.frame(N = c(10,20,30))

## ------------------------------------------------------------------------
Generate <- function(condition, fixed_objects = NULL) {
    dat <- rnorm(condition$N)    
    dat
}

Analyse <- function(condition, dat, fixed_objects = NULL) {
    ret <- c(p = t.test(dat)$p.value)
    ret
}

Summarise <- function(condition, results, fixed_objects = NULL) {
    ret <- EDR(results, alpha = .05)
    ret
}

## ----include=FALSE-------------------------------------------------------
set.seed(1)

## ----eval=FALSE----------------------------------------------------------
#  Analyse <- function(condition, dat, fixed_objects = NULL) {
#      if(condition$N == 30) stop('Danger Will Robinson!')
#      ret <- c(p = t.test(dat)$p.value)
#      ret
#  }
#  
#  result <- runSimulation(Design, replications = 1000, save=TRUE, filename='my-simple-sim',
#                         generate=Generate, analyse=Analyse, summarise=Summarise)

## ----echo=FALSE----------------------------------------------------------
Analyse <- function(condition, dat, fixed_objects = NULL) {
    if(condition$N == 30) stop('Danger Will Robinson!')
    ret <- c(p = t.test(dat)$p.value)
    ret
}

result <- try(runSimulation(Design, replications = 1000, save=TRUE, filename='my-simple-sim',
                       generate=Generate, analyse=Analyse, summarise=Summarise), silent = TRUE)
message('Row 3 in design was terminated because it had 50 consecutive errors. \n
Last error message was: \n\nManual Error : Danger Will Robinson!')

## ------------------------------------------------------------------------
files <- dir()
files[grepl('SIMDESIGN', files)]

## ------------------------------------------------------------------------
Analyse <- function(condition, dat, fixed_objects = NULL) {
    ret <- c(p = t.test(dat)$p.value)
    ret
}

result <- runSimulation(Design, replications = 1000, save=TRUE, filename='my-simple-sim',
                       generate=Generate, analyse=Analyse, summarise=Summarise)

## ------------------------------------------------------------------------
files <- dir()
files[grepl('SIMDESIGN', files)]
files[grepl('my-simp', files)]

## ----include=FALSE-------------------------------------------------------
SimClean('my-simple-sim.rds')

## ------------------------------------------------------------------------
results <- runSimulation(Design, replications = 1000, save_results=TRUE,
              generate=Generate, analyse=Analyse, summarise=Summarise)
dir <- dir()
directory <- dir[grepl('SimDesign-results', dir)]
dir(directory)

## ------------------------------------------------------------------------
row1 <- readRDS(paste0(directory, '/results-row-1.rds'))
str(row1)

row1$condition
head(row1$results)

## ------------------------------------------------------------------------
row1 <- SimResults(results, 1)
str(row1)

## ------------------------------------------------------------------------
input <- SimResults(results)
str(input)

## ------------------------------------------------------------------------
SimClean(results = TRUE)

## ------------------------------------------------------------------------
results <- runSimulation(Design, replications = 3, store_results=TRUE,
              generate=Generate, analyse=Analyse, summarise=Summarise)
list_results <- extract_results(results)
list_results

