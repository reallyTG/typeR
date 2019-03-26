## ----setup, message=FALSE, echo=FALSE------------------------------------


## ----results='hide', message=FALSE, warning=FALSE------------------------
library("BacArena")

## ------------------------------------------------------------------------
data("Ec_core")

## ------------------------------------------------------------------------
bac <- Bac(Ec_core, limit_growth=FALSE)

## ------------------------------------------------------------------------
arena <- Arena(n=20, m=20)

## ----results='hide', message=FALSE, warning=FALSE------------------------
arena

## ------------------------------------------------------------------------
arena <- addOrg(arena,bac,amount=5)

## ------------------------------------------------------------------------
arena <- addSubs(arena, smax=0.5, mediac="EX_glc(e)", unit="mM")
arena <- addSubs(arena, smax=1, mediac=c("EX_pi(e)", "EX_h2o(e)", "EX_o2(e)", "EX_nh4(e)"), unit="mM")

## ------------------------------------------------------------------------
arena

## ----results='hide', message=FALSE, warning=FALSE------------------------
eval <- simEnv(arena,time=12)

## ------------------------------------------------------------------------
getVarSubs(eval)

## ------------------------------------------------------------------------
getSubHist(eval, "EX_glc(e)")

## ------------------------------------------------------------------------
par(mfrow=c(1,2))
plotCurves2(eval, legendpos = "right")

## ------------------------------------------------------------------------
par(mfrow=c(2,3))
evalArena(eval, show_legend = FALSE, time=seq(1,12,2))

## ------------------------------------------------------------------------
bac1 <- Bac(Ec_core,type="ecoli_wt")

## ------------------------------------------------------------------------
ecore_aux <- changeBounds(Ec_core, "EX_o2(e)",lb=0)
bac2 <- Bac(ecore_aux,type="ecoli_aux", setExInf=FALSE)

## ----results='hide', message=FALSE, warning=FALSE------------------------
arena <- Arena(n=20, m=20)
arena <- addOrg(arena,bac1,amount=5)
arena <- addOrg(arena,bac2,amount=5)
arena <- addSubs(arena, smax=0.5, mediac="EX_glc(e)", unit="mM")
arena <- addSubs(arena, smax=1, mediac=c("EX_pi(e)", "EX_h2o(e)", "EX_o2(e)", "EX_nh4(e)"), unit="mM")
eval <- simEnv(arena,time=10)

## ------------------------------------------------------------------------
par(mfrow=c(1,2))
plotCurves2(eval)

## ------------------------------------------------------------------------
par(mfrow=c(1,4))
evalArena(eval,c("Population","EX_glc(e)","EX_o2(e)","EX_etoh(e)"), time=10)
plotSubDist2(eval, sub = c("EX_etoh(e)"), times = c(1,5,10))


## ------------------------------------------------------------------------
minePheno(eval)
pmat <- getPhenoMat(eval)
pmat[,which(colSums(pmat)>0)]

## ----results='hide', message=FALSE, warning=FALSE------------------------
library(parallel)
replicates <- 2
cores <- ifelse(detectCores()>=2, 2, 1)
cl <- makeCluster(cores, type="PSOCK")
clusterExport(cl, "Ec_core")
simlist <- parLapply(cl, 1:replicates, function(i){
  bac   <- BacArena::Bac(model=Ec_core)
  arena <- BacArena::Arena(n=20, m=20)
  arena <- BacArena::addOrg(arena, bac, amount=10)
  arena <- BacArena::addSubs(arena, smax=0.5, mediac="EX_glc(e)", unit="mM")
  arena <- BacArena::addSubs(arena, smax=1, mediac=c("EX_pi(e)", "EX_h2o(e)", "EX_o2(e)", "EX_nh4(e)"), unit="mM")
  sim   <- BacArena::simEnv(arena, time=5)
})

## ------------------------------------------------------------------------
p <- plotGrowthCurve(simlist)
p[[2]]

## ------------------------------------------------------------------------
p <- plotSubCurve(simlist)
p[[3]]

## ------------------------------------------------------------------------
data("sihumi_test")

## ------------------------------------------------------------------------
p <- plotAbundance(sihumi_test)
p + ggplot2::scale_fill_manual(values=colpal2) + ggplot2::scale_color_manual(values=colpal2)

## ------------------------------------------------------------------------
plotSpecActivity(sihumi_test)[[2]]

## ------------------------------------------------------------------------
g <- findFeeding3(sihumi_test, time = 5, mets = c("EX_lac_D(e)", "EX_etoh(e)") )

## ------------------------------------------------------------------------
plotSubUsage(sihumi_test, subs = c("EX_sucr(e)", "EX_cellb(e)", "EX_ocdca(e)"))[[2]]

## ------------------------------------------------------------------------
plotShadowCost(sihumi_test, spec_nr=7)[[2]]

