library(TSDT)


### Name: distribution
### Title: distribution
### Aliases: distribution

### ** Examples

set.seed(0)
N <- 200
continuous_response = runif( min = 0, max = 20, n = N )
trt <- sample( c('Control','Experimental'), size = N, prob = c(0.4,0.6),
               replace = TRUE )
X1 <- runif( N, min = 0, max = 1 )
X2 <- runif( N, min = 0, max = 1 )
X3 <- sample( c(0,1), size = N, prob = c(0.2,0.8), replace = TRUE )
X4 <- sample( c('A','B','C'), size = N, prob = c(0.6,0.3,0.1), replace = TRUE )
covariates <- data.frame( X1 )
covariates$X2 <- X2
covariates$X3 <- factor( X3 )
covariates$X4 <- factor( X4 )

## Create a TSDT object
ex1 <- TSDT( response = continuous_response,
            trt = trt, trt_control = 'Control',
            covariates = covariates[,1:4],
            inbag_score_margin = 0,
            desirable_response = "increasing",
            oob_score_margin = 0,
            min_subgroup_n_control = 5,
            min_subgroup_n_trt = 5,
            n_sample = 5 )

## Show summary statistics
summary( ex1 )

## Get the number of subjects in each superior in-bag subgroup
distribution( ex1, statistic = 'Inbag_Subgroup_Size' )

## Get the vector of subgroup sample sizes for a particular subgroup
distribution( ex1, statistic = 'Inbag_Subgroup_Size',
              subgroup = 'X1<xxxxx & X1>=xxxxx' )

## Get the observed cutpoints for the numeric splitting variables in a subgroup
distribution( ex1, statistic = 'Cutpoints', subgroup = 'X1<xxxxx & X1>=xxxxx' )

## If the subgroup definition has more than one numeric splitting variable you
## can retrieve the numeric cutpoints for the splitting variables individually
distribution( ex1, statistic = 'Cutpoints', subgroup = 'X1<xxxxx & X1>=xxxxx',
              subsub = 'X1<xxxxx' )
distribution( ex1, statistic = 'Cutpoints', subgroup = 'X1<xxxxx & X1>=xxxxx',
              subsub = 'X1>=xxxxx' )

## Valid statistic names come from the column names in the summary output. If
## you are uncertain what the possible statistic values could be, you can pass
## any arbitrary string as the statistic and an error message is returned
## listing valid statistic values.
## Not run: 
##D distribution( ex1, statistic = 'Invalid_Statistic' )
## End(Not run)



