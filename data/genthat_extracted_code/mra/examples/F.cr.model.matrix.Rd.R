library(mra)


### Name: F.cr.model.matrix
### Title: Capture-Recapture model matrix
### Aliases: F.cr.model.matrix
### Keywords: models

### ** Examples
 


# Synthetic example with 10 animals and 5 occasions
nan <- 10
ns <- 5
sex <- matrix( as.numeric(runif( nan ) > 0.5), nrow=nan, ncol=ns )
x <- matrix( runif( nan*ns ) , nrow=nan, ncol=ns )
F.cr.model.matrix( capture= ~ sex + x, survival= ~ -1 + x, nan, ns )





