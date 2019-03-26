library(psychmeta)


### Name: control_intercor
### Title: Control function to curate intercorrelations to be used in
###   automatic compositing routine
### Aliases: control_intercor

### ** Examples

## Create a dataset in which constructs correlate with themselves
rxyi <- seq(.1, .5, length.out = 27)
construct_x <- rep(rep(c("X", "Y", "Z"), 3), 3)
construct_y <- c(rep("X", 9), rep("Y", 9), rep("Z", 9))
dat <- data.frame(rxyi = rxyi, 
                  construct_x = construct_x, 
                  construct_y = construct_y)
dat <- rbind(cbind(sample_id = "Sample 1", dat), 
             cbind(sample_id = "Sample 2", dat), 
             cbind(sample_id = "Sample 3", dat))

## Identify some constructs for which intercorrelations are not 
## represented in the data object:
construct_names = c("U", "V", "W")

## Specify some externally determined intercorrelations among measures:
intercor_vec <- c(W = .4, X = .1)

## Specify a generic scalar intercorrelation that can stand in for missing values:
intercor_scalar <- .5

control_intercor(rxyi = rxyi, sample_id = sample_id, 
                 construct_x = construct_x, construct_y = construct_y, 
                 construct_names = construct_names, 
                 intercor_vec = intercor_vec, intercor_scalar = intercor_scalar, data = dat)



