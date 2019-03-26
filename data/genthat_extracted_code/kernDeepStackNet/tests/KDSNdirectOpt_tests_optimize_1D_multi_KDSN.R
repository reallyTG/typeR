library(kernDeepStackNet)
library(globalOptTests)
# Ackleys
erg <- optimize1dMulti (f_input=function (x) goTest (x, fnName="Ackleys", checkDim=TRUE), 
                        lower=getDefaultBounds("Ackleys")$lower,
                        upper=getDefaultBounds("Ackleys")$upper,
                        tol_input=.Machine$double.eps^0.5, maxRuns=10, repetitions=10, addInfo=FALSE)
all.equal(getGlobalOpt("Ackleys"), erg$objective)
# BeckerLago
erg <- optimize1dMulti (f_input=function (x) goTest (x, fnName="BeckerLago", checkDim=TRUE),
                        lower=getDefaultBounds("BeckerLago")$lower,
                        upper=getDefaultBounds("BeckerLago")$upper,
                        tol_input=.Machine$double.eps^0.5, maxRuns=30, repetitions=30, addInfo=FALSE)
stopifnot(all.equal(getGlobalOpt("BeckerLago"), erg$objective))
# Bohachevsky1
erg <- optimize1dMulti (f_input=function (x) goTest (x, fnName="Bohachevsky1", checkDim=TRUE), 
                        lower=getDefaultBounds("Bohachevsky1")$lower,
                        upper=getDefaultBounds("Bohachevsky1")$upper,
                        tol_input=.Machine$double.eps^0.5, maxRuns=30, repetitions=30, addInfo=FALSE)
stopifnot(all.equal(getGlobalOpt("Bohachevsky1"), erg$objective))
# Bohachevsky2
erg <- optimize1dMulti (f_input=function (x) goTest (x, fnName="Bohachevsky2", checkDim=TRUE), 
                        lower=getDefaultBounds("Bohachevsky2")$lower,
                        upper=getDefaultBounds("Bohachevsky2")$upper,
                        tol_input=.Machine$double.eps^0.5, maxRuns=30, repetitions=30, addInfo=FALSE)
stopifnot(all.equal(getGlobalOpt("Bohachevsky2"), erg$objective))
# Branin
erg <- optimize1dMulti (f_input=function (x) goTest (x, fnName="Branin", checkDim=TRUE),
                        lower=getDefaultBounds("Branin")$lower,
                        upper=getDefaultBounds("Branin")$upper,
                        tol_input=.Machine$double.eps^0.5, maxRuns=30, repetitions=30, addInfo=FALSE)
all.equal(getGlobalOpt("Branin"), erg$objective)
# Camel3
erg <- optimize1dMulti (f_input=function (x) goTest (x, fnName="Camel3", checkDim=TRUE), 
                        lower=getDefaultBounds("Camel3")$lower,
                        upper=getDefaultBounds("Camel3")$upper,
                        tol_input=.Machine$double.eps^0.5, maxRuns=30, repetitions=30, addInfo=FALSE)
stopifnot(all.equal(getGlobalOpt("Camel3"), erg$objective))
# Camel6
erg <- optimize1dMulti (f_input=function (x) goTest (x, fnName="Camel6", checkDim=TRUE),
                        lower=getDefaultBounds("Camel6")$lower,
                        upper=getDefaultBounds("Camel6")$upper,
                        tol_input=.Machine$double.eps^0.5, maxRuns=30, repetitions=30, addInfo=FALSE)
all.equal(getGlobalOpt("Camel6"), erg$objective)
# CosMix2
erg <- optimize1dMulti (f_input=function (x) goTest (x, fnName="CosMix2", checkDim=TRUE), 
                        lower=getDefaultBounds("CosMix2")$lower,
                        upper=getDefaultBounds("CosMix2")$upper,
                       tol_input=.Machine$double.eps^0.5, maxRuns=30, repetitions=30, addInfo=FALSE)
stopifnot(all.equal(getGlobalOpt("CosMix2"), erg$objective))
# DekkersAarts
erg <- optimize1dMulti (f_input=function (x) goTest (x, fnName="DekkersAarts", checkDim=TRUE), 
                        lower=getDefaultBounds("DekkersAarts")$lower,
                        upper=getDefaultBounds("DekkersAarts")$upper,
                        tol_input=.Machine$double.eps^0.5, maxRuns=30, repetitions=30, addInfo=FALSE)
stopifnot(all.equal(getGlobalOpt("DekkersAarts"), erg$objective))
# Easom
erg <- optimize1dMulti (f_input=function (x) goTest (x, fnName="Easom", checkDim=TRUE), 
                        lower=getDefaultBounds("Easom")$lower,
                        upper=getDefaultBounds("Easom")$upper,
                        tol_input=.Machine$double.eps^0.5, maxRuns=30, repetitions=30, addInfo=FALSE)
all.equal(getGlobalOpt("Easom"), erg$objective)
# EMichalewicz
erg <- optimize1dMulti (f_input=function (x) goTest (x, fnName="EMichalewicz", checkDim=TRUE), 
                        lower=getDefaultBounds("EMichalewicz")$lower,
                        upper=getDefaultBounds("EMichalewicz")$upper,
                        tol_input=.Machine$double.eps^0.5, maxRuns=30, repetitions=30, addInfo=FALSE)
all.equal(getGlobalOpt("EMichalewicz"), erg$objective)
