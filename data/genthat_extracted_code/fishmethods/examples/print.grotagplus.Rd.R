library(fishmethods)


### Name: print.grotagplus
### Title: Printing Tagging-Growth Objects
### Aliases: print.grotagplus
### Keywords: misc

### ** Examples

#Model 4 of Francis (1988)
data(bonito)
fit <- grotagplus(bonito,alpha=35,beta=55,
               design=list(galpha=1,gbeta=1,s=1,nu=1,m=1,p=1,u=1,w=1),
               stvalue=list(s=0.81,nu=0.3,m=0,p=0.01,u=0.5,w=0.5),
               upper=list(s=3,nu=1,m=2,p=0.1,u=1,w=1),
               lower=list(s=0.1,nu=0.1,m=-2,p=0,u=0,w=0))
print(fit)



