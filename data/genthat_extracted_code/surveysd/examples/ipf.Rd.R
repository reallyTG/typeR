library(surveysd)


### Name: ipf
### Title: Iterative Proportional Fitting
### Aliases: ipf

### ** Examples

## Not run: 
##D data(eusilcS,package="simPop")
##D library(data.table)
##D setDT(eusilcS)
##D eusilcS <- eusilcS[, list(db030,hsize,db040,age,rb090,netIncome,db090,rb050)]
##D 
##D ## rename columns
##D setnames(eusilcS, "rb090", "gender")
##D setnames(eusilcS, "db040", "state")
##D setnames(eusilcS, "db030", "household")
##D setnames(eusilcS, "rb050", "weight")
##D 
##D ## some recoding
##D # generate age groups
##D eusilcS[, agegroup := cut(age, c(-Inf, 10*1:9, Inf), right = FALSE)]
##D # some recoding of netIncome for reasons of simplicity
##D eusilcS[is.na(netIncome), netIncome := 0]
##D eusilcS[netIncome < 0, netIncome := 0]
##D # set hsize to 1,...,5+
##D eusilcS[, hsize := cut(hsize, c(0:4, Inf), labels = c(1:4, "5+"))]
##D # treat households as a factor variable
##D eusilcS[, household := as.factor(household)]
##D 
##D ## example for base weights assuming a simple random sample of households stratified per region
##D eusilcS[, regSamp := .N, by = state]
##D eusilcS[, regPop := sum(weight), by = state]
##D eusilcS[, baseWeight := regPop/regSamp]
##D 
##D ## constraints on person level
##D # age
##D conP1 <- xtabs(weight ~ agegroup, data = eusilcS)
##D # gender by region
##D conP2 <- xtabs(weight ~ gender + state, data = eusilcS)
##D # personal net income by gender
##D conP3 <- xtabs(weight*netIncome ~ gender, data = eusilcS)
##D 
##D ## constraints on household level
##D conH1 <- xtabs(weight ~ hsize + state, data = eusilcS, subset = !duplicated(household))
##D 
##D # array of convergence limits for conH1
##D epsH1 <- conH1
##D epsH1[1:4,] <- 0.005
##D epsH1["5+",] <- 0.2
##D 
##D # without array epsH1
##D 
##D calibweights1 <- ipf(eusilcS, hid = "household",
##D                       conP = list(conP1, conP2, netIncome = conP3),
##D                       conH = list(conH1),
##D                       epsP = list(1e-06, 1e-06, 1e-03),
##D                       epsH = 0.01,
##D                       bound = NULL, verbose = TRUE,  maxIter = 200)
##D 
##D # with array epsH1, base weights and bound
##D calibweights2 <- ipf(eusilcS, hid = "household",
##D                       conP = list(conP1, conP2),
##D                       conH = list(conH1),
##D                       epsP = 1e-06,
##D                       epsH = list(epsH1),
##D                       w = "baseWeight",
##D                       bound = 4, verbose = TRUE, maxIter = 200)
##D 
##D # show an adjusted version of conP and the original
##D attr(calibweights2, "conP_adj")
##D attr(calibweights2, "conP")
## End(Not run)



