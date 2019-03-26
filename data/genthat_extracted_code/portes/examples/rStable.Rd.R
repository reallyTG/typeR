library(portes)


### Name: rStable
### Title: Generate Data From Stable Distributions
### Aliases: rStable
### Keywords: Distribution

### ** Examples

## Generate Univariate Data
n <- 500
Alpha <- 1.75
Beta <- 0
Scale <- 1.5
Location <- 0
rStable(n, Alpha, Beta, Scale, Location)                
## Generate Bivariate Data  
n <- 500
Alpha <- c(1.3,1.5)
Beta <- c(0.3,-0.6)
rStable(n, Alpha, Beta)  
## Generate Multivariate Data
n <- 500
Alpha <- c(1.3,1.5,1.7)
Beta <- c(0.3,-0.6,0)
Scale <- c(3,1,6)
rStable(n, Alpha, Beta,Scale)  



