library(semTools)


### Name: poolMAlloc
### Title: Pooled estimates and standard errors across M
###   parcel-allocations: Combining sampling variability and
###   parcel-allocation variability.
### Aliases: poolMAlloc

### ** Examples


## Not run: 
##D ## lavaan syntax: A 2 Correlated
##D ## factor CFA model to be fit to parceled data
##D 
##D parmodel <- '
##D    f1 =~ NA*p1f1 + p2f1 + p3f1
##D    f2 =~ NA*p1f2 + p2f2 + p3f2
##D    p1f1 ~ 1
##D    p2f1 ~ 1
##D    p3f1 ~ 1
##D    p1f2 ~ 1
##D    p2f2 ~ 1
##D    p3f2 ~ 1
##D    p1f1 ~~ p1f1
##D    p2f1 ~~ p2f1
##D    p3f1 ~~ p3f1
##D    p1f2 ~~ p1f2
##D    p2f2 ~~ p2f2
##D    p3f2 ~~ p3f2
##D    f1 ~~ 1*f1
##D    f2 ~~ 1*f2
##D    f1 ~~ f2
##D '
##D 
##D ## specify items for each factor
##D f1name <- colnames(simParcel)[1:9]
##D f2name <- colnames(simParcel)[10:18]
##D 
##D ## run function
##D poolMAlloc(nPerPar = list(c(3,3,3), c(3,3,3)),
##D            facPlc = list(f1name, f2name), nAllocStart = 10, AllocAdd = 10,
##D            syntax = parmodel, dataset = simParcel, stopProp = .03,
##D            stopValue = .03, selectParam = c(1:6, 13:18, 21),
##D            names = list("p1f1","p2f1","p3f1","p1f2","p2f2","p3f2"),
##D            double = FALSE, useTotalAlloc = FALSE)
## End(Not run)




