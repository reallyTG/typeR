library(paramlink)


### Name: likelihood
### Title: Pedigree likelihood
### Aliases: likelihood likelihood.linkdat likelihood.singleton
###   likelihood.list likelihood_LINKAGE

### ** Examples


x = linkdat(toyped, model=1) #dominant model

lod1 = likelihood_LINKAGE(x, marker=1, theta=0, logbase=10) - 
       likelihood_LINKAGE(x, marker=1, theta=0.5, logbase=10)
lod2 = lod(x, markers=1, theta=0)

# these should be the same:
stopifnot(identical(lod1, as.numeric(lod2)), round(lod1, 2)==0.3)

# likelihood of inbred pedigree (grandfather/granddaughter incest)
y = addOffspring(addDaughter(nuclearPed(1, sex=2), 3), father=1, mother=5, 1)
m = marker(y, 1, 1, 6, 1:2)
l1 = likelihood(y, m)
l2 = likelihood(y, m, loop_breaker=5) # manual specification of loop_breaker
stopifnot(l1==0.09375, l2==l1)




