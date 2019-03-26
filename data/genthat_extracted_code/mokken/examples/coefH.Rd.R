library(mokken)


### Name: coefH
### Title: Scalability coefficents H
### Aliases: coefH
### Keywords: scalability coefficients

### ** Examples

data(acl)
Communality <- acl[,1:10]
coefH(Communality)

coefH(Communality, se=FALSE)

subgroup <- ifelse(acl[,11] < 2,1,2)
coefH(Communality, group.var = subgroup)




