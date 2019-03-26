library(MasterBayes)


### Name: getXlist
### Title: Design Matrices for the Multinomial Log-Linear Model
### Aliases: getXlist
### Keywords: manip models

### ** Examples

## Not run: 
##D id<-1:20
##D sex<-sample(c("Male", "Female"),20, replace=TRUE)
##D offspring<-c(rep(0,18),1,1)
##D lat<-rnorm(20)
##D long<-rnorm(20)
##D mating_type<-gl(2,10, label=c("+", "-"))
##D 
##D test.data<-data.frame(id, offspring, lat, long, mating_type, sex)
##D 
##D res1<-expression(varPed("offspring", restrict=0))
##D var1<-expression(varPed(c("lat", "long"), gender="Male", 
##D   relational="OFFSPRING"))
##D var2<-expression(varPed(c("mating_type"), gender="Female", 
##D   relational="MATE"))
##D var3<-expression(varPed("mating_type", gender="Male"))
##D 
##D PdP<-PdataPed(formula=list(res1, var1, var2, var3), data=test.data)
##D 
##D X.list<-getXlist(PdP)
##D X.list$X$"19"$XSs
##D 
##D # For the first offspring we have the design matrix for sires
##D # The first column represents the distance between each male 
##D # and each offspring. The second column indicates the male's 
##D # mating type. Note that contrasts are set up with the first 
##D # male so the indicator variables may be negative.
##D 
##D matrix(X.list$X$"19"$XDSs, ncol=length(X.list$X$"19"$dam.id), 
##D    nrow=length(X.list$X$"19"$sire.id))
##D 
##D # incidence matrix indicating whether Females (columns) and Males (rows)
##D # are the same mating type. Again this is a contrast with the first 
##D # parental combination (which is +/+) so 0 actually represents parents
##D # with the same mating type.
## End(Not run)



