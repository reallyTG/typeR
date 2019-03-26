library(krige)


### Name: krige.posterior
### Title: Posterior Distribution for the Kriging Process
### Aliases: krige.posterior
### Keywords: posterior

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

# Find the posterior density for New York City data if all parameters were 1:
s.test <- krige.posterior(tau2=1, phi=1, sigma2=1, beta=rep(1,33), y=ideo,
     X=psrm.data,east=ny$eastings, north=ny$northings)

# Print posterior density
s.test



