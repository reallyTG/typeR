library(bigmatch)


### Name: nfmatch
### Title: Minimum-distance near-fine matching.
### Aliases: nfmatch

### ** Examples

# To run this example, you must load the optmatch package.

# Caliper of .3 on the propensity score, near fine balance of
# education, a robust Mahalanobis distrance for X.
data(nh0506)
attach(nh0506)
X<-cbind(female,age,black,hispanic,education,povertyr,bmi)
m<-nfmatch(z=z,p=propens,fine=education,X=X,caliper=.3,dat=nh0506,rank=FALSE)
matcheddata=m$data
table(matcheddata$z,matcheddata$education)
head(matcheddata)
detach(nh0506)
## No test: 
  #finds the optimal caliper for the propensity score while exact matching on female
  #near fine balance for education and hispanic jointly.
  data(nh0506)
  attach(nh0506)
  X<-cbind(female,age,black,hispanic,education,povertyr,bmi)

  oc<-optcal(z,propens,exact=female,tol=0.1,rank=F)
  oc
  oco<-optconstant(z,propens,oc$caliper,exact=female,rank=F)
  oco
  m2<-nfmatch(z,propens,factor(hispanic):factor(education),X,nh0506,oc$caliper,oco$constant,
              exact=female,rank=F)

  matcheddata2=m2$data
  table(matcheddata2$z,matcheddata2$female)
  table(matcheddata2$z,matcheddata2$education)
  table(matcheddata2$z,matcheddata2$education,matcheddata2$hispanic)

  #finds the optimal caliper for the propensity score while exact matching on female
  #nearexact on quantiles of povertyr and bmi
  #near fine balance for education and hispanic jointly.
  pq=cut(povertyr,c(-0.1,1,2,3,4,5))
  bq=cut(bmi,(0:7)*20)
  #first assume povertyr and bmi are of the same importance
  m3<-nfmatch(z,propens,factor(hispanic):factor(education),X,nh0506,oc$caliper,oco$constant,
              exact=female,nearexact=cbind(pq,bq),rank=F)
  matcheddata3=m3$data
  head(matcheddata3)

  #then assume povertyr is more important than bmi
  m4<-nfmatch(z,propens,factor(hispanic):factor(education),X,nh0506,oc$caliper,oco$constant,
              exact=female,nearexact=cbind(pq,bq),nearexPenalty=c(100,50),rank=F)
  matcheddata4=m4$data
  head(matcheddata4)
  detach(nh0506)
## End(No test)



