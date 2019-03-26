### R code from vignette source 'ashg2012.Rnw'

###################################################
### code chunk number 1: load-gtx-and-data
###################################################
library(gtx)
data(lipid.cad.scores)
# format small P-value for LaTeX
latexp <- function(pval, digits = 1) {
  paste(round(10^(log10(pval) - floor(log10(pval))), digits), "\\\\times10^{", floor(log10(pval)), "}", sep = "")
}
# compute odds-per-percent-change at qq-th quantile of estimate and CI
# assuming risk score in ln(biomarker) and outcome in ln(odds)
oppc <- function(grs, pc, qq, digits = 2) {
  return(round(sort(exp((grs$ahat + qnorm(qq)*grs$aSE)*log((100 + pc)/100))), digits))
}


###################################################
### code chunk number 2: hdl-plot1
###################################################
with(subset(lipid.cad.scores, score == "HDL"), {
  par(mar = c(4, 4, 0, 0.5) + 0.1)
  grs.plot(coef, beta_CAD, se_CAD, locus, textpos = c(3,3,1,1,1,1,3,1,3,1))
  title(xlab = "ln change in HDL per allele",
        ylab = "ln(odds) change in CAD risk per allele")
})


###################################################
### code chunk number 3: tg-plot1
###################################################
with(subset(lipid.cad.scores, score == "TG"), {
  par(mar = c(4, 4, 0, 0.5) + 0.1)
  grs.plot(coef, beta_CAD, se_CAD, locus, textpos = c(1,1,1,1,1,1,1,1,3))
  title(xlab = "ln change in triglycerides per allele",
        ylab = "ln(odds) change in CAD risk per allele")
})


###################################################
### code chunk number 4: fit-all-snps
###################################################
hdl.grs1 <- with(subset(lipid.cad.scores, score == "HDL"), grs.summary(coef, beta_CAD, se_CAD, 38684 + 9633))
tg.grs1 <- with(subset(lipid.cad.scores, score == "TG"), grs.summary(coef, beta_CAD, se_CAD, 38684 + 9633))


###################################################
### code chunk number 5: fit-subset-snps
###################################################
hdl.filter <- with(subset(lipid.cad.scores, score == "HDL"), grs.filter.Qrs(coef, beta_CAD, se_CAD))
hdl.grs2 <- with(subset(lipid.cad.scores, score == "HDL"), grs.summary(coef[hdl.filter], beta_CAD[hdl.filter], se_CAD[hdl.filter], 38684 + 9633))
tg.filter <- with(subset(lipid.cad.scores, score == "TG"), grs.filter.Qrs(coef, beta_CAD, se_CAD))
tg.grs2 <- with(subset(lipid.cad.scores, score == "TG"), grs.summary(coef[tg.filter], beta_CAD[tg.filter], se_CAD[tg.filter], 38684 + 9633))


###################################################
### code chunk number 6: hdl-plot2
###################################################
with(subset(lipid.cad.scores, score == "HDL"), {
  par(mar = c(4, 4, 0, 0.5) + 0.1)
  grs.plot(coef[hdl.filter], beta_CAD[hdl.filter], se_CAD[hdl.filter], locus[hdl.filter],
           textpos = c(3,3,1,1,1,1,3,1,3,1)[hdl.filter])
  title(xlab = "ln change in HDL per allele",
        ylab = "ln(odds) change in CAD risk per allele")
})


###################################################
### code chunk number 7: tg-plot2
###################################################
with(subset(lipid.cad.scores, score == "TG"), {
  par(mar = c(4, 4, 0, 0.5) + 0.1)
  grs.plot(coef[tg.filter], beta_CAD[tg.filter], se_CAD[tg.filter], locus[tg.filter],
           textpos = c(1,1,1,1,1,1,1,1,3)[tg.filter])
  title(xlab = "ln change in triglycerides per allele",
        ylab = "ln(odds) change in CAD risk per allele")
})


