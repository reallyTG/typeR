library(tnet)


### Name: dichotomise_tm
### Title: Dichotomise a weighted two-mode network into a binary two-mode
###   network
### Aliases: dichotomise_tm

### ** Examples

## Load sample data
sample <- cbind(
 i=c(1,1,2,2,2,3,3,4,5,5,6),
 p=c(1,2,1,3,4,2,3,4,3,5,5),
 w=c(3,5,6,1,2,6,2,1,3,1,2))

## Run the programme
dichotomise_tm(sample, GT=2)




