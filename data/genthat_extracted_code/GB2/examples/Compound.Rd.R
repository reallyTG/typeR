library(GB2)


### Name: Compound
### Title: Compound Distribution based on the Generalized Beta Distribution
###   of the Second Kind
### Aliases: Compound fg.cgb2 dl.cgb2 pl.cgb2 dcgb2 pcgb2 prcgb2
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

# a vector of values
x <- rep(20000*seq(1,2,length.out=9))

#Gamma components
fg.cgb2(20000,af,bf,pf,qf,p0)
fg.cgb2(Inf,af,bf,pf,qf,p0,"l")

#Component densities
dl.cgb2(x,af,bf,pf,qf,p0)
dl.cgb2(20000,af,bf,pf,qf,p0,"l")

#Component cdf
pl.cgb2(25000,af,bf,pf,qf,p0)

#Compound cdf
pcgb2(x,af,bf,pf,qf,p0,p1)
prcgb2(37000,38000,af,bf,pf,qf,p0,p1,"l")
#}



