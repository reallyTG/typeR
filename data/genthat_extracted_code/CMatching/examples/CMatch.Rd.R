library(CMatching)


### Name: CMatch
### Title: Within and preferential-within cluster matching.
### Aliases: CMatch
### Keywords: matching clustered data

### ** Examples

data(schools)
	
# Kreft and De Leeuw, Introducing Multilevel Modeling, Sage (1988).   
# The data set is the subsample of NELS-88 data consisting of 10 handpicked schools
# from the 1003 schools in the full data set.
 
# Suppose that the effect of homeworks on math score is unconfounded conditional on X
# and unobserved school features (we assume this only for illustrative purpouse).

# Let us consider the following variables:

X<-schools$ses # or X<-as.matrix(schools[,c("ses","white","public")])
Y<-schools$math
Tr<-ifelse(schools$homework>1,1,0)
Group<-schools$schid
# When Group is missing or there is only one Group CMatch returns 
# the output of the Match function with a warning.

# Let us assume that the effect of homeworks (Tr) on math score (Y)
# is unconfounded conditional on X and other unobserved school features.
# Several strategies to handle unobserved group characteristics
# are described in Arpino & Cannas, 2016 (see References). 


# Multivariate Matching on covariates in X 
# default parameters: one-to-one matching on X with replacement with a caliper of 0.25

### Matching within schools
 mw<-CMatch(type="within",Y=Y, Tr=Tr, X=X, Group=Group, caliper=0.1)
 
 # compare balance before and after matching
 bmw  <- CMatchBalance(Tr~X,data=schools,match.out=mw)
 
 # calculate proportion of matched observations
  (mw$orig.treated.nobs-mw$ndrops)/mw$orig.treated.nobs 
  
 # check number of drops by school
 mw$orig.dropped.nobs.by.group
 
 # examine output
 mw                   # complete list of results                 
 summary(mw)  # basic statistics
 
### Match preferentially within school 
# i.e. first match within schools
# then (try to) match remaining units between schools
 mpw <- CMatch(type="pwithin",Y=schools$math, Tr=Tr, X=schools$ses, 
 Group=schools$schid, caliper=0.1)

# examine covariate balance
  bmpw<- CMatchBalance(Tr~ses,data=schools,match.out=mpw)
  # equivalent to MatchBalance(...) with mpw coerced to class "Match"

# proportion of matched observations
  (mpw$orig.treated.nobs-mpw$ndrops) / mpw$orig.treated.nobs 
# check drops by school
  mpw$orig.dropped.nobs.by.group.after.pref.within
# proportion of matched observations after match-within only
 (mpw$orig.treated.nobs-sum(mpw$orig.dropped.nobs.by.group.after.within)) / mpw$orig.treated.nobs

# see complete output
   mpw
# or use summary method for main results
   summary(mpw) 

#### Propensity score matching

# estimate the ps model

mod <- glm(Tr~ses+parented+public+sex+race+urban,
family=binomial(link="logit"),data=schools)
eps <- fitted(mod)

# eg 1: within school propensity score matching
psmw <- CMatch(type="within",Y=schools$math, Tr=Tr, X=eps, 
Group=schools$schid, caliper=0.1)
# equivalent to direct call at MatchW(Y=schools$math, Tr=Tr, X=eps,
# Group=schools$schid, caliper=0.1)

# eg 2: preferential within school propensity score matching
psmw <- CMatch(type="pwithin",Y=schools$math, Tr=Tr, X=eps, Group=schools$schid, caliper=0.1)

# Other strategies for controlling unobserved cluster covariates 
# via different specifications of propensity score (see Arpino and Mealli):

# eg 3: propensity score matching using ps estimated from a logit model with dummies for hospitals

mod <- glm(Tr ~ ses + parented + public + sex + race + urban 
+schid - 1,family=binomial(link="logit"),data=schools)
eps <- fitted(mod)

dpsm <- CMatch(type="within",Y=schools$math, Tr=Tr, X=eps, Group=NULL, caliper=0.1)
# this is equivalent to run Match with X=eps

# eg4: propensity score matching using ps estimated from multilevel logit model 
# (random intercept at the hospital level)

require(lme4)
mod<-glmer(Tr ~ ses + parented + public + sex + race + urban + (1 | schid),
family=binomial(link="logit"), data=schools)
eps <- fitted(mod)

mpsm<-CMatch(type="within",Y=schools$math, Tr=Tr, X=eps, Group=NULL, caliper=0.1)
# this is equivalent to run Match with X=eps

 




