library(secr)


### Name: secrdemo
### Title: SECR Models Fitted to Demonstration Data
### Aliases: secrdemo captXY trapXY captdata secrdemo.0 secrdemo.b
###   secrdemo.CL
### Keywords: datasets

### ** Examples


## Not run: 
##D 
##D ## navigate to folder with raw data files
##D olddir <- setwd (system.file("extdata", package="secr"))
##D 
##D ## construct capthist object from raw data
##D captdata  <- read.capthist ("capt.txt", "trap.txt", fmt = "XY", detector = "single")
##D 
##D ## generate demonstration fits
##D secrdemo.0 <- secr.fit (captdata)
##D secrdemo.CL <- secr.fit (captdata, CL = TRUE)
##D secrdemo.b <- secr.fit (captdata, model = list(g0 ~ b))
##D 
##D ## restore previous setting
##D setwd(olddir)
## End(Not run)

## display the null model fit, using the print method for secr
secrdemo.0

## compare fit of models
AIC(secrdemo.0, secrdemo.b)

## display estimates for the two models (single session)
collate(secrdemo.0, secrdemo.b)[1,,,]




