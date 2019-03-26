library(RDFTensor)


### Name: CP_01
### Title: transformation of the real-number-CP-decompositions to Binary
### Aliases: CP_01

### ** Examples


trp=rbind(
    cbind('Alex',  'loves', 'Don'),
    cbind('Alex',  'loves', 'Elly'),
    cbind('Alex',  'hates', 'Bob'),
    cbind('Don',   'loves', 'Alex'),
    cbind('Don',   'hates', 'Chris'),
    cbind('Chris', 'hates', 'Bob'),
    cbind('Bob',   'hates', 'Chris'),
    cbind('Elly',  'hates', 'Chris'),
    cbind('Elly',  'hates', 'Bob'),
    cbind('Elly',  'loves', 'Alex')
    )
######
# form tensor as a set of frontal slices (Predicate mode)
    tnsr=getTensor(trp)
    subs=getTnsrijk(tnsr$X)
    X=list(subs=subs,vals=rep(1,nrow(subs)),size=c(5,2,5))
    normX=sqrt(sum(X$vals))
    set.seed(123)
    # NMU decomposition with rank 2
    P1=cp_nmu(X,2)
    res=CP_01(X,P1[[1]])
    Fac=res$sol$u # The factorization
    # TP,FP,FN
    print(sprintf("TP=%d, FP=%d, FN=%d, Threshold=%f",res$sol$TP,res$sol$FP,res$sol$FN,res$sol$thr))




