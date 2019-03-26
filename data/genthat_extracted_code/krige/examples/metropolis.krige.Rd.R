library(krige)


### Name: metropolis.krige
### Title: Sampling Technique Using Metropolis-Hastings
### Aliases: metropolis.krige
### Keywords: estimation posterior

### ** Examples

#Data
ny <- NYcity_subset

# Explanatory Variable Matrix
psrm.data <-cbind(1, ny$age, ny$educ, I(ny$age*ny$educ), as.numeric(ny$race==2), 
     as.numeric(ny$race==3), ny$female, I(as.numeric(ny$race==2)*ny$female), 
     I(as.numeric(ny$race==3)*ny$female), ny$catholic, ny$mormon, ny$orthodox, 
     ny$jewish, ny$islam, ny$mainline, ny$evangelical, ny$rural, 
     ny$ownership, as.numeric(ny$empstat==2), as.numeric(ny$empstat==3),
     as.numeric(ny$inc14==2), as.numeric(ny$inc14==3), as.numeric(ny$inc14==4),
     as.numeric(ny$inc14==5), as.numeric(ny$inc14==6), as.numeric(ny$inc14==7),
     as.numeric(ny$inc14==8), as.numeric(ny$inc14==9), as.numeric(ny$inc14==10),
     as.numeric(ny$inc14==11), as.numeric(ny$inc14==12), as.numeric(ny$inc14==13),
     as.numeric(ny$inc14==14))
dimnames(psrm.data)[[2]] <- c("Intercept", "Age", "Education", "Age.education", 
     "African.American", "Nonwhite.nonblack","Female", 
     "African.American.female", "Nonwhite.nonblack.female", 
     "Income1", "Income2", "Income3", "Income4","Income5", 
     "Income6", "Income7", "Income8", "Income9", "Income10", 
     "Income11", "Income12", "Income13", "Catholic", "Mormon", 
     "Orthodox", "Jewish", "Islam", "Mainline", "Evangelical", 
     "Ruralism", "Homeowner", "Unemployed","Not.in.workforce")

# Outcome Variable
ideo <- matrix(ny$ideology,ncol=1)

# Set Number of Iterations (5 for Illustration, But Want Many More)
M<-5

# Trial Run, Linear Model of Ideology with Geospatial Errors Using Metropolis-Hastings:
test.mat <- metropolis.krige(y=ideo,X=psrm.data,east=ny$eastings,north=ny$northings,
     mcmc.samples=M) 

# Summarize Results
summary(test.mat)

## No test: 
# This second example uses 100 iterations instead. 
# The command takes much longer, but many more than 100 are desired.
# Set Number of Iterations: 
M<-100

# Estimate Linear Model of Ideology with Geospatial Errors Using Metropolis-Hastings
# Again, even 100 iterations is short:
out.mat <- metropolis.krige(y=ideo,X=psrm.data,east=ny$eastings,north=ny$northings,
     mcmc.samples=M) 

# Discard first 10% of Iterations as Burn-In (User Discretion Advised).
out.mat <- out.mat[(.1*M+1):M,]

# Summarize Results
summary(out.mat)
## End(No test)



