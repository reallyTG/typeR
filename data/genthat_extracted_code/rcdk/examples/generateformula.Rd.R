library(rcdk)


### Name: generate.formula
### Title: Generate molecular formulae given a target mass and a set of
###   elements and counts.
### Aliases: generate.formula generate.formula.iter
### Keywords: programming

### ** Examples


mfSet <- generate.formula(18.03383,charge=1,
                          elements=list(c("C",0,50),c("H",0,50),c("N",0,50)))
for (i in mfSet) {
  print(i)
}

mit <- generate.formula.iter(18.03383,charge=1,
                          elements=list(C=c(0,50), H=c(0,50), N=c(0,50)))
hit <- itertools::ihasNext(mit)
while (itertools::hasNext(hit)) 
  print(iterators::nextElem(hit))			  



