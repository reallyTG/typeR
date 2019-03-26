library(IPMRF)


### Name: ipmpartynew
### Title: IPM casewise with CIT-RF by 'party' for new cases, whose
###   responses do not need to be known
### Aliases: ipmpartynew
### Keywords: tree multivariate

### ** Examples

#Note: more examples can be found at 
#https://bmcbioinformatics.biomedcentral.com/articles/10.1186/s12859-017-1650-8

## -------------------------------------------------------
## Example from \code{\link[party]{varimp}} in \pkg{party}
## Classification RF
## -------------------------------------------------------


library(party)


#IMP based on CIT-RF (party package)
ntree=50
#readingSkills: data from party package
da=readingSkills[,1:3] 
set.seed(290875)
readingSkills.cf3 <- cforest(score ~ ., data = readingSkills,
control = cforest_unbiased(mtry = 3, ntree = 50))

#new case
nativeSpeaker='yes'
age=8
shoeSize=28
da1=data.frame(nativeSpeaker, age, shoeSize)

#IPM case-wise computed for new cases for party package
pupfn=ipmpartynew(readingSkills.cf3,da1,ntree)
pupfn



