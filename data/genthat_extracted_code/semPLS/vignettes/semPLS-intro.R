### R code from vignette source 'semPLS-intro.Rnw'

###################################################
### code chunk number 1: options
###################################################
options(list(prompt = "R> ", continue = "+  ", width = 78, 
      useFancyQuotes = FALSE))


###################################################
### code chunk number 2: ecsi-full (eval = FALSE)
###################################################
## data(ECSImobi)
## ecsi <- sempls(model = ECSI, data = mobi, wscheme = "centroid")
## ### Note, for rendering the path diagram graphviz (www.graphviz.org)
## ### must be available.
## pathDiagram(ecsi, file = "ecsi-full", full = FALSE,
##   edge.labels = "names", output.type = "graphics", digits = 2,
##   graphics.fmt = "pdf")


###################################################
### code chunk number 3: semPLS
###################################################
library("semPLS")


###################################################
### code chunk number 4: ECSI
###################################################
data("ECSIsm")
ECSIsm
data("ECSImm")
ECSImm


###################################################
### code chunk number 5: ECSImm
###################################################
ECSImm[ECSImm[, 1] == "Expectation", ]


###################################################
### code chunk number 6: ECSImm
###################################################
ECSImm[ECSImm[ , 1] == "Expectation", 2:1]


###################################################
### code chunk number 7: mobi
###################################################
data("mobi")


###################################################
### code chunk number 8: plsm
###################################################
ECSI <- plsm(data = mobi, strucmod = ECSIsm, measuremod = ECSImm)


###################################################
### code chunk number 9: mvpairs
###################################################
mvpairs(model = ECSI, data = mobi, LVs = "Expectation")


###################################################
### code chunk number 10: mvpairsfig
###################################################
mvpairs(model = ECSI, data = mobi, LVs = "Expectation")


###################################################
### code chunk number 11: sempls
###################################################
ecsi <- sempls(model = ECSI, data = mobi, wscheme = "centroid")


###################################################
### code chunk number 12: ecsi-structure (eval = FALSE)
###################################################
## ### Note, for rendering the path diagram graphviz (www.graphviz.org)
## ### must be available.
## pathDiagram(ecsi, file = "ecsi-structure", full = FALSE, edge.labels =
##   "both", output.type = "graphics", digits = 2, graphics.fmt = "pdf")


###################################################
### code chunk number 13: ecsi
###################################################
ecsi


###################################################
### code chunk number 14: names
###################################################
names(ecsi)


###################################################
### code chunk number 15: pathCoeff
###################################################
pC <- pathCoeff(ecsi)
print(pC, abbreviate = TRUE, minlength = 3)


###################################################
### code chunk number 16: totalEffects
###################################################
tE <- totalEffects(ecsi)
print(tE, abbreviate = TRUE, minlength = 3)


###################################################
### code chunk number 17: plsWeights
###################################################
plsWeights(ecsi)


###################################################
### code chunk number 18: plsLoadings
###################################################
plsLoadings(ecsi)


###################################################
### code chunk number 19: densresid
###################################################
densityplot(ecsi, use = "residuals")


###################################################
### code chunk number 20: plotsemplsfig
###################################################
plot(ecsi)


###################################################
### code chunk number 21: densresidfig
###################################################
densityplot(ecsi, use = "residuals")


###################################################
### code chunk number 22: loadecsiboot
###################################################
## load 'ecsiBoot.rda'
ptf_ecsiBoot <- system.file("semPLS-intro", "data", "ecsiBoot.rda",
  package = "semPLS")
load(ptf_ecsiBoot)
## load 'ecsiBootsummary.rda'
ptf_ecsiBootsummary <- system.file("semPLS-intro", "data", "ecsiBootsummary.rda",
  package = "semPLS")
load(ptf_ecsiBootsummary)


###################################################
### code chunk number 23: bootprep (eval = FALSE)
###################################################
## ## do not run every time for speed reasons
## set.seed(123)
## ecsiBoot <- bootsempls(ecsi, nboot = 500, start = "ones", verbose = FALSE)
## ecsiBoot


###################################################
### code chunk number 24: bootprep
###################################################
ecsiBoot


###################################################
### code chunk number 25: bootsummaryprep (eval = FALSE)
###################################################
## ## do not run every time for speed reasons
## ecsiBootsummary <- summary(ecsiBoot, type = "bca", level = 0.90)
## ecsiBootsummary


###################################################
### code chunk number 26: bootsummary
###################################################
ecsiBootsummary


###################################################
### code chunk number 27: bootdensityprint
###################################################
print(densityplot(ecsiBoot, pattern = "beta"))


###################################################
### code chunk number 28: bootplots (eval = FALSE)
###################################################
## densityplot(ecsiBoot, pattern = "beta")
## parallelplot(ecsiBoot, pattern = "beta", reflinesAt = c(0, 0.5),
##        alpha = 0.3, type = "bca", 
##        main = "Path Coefficients\nof 500 bootstrap samples")


###################################################
### code chunk number 29: invertLVs
###################################################
ECSI[["blocks"]]["Expectation"]
invertLVs(model = ECSI, LVs = c("Expectation"))[["blocks"]]["Expectation"]


###################################################
### code chunk number 30: addPath
###################################################
ECSI[["D"]]
addPath(model = ECSI, from = "Quality", to = "Loyalty")[["D"]]


###################################################
### code chunk number 31: removePath
###################################################
removePath(model = ECSI, from = "Image", to = c("Satisfaction", 
      "Loyalty"))[["D"]]


###################################################
### code chunk number 32: sem1 (eval = FALSE)
###################################################
## library("matrixcalc", pos = which(search()=="package:semPLS") + 1)
## library("sem", pos = which(search()=="package:semPLS") + 1)
## semmodECSI <- plsm2sem(model = ECSI, 
##      fixedLoad = c(names(mobi)[grep("1", names(mobi))], "CUSCO"),
##      fixedVarMV=TRUE, fixedVarLV=TRUE)
## ecsiSEM <- sem(model = semmodECSI, S = cor(mobi), N = nrow(mobi))
## betaIndx <- grep("beta*", names(ecsiSEM$coeff))
## cbind(ecsi$coefficients[names(ecsiSEM$coeff)[betaIndx], ], 
##      CBSEM = ecsiSEM$coeff[betaIndx])


###################################################
### code chunk number 33: sem2
###################################################
library("matrixcalc", pos = which(search()=="package:semPLS") + 1)
library("sem", pos = which(search()=="package:semPLS") + 1)
### For some reason 'plsm2sem' does not work in combination with Sweave.
### However, using the prompt chunk 'sem1' can be evaluated.
ptf <- system.file("semPLS-intro", "data", "semmodECSI.txt",
                   package = "semPLS")
semmodECSI <- specifyModel(file = ptf)
ecsiSEM <- sem(model = semmodECSI, S = cor(mobi), N = nrow(mobi),
               start.fn = startvalues2)
betaIndx <- grep("beta*", names(ecsiSEM$coeff))
cbind(ecsi$coefficients[names(ecsiSEM$coeff)[betaIndx], ], 
      CBSEM = ecsiSEM$coeff[betaIndx])


###################################################
### code chunk number 34: sem2 (eval = FALSE)
###################################################
## detach(package:sem)


###################################################
### code chunk number 35: read.splsm
###################################################
ptf <- system.file("SmartPLS", "workspace", "ecsi", "ECSI_Tenenhaus.splsm",
      package = "semPLS")
ECSIimported <- read.splsm(file=ptf, order = "generic")
for(i in names(ECSI)) print(all.equal(ECSI[i], ECSIimported[i]))


###################################################
### code chunk number 36: sessionInfo
###################################################
SI <- sessionInfo()
pkgs <- paste(sapply(c(SI$otherPkgs, SI$loadedOnly), function(x) 
                     paste("\\\\pkg{", x$Package, "} ", 
                           x$Version, sep = "")), collapse = ", ")


