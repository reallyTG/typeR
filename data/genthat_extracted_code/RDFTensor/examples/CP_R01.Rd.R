library(RDFTensor)


### Name: CP_R01
### Title: inverse of real-number-CP-decompositions to Binary
### Aliases: CP_R01

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
    res=CP_R01(X,P1[[1]])



