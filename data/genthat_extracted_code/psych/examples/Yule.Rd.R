library(psych)


### Name: Yule
### Title: From a two by two table, find the Yule coefficients of
###   association, convert to phi, or tetrachoric, recreate table the table
###   to create the Yule coefficient.
### Aliases: Yule Yule.inv Yule2phi Yule2tetra Yule2poly YuleBonett YuleCor
### Keywords: multivariate models

### ** Examples

Nach <- matrix(c(40,10,20,50),ncol=2,byrow=TRUE)
Yule(Nach)
Yule.inv(.81818,c(50,60),n=120)
Yule2phi(.81818,c(50,60),n=120)
Yule2tetra(.81818,c(50,60),n=120)
phi(Nach)  #much less
#or express as percents and do not specify n
Nach <- matrix(c(40,10,20,50),ncol=2,byrow=TRUE)
Nach/120
Yule(Nach)
Yule.inv(.81818,c(.41667,.5))
Yule2phi(.81818,c(.41667,.5))
Yule2tetra(.81818,c(.41667,.5))
phi(Nach)  #much less
YuleCor(ability[,1:4],,TRUE)
YuleBonett(Nach,1)  #Yule Q
YuleBonett(Nach,.5)  #Yule Y
YuleBonett(Nach,.75)  #Digby H
YuleBonett(Nach,,TRUE)  #Yule* is a generalized Yule




