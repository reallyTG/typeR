library(psy)


### Name: mtmm
### Title: Multitrait Multimethod approach of scale validation
### Aliases: mtmm

### ** Examples


data(ehd)

par(mfrow=c(1,5))
mtmm(ehd,list(c("e15","e18","e19","e20"),c("e4","e5","e6","e14","e17"),c("e11","e13","e16")
,c("e1","e10","e12"),c("e2","e3","e7","e8","e9")))

# Boxplots of the distributions of the Pearson's correlations between total score of subscale i and the items of subscale j
par(mfrow=c(1,5))
mtmm(ehd,list(c("e15","e18","e19","e20"),c("e4","e5","e6","e14","e17"),c("e11","e13","e16")
,c("e1","e10","e12"),c("e2","e3","e7","e8","e9")))

# Pearson's correlations between total score of subscale i and all items
par(mfrow=c(3,2))
mtmm(ehd,list(c("e15","e18","e19","e20"),c("e4","e5","e6","e14","e17"),c("e11","e13","e16")
,c("e1","e10","e12"),c("e2","e3","e7","e8","e9")),graphItem=TRUE)




