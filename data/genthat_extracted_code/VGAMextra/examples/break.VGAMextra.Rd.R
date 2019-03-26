library(VGAMextra)


### Name: break.VGAMextra
### Title: Names/Value of linear predictors/parameters in time series
###   family functions.
### Aliases: break.VGAMextra

### ** Examples

## No test: 

library(VGAM)

eta     <- matrix(runif(100), nrow = 10, ncol = 10)
M1      <- c(5, 5)
noInter <- FALSE
bOrder  <- c(3, 3)
NOS     <- 2

### ONLY LINEAR PREDICTORS/PARAMETERS NAMES!
### RETURNED OBJECT IS A LIST !

break.VGAMextra(M1      = M1, 
                noInter = noInter, 
                bOrder  = bOrder, 
                NOS     = NOS, 
                typeTS  = "AR", 
                namesLP = TRUE, 
                varArg  = TRUE)

### PARAMETER VALUEs... "UNWRAPPED". Inverse link functions are applied.
###  Note that namesLP must be set to FALSE

break.VGAMextra(eta     = eta,
                M1      = M1, 
                noInter = noInter, 
                bOrder  = bOrder, 
                NOS     = NOS, 
                typeTS  = "AR", 
                namesLP = FALSE, 
                varArg  = TRUE)



## End(No test)




