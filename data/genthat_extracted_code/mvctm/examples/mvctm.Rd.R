library(mvctm)


### Name: mvctm
### Title: Multivariate Variance Components Tests for Multilevel Data
### Aliases: mvctm

### ** Examples


data(toydata)

# Bivariate 2-level model.
# Classroom as the clusters. 
# Only an intercept is in the fixed part of the model.
# Test based on 200 permutations
mvctm(fixed=cbind(y1,y2)~1,cluster=c("classroom"),
data=toydata,leveltested=1,npermut=200)

# Same as above but The two covariates are in the fixed part of the model.
# Test based on 1000 permutations (default).
## Not run: 
##D mvctm(fixed=cbind(y1,y2)~x1+x2,cluster=c("classroom"),
##D data=toydata,leveltested=1)
## End(Not run)

# Same as above but the rank scores are used.
## Not run: 
##D mvctm(fixed=cbind(y1,y2)~x1+x2,cluster=c("classroom"),
##D data=toydata,leveltested=1, method="rank")
## End(Not run)

# Univariate 4-level model. 
# Classrooms, nested within schools, nested within regions.
# The variance component at the region level is tested. 
# The fixed effects are estimated with a linear mixed model.
## Not run: 
##D mvctm(fixed=y1~x1+x2,cluster=c("region","school","classroom"),
##D data=toydata,leveltested=1,method="mixed")
## End(Not run)

# Same as above but the variance component at the school level is tested.
## Not run: 
##D mvctm(fixed=y1~x1+x2,cluster=c("region","school","classroom"),
##D data=toydata,leveltested=2,method="mixed")
## End(Not run)

# Same as above but the variance component at the classroom level is tested.
## Not run: 
##D mvctm(fixed=y1~x1+x2,cluster=c("region","school","classroom"),
##D data=toydata,leveltested=3,method="mixed")
## End(Not run)

# Univariate 3-level model.
# The variance component at the classroom level is tested.
# The fixed effects are removed with an M-estimator with the rlm function 
#      in the MASS package. 
# Then the residuals from this fit are used to perform the test. 
# The ~0 in the formula tells mvctm to use  mresid directly to perform 
#      the test without any centering or transformation.  
## Not run: 
##D library("MASS")
##D toydata[,"mresid"]=rlm(y1~x1+x2,data=toydata)$residuals
##D mvctm(fixed=mresid~0,cluster=c("school","classroom"),
##D data=toydata,leveltested=2)
## End(Not run)




