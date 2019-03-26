library(semTools)


### Name: PAVranking
### Title: Parcel-Allocation Variability in Model Ranking
### Aliases: PAVranking

### ** Examples


## Not run: 
##D ## lavaan syntax for Model A: a 2 Uncorrelated
##D ## factor CFA model to be fit to parceled data
##D 
##D parmodelA <- '
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
##D    f1 ~~ 0*f2
##D '
##D 
##D ## lavaan syntax for Model B: a 2 Correlated
##D ## factor CFA model to be fit to parceled data
##D 
##D parmodelB <- '
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
##D PAVranking(nPerPar = list(c(3,3,3), c(3,3,3)), facPlc = list(f1name,f2name),
##D            nAlloc = 100, parceloutput = 0, leaveout = 0,
##D            syntaxA = parmodelA, syntaxB = parmodelB, dataset = simParcel,
##D            names = list("p1f1","p2f1","p3f1","p1f2","p2f2","p3f2"))
## End(Not run)




