library(TSDT)


### Name: get_suggested_subgroup
### Title: get_suggested_subgroup
### Aliases: get_suggested_subgroup

### ** Examples

set.seed(0)
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

## Create a TSDT object
ex1 <- TSDT( response = continuous_response,
             trt = trt, trt_control = 'Control',
             covariates = covariates[,1:4],
             inbag_score_margin = 0,
             desirable_response = "increasing",
             oob_score_margin = 0,
             min_subgroup_n_control = 10,
             min_subgroup_n_trt = 20,
             maxdepth = 2,
             rootcompete = 2 )

## Show summary statistics
summary( ex1 )

## Get the anonymized subgroup defined on X1
anonymized_subgroup <- as.character( ex1@superior_subgroups$Subgroup[2] )

## Get the suggested cutoff for this subgroup
suggested_cutoff <- as.character( ex1@superior_subgroups$Suggested_Cutoff[2] )

## Get the suggested subgroup
get_suggested_subgroup( anonymized_subgroup = anonymized_subgroup,
                        suggested_cutoff = suggested_cutoff )



