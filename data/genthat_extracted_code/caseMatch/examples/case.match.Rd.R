library(caseMatch)


### Name: case.match
### Title: Uses matching methods to select cases for qualitative analysis
### Aliases: case.match
### Keywords: ~case selection ~matching

### ** Examples


data(EU)
mvars <- c("socialist","rgdpc","FHc","FHp","trade")
dropvars <- c("countryname","population")

## In this example, I subset to the first 40 obs. to cut run-time
out <- case.match(data=EU[1:40,], id.var="countryname", leaveout.vars=dropvars,
             distance="mahalanobis", case.N=2, 
             number.of.matches.to.return=10,
             treatment.var="eu", max.variance=TRUE)
out$cases

## Not run: 
##D ## All cases:
##D ## Find the best matches of EU to non-EU countries
##D out <- case.match(data=EU, id.var="countryname", leaveout.vars=dropvars,
##D              distance="mahalanobis", case.N=2, 
##D              number.of.matches.to.return=10,
##D              treatment.var="eu", max.variance=TRUE)
##D out$cases
##D 
##D ## Find the best matches while downweighting political variables
##D myvarweights <- c(1,1,.1,.1,.1)
##D names(myvarweights) <- c("rgdpc","trade","FHp","FHc","socialist")
##D myvarweights
##D (case.match(data=EU, id.var="countryname", leaveout.vars=dropvars,
##D              distance="mahalanobis", case.N=2, 
##D              number.of.matches.to.return=10, treatment.var="eu",
##D              max.variance=TRUE,varweights=myvarweights))$cases
##D 
##D ## Find the best non-EU matches for Germany
##D tabGer <- case.match(data=EU, match.case="German Federal Republic", 
##D              id.var="countryname",leaveout.vars=dropvars,
##D              distance="mahalanobis", case.N=2, 
##D              number.of.matches.to.return=10,max.variance=TRUE,
##D              treatment.var="eu")
## End(Not run)






