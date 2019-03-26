## ----HTML, include=FALSE-------------------------------------------------
## some frequently used HTML expressions
# use lowercase here because these tend to be variable names in the examples
zc <- "<i>Z</i><sub>C</sub>"
o2 <- "O<sub>2</sub>"
h2o <- "H<sub>2</sub>O"

## ----options, echo=FALSE----------------------------------------------------------------
options(width = 90)

## ----canprot, message=FALSE-------------------------------------------------------------
library(canprot)
data(canprot)

## ----labels-----------------------------------------------------------------------------
nH2Olab <- expression(bar(italic(n))[H[2] * O])
nO2lab <- expression(bar(italic(n))[O[2]])
ZClab <- expression(italic(Z)[C])
QEClab <- CHNOSZ::syslab(c("glutamine", "glutamic acid", "cysteine", "H2O", "O2"))
CHNOSlab <- CHNOSZ::syslab(c("CO2", "NH3", "H2S", "H2O", "O2"))

## ----aa_formula-------------------------------------------------------------------------
aa <- human_base
protein.formula <- CHNOSZ::protein.formula(aa)
ZC <- CHNOSZ::ZC(protein.formula)

## ----basis_comp, fig.width=6, fig.height=6, fig.align="center"--------------------------
par(mfrow = c(2, 2))
par(mar = c(4, 4, 2.5, 1))
par(cex = 1.1)
par(mgp = c(2.5, 1, 0))
for(basis in c("QEC", "CHNOS")) {
  CHNOSZ::basis(basis)
  protein.basis <- CHNOSZ::protein.basis(aa)
  protein.length <- CHNOSZ::protein.length(aa)
  residue.basis <- protein.basis / protein.length
  smoothScatter(ZC, residue.basis[, "O2"], xlab = ZClab, ylab = nO2lab)
  smoothScatter(ZC, residue.basis[, "H2O"], xlab = ZClab, ylab = nH2Olab)
  if(basis=="QEC") mtext(QEClab, outer = TRUE, cex = 1.2, line = -1.5)
  if(basis=="CHNOS") mtext(CHNOSlab, outer = TRUE, cex = 1.2, line = -15)
}

