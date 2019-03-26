## ------------------------------------------------------------------------
library(GerminaR)
dim(prosopis)
str(prosopis)

## ---- eval=FALSE---------------------------------------------------------
#  GerminaQuant()

## ------------------------------------------------------------------------
dt <- prosopis
smr <- ger_summary(SeedN = "seeds", evalName = "D", data = dt)
knitr::kable(head(smr, 10),align = "c")

## ------------------------------------------------------------------------
dt <- prosopis
grs <- ger_GRS(evalName = "D", data = dt)
grs

## ------------------------------------------------------------------------
dt <- prosopis
grp <- ger_GRP(SeedN = "seeds",evalName = "D", data = dt)
grp

## ------------------------------------------------------------------------
dt <- prosopis
gas <- ger_ASG(SeedN = "seeds", evalName = "D", data = dt)
gas

## ------------------------------------------------------------------------
dt <- prosopis
mgt <- ger_MGT(evalName = "D", data = dt)
mgt

## ------------------------------------------------------------------------
dt <- prosopis
mgr <- ger_MGR(evalName = "D", data = dt)
mgr

## ------------------------------------------------------------------------
dt <- prosopis
gsp <- ger_GSP(evalName = "D", data = dt)
gsp

## ------------------------------------------------------------------------
dt <- prosopis
syn <- ger_SYN(evalName = "D", data = dt)
syn

## ------------------------------------------------------------------------
dt <- prosopis
unc <- ger_UNC(evalName = "D", data = dt)
unc

## ------------------------------------------------------------------------
dt <- prosopis
sdg <- ger_SDG(evalName = "D", data = dt)
sdg

## ------------------------------------------------------------------------
dt <- prosopis
cvg <- ger_CVG(evalName = "D", data = dt)
cvg

## ------------------------------------------------------------------------
dt <- prosopis
vgt <- ger_VGT(evalName = "D", data = dt)
vgt

## ------------------------------------------------------------------------
dt <- prosopis
grt <- ger_intime(Factor = "nacl", SeedN = "seeds", evalName = "D", method = "percentage", data = dt)
head(grt, 10)

## ----  warning=FALSE-----------------------------------------------------
dt <- prosopis
grt <- ger_intime(Factor = "nacl", SeedN = "seeds", evalName = "D", method = "percentage", data = dt)

fplot(data = grt, type = "line",
      x = "evaluation",
      y = "mean",
      z = "nacl",
      ylab = "Germination ('%')",
      xlab = "days", lgl = "NaCl (mM)",
      lgd = "top", color = F)


