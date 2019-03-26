library(hdi)


### Name: rXb
### Title: Generate Data Design Matrix X and Coefficient Vector beta
### Aliases: rXb rX
### Keywords: datagen regression

### ** Examples

## Generate the first realization of the linear model with design matrix
## type Toeplitz and coefficients type uniform between -2 and 2

dset <- rXb(n = 80, p = 20, s0 = 3,
            xtype = "toeplitz", btype = "U[-2,2]")
x <- dset$x
beta <- dset$beta

## generate 100 response vectors of this linear model
y <- as.vector( x %*% beta ) + replicate(100, rnorm(nrow(x)))

## Use  'beta_min' fulfilling  beta's  (non standard 'btype'):
str(ds2 <- rXb(n = 50, p = 12, s0 = 3,
               xtype = "exp.decay", btype = "U[0.1, 5]"))

## Generate a design matrix of type "toeplitz"
set.seed(3) # making it reproducible
X3 <- rX(n = 800, p = 500, xtype = "toeplitz", permuted = FALSE)

## permute the columns
set.seed(3)
Xp <- rX(n = 800, p = 500, xtype = "toeplitz", permuted = TRUE)



