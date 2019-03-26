library(TSDT)


### Name: TSDT
### Title: Treatment-Specific Subgroup Detection Tool
### Aliases: TSDT

### ** Examples

## Create example data for constructing TSDT object
N <- 200
continuous_response = runif( min = 0, max = 20, n = N )
trt <- sample( c('Control','Experimental'), size = N, prob = c(0.4,0.6), replace = TRUE )
X1 <- runif( N, min = 0, max = 1 )
X2 <- runif( N, min = 0, max = 1 )
X3 <- sample( c(0,1), size = N, prob = c(0.2,0.8), replace = TRUE )
X4 <- sample( c('A','B','C'), size = N, prob = c(0.6,0.3,0.1), replace = TRUE )
covariates <- data.frame( X1 )
covariates$X2 <- X2
covariates$X3 <- factor( X3 )
covariates$X4 <- factor( X4 )


## In the following examples n_samples and n_permutations are set to small
## values so the examples complete quickly. The intent here is to provide
## a small functional example to demonstrate the structure of the output. In
## a real-world use of TSDT these values should be at least 100 and 500,
## respectively.

## Single-arm TSDT
ex1 <- TSDT( response = continuous_response,
            covariates = covariates[,1:4],
            inbag_score_margin = 0,
            desirable_response = "increasing",
            n_samples = 5,       ## use value >= 100 in real world application
            n_permutations = 5,  ## use value >= 500 in real world application
            rootcompete = 1,
            maxdepth = 2 )

## Two-arm TSDT
ex2 <- TSDT( response = continuous_response,
            trt = trt, trt_control = 'Control',
            covariates = covariates[,1:4],
            inbag_score_margin = 0,
            desirable_response = "increasing",
            oob_score_margin = 0,
            min_subgroup_n_control = 10,
            min_subgroup_n_trt = 20,
            maxdepth = 2,
            rootcompete = 1,
            n_samples = 5,      ## use value >= 100 in real world application
            n_permutations = 5 ) ## use value >= 500 in real world application



