library(DOS)


### Name: fine
### Title: Expand a Distance Matrix for Matching with Fine Balance.
### Aliases: fine

### ** Examples

data(costa)
z<-1*(costa$welder=="Y")
aa<-1*(costa$race=="A")
smoker=1*(costa$smoker=="Y")
age<-costa$age
x<-cbind(age,aa,smoker)
dmat<-mahal(z,x)
# Mahalanobis distances
round(dmat[,1:6],2) # Compare with Table 8.5 in Design of Observational Studies (2010)
# Impose propensity score calipers
prop<-glm(z~age+aa+smoker,family=binomial)$fitted.values # propensity score
# Mahalanobis distanced penalized for violations of a propensity score caliper.
# This version is used for numerical work.
dmat<-addcaliper(dmat,z,prop,caliper=.5)
round(dmat[,1:6],2) # Compare with Table 8.5 in Design of Observational Studies (2010)
# Because dmat already contains large penalties, we set mult=1.
dmat<-fine(dmat,z,aa,mult=1)
dmat[,1:6] # Compare with Table 10.1 in Design of Observational Studies (2010)
dim(dmat) # dmat has been expanded to be square by adding 5 extras, here numbered 48:52
# Any control matched to an extra is discarded.
## Not run: 
##D # Find the minimum distance match within propensity score calipers.
##D optmatch::pairmatch(dmat)
##D # Any control matched to an extra is discarded.  For instance, the optimal match paired
##D # extra row 48 with the real control in column 7 to form matched set 1.22, so that control
##D # is not part of the matched sample.  The harmless warning message from pairmatch
##D # reflects the divergence between the costa data.frame and expanded distance matrix.
## End(Not run)
# Conceptual versions with infinite distances for violations of propensity caliper.
dmat[dmat>20]<-Inf
round(dmat[,1:6],2) # Compare with Table 10.1 in Design of Observational Studies (2010)



