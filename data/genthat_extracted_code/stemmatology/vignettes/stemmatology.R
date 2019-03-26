### R code from vignette source 'stemmatology.Rnw'
### Encoding: UTF-8

###################################################
### code chunk number 1: stemmatology.Rnw:145-166 (eval = FALSE)
###################################################
## # Interactive mode
## # Load data
## data(fournival)
## # or alternatively, import it
## fournival = import.TEIApparatus(file = "myFournival.xml", 
##     appTypes = c("substantive"))
## # Analyse it with the PCC functions
## PCC(fournival)
## 
## # Complete step-by-step non interactive use
## data("fournival")
## # look for conflicts
## myConflicts = PCC.conflicts(fournival)
## # remove conflicting VL
## myConflicts = PCC.overconflicting(myConflicts, ask = FALSE, threshold = 0.06)
## myNewData = PCC.elimination(myConflicts)
## # look for competing genealogies
## myConflicts = PCC.conflicts(myNewData)
## myNewData = PCC.equipollent(myConflicts, ask = FALSE, scope = "W", wits = "D")
## # build a stemma
## PCC.Stemma(myNewData$databases[[3]], ask = FALSE)


