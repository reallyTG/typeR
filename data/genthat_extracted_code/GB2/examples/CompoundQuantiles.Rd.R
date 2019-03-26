library(GB2)


### Name: CompoundQuantiles
### Title: Quantiles and random generation of the Compound Distribution
###   based on the GB2
### Aliases: CompoundQuantiles qcgb2 rcgb2
### Keywords: distribution

### ** Examples

#\dontrun{

#\library{cubature}

# GB2 parameters
af <- 5
bf <- 20000
pf <- 0.45 
qf <- 0.75

p0 <- rep(1/3,3)
p1 <- c(0.37,0.43,0.2)

#Quantiles

qcgb2(0.5,af,bf,pf,qf,p0,p1)
qcgb2(1,af,bf,pf,qf,p0,p1)
qcgb2(c(0.5,0.8),af,bf,pf,qf,p0,p1)

#Random generation
rcgb2(10,af,bf,pf,qf,p0,p1)

#}



