library(agridat)


### Name: cramer.cucumber
### Title: Cucumber yields and quantitative traits
### Aliases: cramer.cucumber
### Keywords: datasets

### ** Examples

data(cramer.cucumber)
dat <- cramer.cucumber

require(lattice)
splom(dat[3:9], main="cramer.cucumber - traits by cycle", group=dat$cycle,
      auto.key=list(columns=3))

## Not run: 
##D   # derived traits
##D   dat <- transform(dat,
##D                    marketable = totalfruit-culledfruit,
##D                    branchesperplant = branches/plants,
##D                    nodesperbranch = leaves/(branches+plants),
##D                    femalenodes = flowers+totalfruit)
##D   dat <- transform(dat,
##D                    perfenod = (femalenodes/leaves),
##D                    fruitset = totalfruit/flowers,
##D                    fruitperplant = totalfruit / plants,
##D                    marketableperplant = marketable/plants,
##D                    earlyperplant=earlyfruit/plants)
##D   # just use cycle 1
##D   dat1 <- subset(dat, cycle==1)
##D 
##D   # define independent and dependent variables
##D   indep <- c("branchesperplant", "nodesperbranch", "perfenod", "fruitset")
##D   dep0 <- "fruitperplant"
##D   dep <- c("marketable","earlyperplant")
##D   
##D   # standardize trait data for cycle 1
##D   sdat <- data.frame(scale(dat1[1:8, c(indep,dep0,dep)]))
##D 
##D   # slopes for dep0 ~ indep
##D   X <- as.matrix(sdat[,indep])
##D   Y <- as.matrix(sdat[,c(dep0)])
##D   # estdep <- solve(t(X) ##D 
##D   estdep <- solve(crossprod(X), crossprod(X,Y))
##D   estdep
##D   ## branchesperplant 0.7160269
##D   ## nodesperbranch   0.3415537
##D   ## perfenod         0.2316693
##D   ## fruitset         0.2985557
##D   
##D   # slopes for dep ~ dep0
##D   X <- as.matrix(sdat[,dep0])
##D   Y <- as.matrix(sdat[,c(dep)])
##D   # estind2 <- solve(t(X) ##D 
##D   estind2 <- solve(crossprod(X), crossprod(X,Y))
##D   estind2
##D   ##  marketable earlyperplant
##D   ##     0.97196     0.8828393
##D 
##D   # correlation coefficients for indep variables
##D   corrind=cor(sdat[,indep])
##D   round(corrind,2)
##D   ##                  branchesperplant nodesperbranch perfenod fruitset
##D   ## branchesperplant             1.00           0.52    -0.24     0.09
##D   ## nodesperbranch               0.52           1.00    -0.44     0.14
##D   ## perfenod                    -0.24          -0.44     1.00     0.04
##D   ## fruitset                     0.09           0.14     0.04     1.00
##D 
##D   # Correlation coefficients for dependent variables
##D   corrdep=cor(sdat[,c(dep0, dep)])
##D   round(corrdep,2)
##D   ##               fruitperplant marketable earlyperplant
##D   ## fruitperplant          1.00       0.97          0.88
##D   ## marketable             0.97       1.00          0.96
##D   ## earlyperplant          0.88       0.96          1.00
##D 
##D   result = corrind
##D   result = result*matrix(estdep,ncol=4,nrow=4,byrow=TRUE)
##D   round(result,2) # match SAS output columns 1-4
##D   ##                  branchesperplant nodesperbranch perfenod fruitset
##D   ## branchesperplant             0.72           0.18    -0.06     0.03
##D   ## nodesperbranch               0.37           0.34    -0.10     0.04
##D   ## perfenod                    -0.17          -0.15     0.23     0.01
##D   ## fruitset                     0.07           0.05     0.01     0.30
##D 
##D   resdep0 = rowSums(result)
##D   resdep <- cbind(resdep0,resdep0)*matrix(estind2, nrow=4,ncol=2,byrow=TRUE)
##D   colnames(resdep) <- dep
##D   # slightly different from SAS output last 2 columns
##D   round(cbind(fruitperplant=resdep0, round(resdep,2)),2) 
##D   ##                  fruitperplant marketable earlyperplant
##D   ## branchesperplant          0.87       0.84          0.76
##D   ## nodesperbranch            0.65       0.63          0.58
##D   ## perfenod                 -0.08      -0.08         -0.07
##D   ## fruitset                  0.42       0.41          0.37
## End(Not run)




