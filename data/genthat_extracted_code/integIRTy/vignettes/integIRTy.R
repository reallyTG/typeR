### R code from vignette source 'integIRTy.Rnw'

###################################################
### code chunk number 1: integIRTy.Rnw:38-40
###################################################
options(width=80)
options(continue=' ')


###################################################
### code chunk number 2: loadLibrary
###################################################
library(integIRTy)


###################################################
### code chunk number 3: loadData
###################################################
data(OV)
ls()


###################################################
### code chunk number 4: lists
###################################################
controlList <- list(Expr_N, Methy_N, CN_N)
tumorList <- list(Expr_T, Methy_T, CN_T)


###################################################
### code chunk number 5: testObject
###################################################
testObject <- function(object) {
  exists(as.character(substitute(object)))
}


###################################################
### code chunk number 6: runFromRaw
###################################################
if(!testObject(runFromRaw)) {
  runFromRaw <- intIRTeasyRunFromRaw(platforms=tumorList, 
                                     platformsCtr=controlList, 
                                     assayType=c("Expr", "Methy", "CN"), 
                                     permutationMethod="gene sampling")
}
class(runFromRaw)
attributes(runFromRaw)


###################################################
### code chunk number 7: integIRTy.Rnw:164-187
###################################################
panel.hist <- function(x, ...) {
  usr <- par("usr"); on.exit(par(usr))
  par(usr = c(usr[1:2], 0, 1.5) )
  h <- hist(x, breaks=50, plot = FALSE)
  breaks <- h$breaks; nB <- length(breaks)
  y <- h$counts; y <- y/max(y)
  rect(breaks[-nB], 0, breaks[-1], y, col="cyan", ...)
}

panel.cor <- function(x, y, digits=2, prefix="", cex.cor) {
  usr <- par("usr"); on.exit(par(usr))
  par(usr = c(0, 1, 0, 1))
  r <- abs(cor(x, y, use='complete.obs'))
  txt <- format(c(r, 0.123456789), digits=digits)[1]
  txt <- paste(prefix, txt, sep="")
  if(missing(cex.cor)) cex <- 0.6/strwidth(txt)
  text(0.5, 0.5, txt, cex = cex)
}
panel.smooth <- function(...){
  par(new=TRUE);
  smoothScatter(...)
  abline(0, 1, col=2, lty=2)
}


###################################################
### code chunk number 8: MatrixScatter
###################################################
runFromRaw_ScoreMat <- runFromRaw$estimatedScoreMat
pairs(runFromRaw_ScoreMat, lower.panel=panel.cor, upper.panel=panel.smooth,
        labels=c('Expression', 'Methylation', 'Copy \n Number', 'Integrated'),
        cex.labels=1.2, gap=1.7)


###################################################
### code chunk number 9: DataDichotomization
###################################################
if(!testObject(binDat_CN)){
  binDat_expr <- dichotomize(Expr_T, Expr_N, assayType='Expr')
  binDat_methy <- dichotomize(Methy_T, Methy_N, assayType='Methy')
  binDat_CN <- dichotomize(CN_T, CN_N, assayType='CN')
}


###################################################
### code chunk number 10: FitOnSingleAssay
###################################################
if(!testObject(fit2PL_CN)){
  fit2PL_Expr <- fitOnSinglePlat(binDat_expr, model=3)
  fit2PL_Methy <- fitOnSinglePlat(binDat_methy, model=3)
  fit2PL_CN <- fitOnSinglePlat(binDat_CN, model=3)
}


###################################################
### code chunk number 11: integIRTy.Rnw:240-246
###################################################
dffclt_expr <- coef(fit2PL_Expr$fit)[, 'Dffclt']
dscrmn_expr <- coef(fit2PL_Expr$fit)[, 'Dscrmn']
dffclt_methy <- coef(fit2PL_Methy$fit)[, 'Dffclt']
dscrmn_methy <- coef(fit2PL_Methy$fit)[, 'Dscrmn']
dffclt_CN <- coef(fit2PL_CN$fit)[, 'Dffclt']
dscrmn_CN <- coef(fit2PL_CN$fit)[, 'Dscrmn']


###################################################
### code chunk number 12: LatentTraitEstimation
###################################################
if(!testObject(score_expr)){
  score_expr <- computeAbility(binDat_expr, dscrmn=dscrmn_expr, 
                               dffclt=dffclt_expr)
  score_methy <- computeAbility(binDat_methy, dscrmn=dscrmn_methy, 
                                dffclt=dffclt_methy)
  score_CN <- computeAbility(binDat_CN, dscrmn=dscrmn_CN, 
                             dffclt=dffclt_CN)
}


###################################################
### code chunk number 13: integratedLatentTrait
###################################################
if(!testObject(score_integrated)){
  score_integrated <- computeAbility(respMat=cbind(binDat_expr, 
                                       binDat_methy, binDat_CN), 
                                     dscrmn=c(dscrmn_expr, dscrmn_methy, dscrmn_CN), 
                                     dffclt=c(dffclt_expr, dffclt_methy, dffclt_CN))
}


###################################################
### code chunk number 14: integIRTy.Rnw:277-278
###################################################
all(score_integrated==runFromRaw_ScoreMat[, 4])


###################################################
### code chunk number 15: easy (eval = FALSE)
###################################################
## # not run to allow vignette to complete more quickly
## runFromBinary <- intIRTeasyRun(platforms=list(binDat_expr, 
##                                  binDat_methy, binDat_CN))


###################################################
### code chunk number 16: sessionInfo
###################################################
getwd()
sessionInfo()


