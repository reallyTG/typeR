library(GB2)


### Name: CompoundMoments
### Title: Moments of the Compound Distribution based on the GB2
### Aliases: mkl.cgb2 moment.cgb2 incompl.cgb2
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

# moments for the component densities
mkl.cgb2(1,af,bf,pf,qf,p0)
mkl.cgb2(-1,af,bf,pf,qf,p0,"l")

#Moment of order k
moment.cgb2(0.5,af,bf,pf,qf,p0,p1)
moment.cgb2(0.5,af,bf,pf,qf,p0,p1,"l")

#Incomplete moment of order k
incompl.cgb2(20000,1,af,bf,pf,qf,p0,p1)
incompl.cgb2(20000,1,af,bf,pf,qf,p0,p1,"l")
#}



