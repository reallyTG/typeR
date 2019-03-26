library(Rcriticor)


### Name: critic
### Title: Pierre - Goldwin correlogram
### Aliases: critic
### Keywords: ts

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.
data(time,wy)
data(sit,time3)
critic(t=time3,Y=sit,dinf=50,dsup=90,durinf=20,dursup=50)



