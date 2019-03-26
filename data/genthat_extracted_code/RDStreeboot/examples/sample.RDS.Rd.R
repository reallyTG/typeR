library(RDStreeboot)


### Name: sample.RDS
### Title: Draw RDS Sample
### Aliases: sample.RDS

### ** Examples

## load data
data(faux.network)

## draw RDS from network
samp <- sample.RDS(faux.network$traits, faux.network$adj.mat, 100, 2, 3, c(0,1/3,1/3,1/3), TRUE)



