library(generalCorr)


### Name: heurist
### Title: Heuristic t test of the difference between two generalized
###   correlations.
### Aliases: heurist

### ** Examples


set.seed(34);x=sample(1:10);y=sample(2:11)
g1=gmcxy_np(x,y)
n=length(x)
h1=heurist(g1$corxy,g1$coryx,n)
print(h1)
print(h1$t) #t statistic
print(h1$p) #p-value



