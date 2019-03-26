## ------------------------------------------------------------------------
library(rcdk)
sp <- get.smiles.parser()
molecule <- parse.smiles('N')[[1]]
convert.implicit.to.explicit(molecule)
formula <- get.mol2formula(molecule,charge=0)

## ------------------------------------------------------------------------
formula@mass
formula@charge
formula@string

## ------------------------------------------------------------------------
formula@isotopes

## ------------------------------------------------------------------------
formula <- set.charge.formula(formula, charge=1)

## ------------------------------------------------------------------------
formula <- get.formula('NH4', charge = 1)
formula

## ----warn=FALSE----------------------------------------------------------
mfSet <- generate.formula(18.03383, window=1,
    elements=list(c("C",0,50),c("H",0,50),c("N",0,50)),
    validation=FALSE)
mfSet

## ------------------------------------------------------------------------
formula <- get.formula('NH4', charge = 0)
isvalid.formula(formula,rule=c("nitrogen","RDBE"))

## ------------------------------------------------------------------------
formula <- get.formula('NH4', charge = 1)
isvalid.formula(formula,rule=c("nitrogen","RDBE"))

## ----warn=FALSE----------------------------------------------------------
mit <- generate.formula.iter(100, charge=0, window=0.1,
                             elements=list(C=c(0,50), H=c(0,50), N=c(0,50)))
hit <- itertools::ihasNext(mit)
while (itertools::hasNext(hit)) 
    print(iterators::nextElem(hit))

## ------------------------------------------------------------------------
formula <- get.formula('CHCl3', charge = 0)
isotopes <- get.isotopes.pattern(formula,minAbund=0.1)
isotopes

## ------------------------------------------------------------------------
plot(isotopes, type="h", xlab="m/z", ylab="Intensity")

