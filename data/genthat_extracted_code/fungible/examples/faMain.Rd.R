library(fungible)


### Name: faMain
### Title: Automatic Factor Rotation from Random Configurations with
###   Bootstrap Standard Errors
### Aliases: faMain

### ** Examples

## Example 1

## Generate an orthgonal factor model
lambda <- matrix(c(.41, .00, .00,
                   .45, .00, .00,
                   .53, .00, .00,
                   .00, .66, .00,
                   .00, .38, .00,
                   .00, .66, .00,
                   .00, .00, .68,
                   .00, .00, .56,
                   .00, .00, .55),
                 nrow = 9, ncol = 3, byrow = TRUE)

## Generate factor correlation matrix
Phi <- matrix(.50, nrow = 3, ncol = 3)
diag(Phi) <- 1

## Model-implied correlation matrix
R <- lambda %*% Phi %*% t(lambda)
diag(R) <- 1

## Load the MASS package to create multivariate normal data
library(MASS)

## Generate raw data to perfectly reproduce R
X <- mvrnorm(Sigma = R, mu = rep(0, nrow(R)), empirical = TRUE, n = 300)

## Not run: 
##D ## Execute 50 promax rotations from a least squares factor extraction
##D ## Compute 100 bootstrap samples to compute standard errors and 
##D ## 80 percent confidence intervals
##D Out1 <- faMain(X             = X,
##D                numFactors    = 3,
##D                facMethod     = "fals",
##D                rotate        = "promaxQ",
##D                bootstrapSE   = TRUE,
##D                numBoot       = 100,
##D                CILevel       = .80,
##D                faControl     = list(treatHeywood = TRUE),
##D                rotateControl = list(numberStarts = 2,  
##D                                     itemSort     = TRUE,
##D                                     power        = 4,
##D                                     standardize  = "Kaiser"),
##D                digits        = 2)
##D Out1[c("loadings", "Phi")] 
## End(Not run)

## Example 2

## Load Thurstone's (in)famous box data
data(Thurstone, package = "GPArotation")

## Execute 5 oblimin rotations with Cureton-Mulaik standardization 
Out2 <- faMain(urLoadings    = box26,
               rotate        = "oblimin",
               bootstrapSE   = FALSE,
               rotateControl = list(numberStarts = 5,
                                    standardize  = "CM",
                                    gamma        = 0,
                                    epsilon      = 1e-6),
               digits        = 2)
               
Out2[c("loadings", "Phi")]     

## Example 3

## Factor matrix from Browne 1972
lambda <- matrix(c(.664,  .322, -.075,
                   .688,  .248,  .192,
                   .492,  .304,  .224,
                   .837, -.291,  .037,
                   .705, -.314,  .155,
                   .820, -.377, -.104,
                   .661,  .397,  .077,
                   .457,  .294, -.488,
                   .765,  .428,  .009), 
                 nrow = 9, ncol = 3, byrow = TRUE)   
                 
## Create partially-specified target matrix
Targ <- matrix(c(NA, 0,  NA,
                 NA, 0,  0,
                 NA, 0,  0,
                 NA, NA, NA,
                 NA, NA, 0,
                 NA, NA, NA,
                 .7, NA, NA,
                 0,  NA, NA,
                 .7, NA, NA), 
               nrow = 9, ncol = 3, byrow = TRUE)  
               
## Perform target rotation              
Out3 <- faMain(urLoadings   = lambda,
               rotate       = "targetT",
               targetMatrix = Targ,
               digits       = 3)$loadings
Out3



