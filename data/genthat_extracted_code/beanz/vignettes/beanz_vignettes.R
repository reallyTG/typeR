## ---- eval=T, echo=FALSE-------------------------------------------------
require(beanz);

## ---- eval=T, echo=TRUE--------------------------------------------------

var.cov    <- c("lvef", "sodium", "any.vasodilator.use");
var.resp   <- "y";
var.trt    <- "trt";
var.censor <- "censor";
resptype   <- "survival";

subgrp.effect <- bzGetSubgrpRaw(solvd.sub,
                                  var.resp   = var.resp,
                                  var.trt    = var.trt,
                                  var.cov    = var.cov,
                                  var.censor = var.censor,
                                  resptype   = resptype);
print(subgrp.effect);


## ---- eval=T, echo=TRUE--------------------------------------------------

var.estvar <- c("Estimate", "Variance");

rst.nse <- bzCallStan("nse", dat.sub=subgrp.effect,
                     var.estvar = var.estvar, var.cov = var.cov,
                     par.pri = c(B=1000),
                     chains=4, iter=4000,
                     warmup=2000, seed=1000, cores=1);

rst.sr  <- bzCallStan("sr", dat.sub=subgrp.effect,
                     var.estvar = var.estvar, var.cov = var.cov,
                     par.pri = c(B=1000, C=1000),
                     chains=4, iter=4000,
                     warmup=2000,  seed=1000, cores=1);

rst.bs  <- bzCallStan("bs", dat.sub=subgrp.effect,
                     var.estvar = var.estvar, var.cov = var.cov,
                     par.pri = c(B=1000, D=1),
                     chains=4, iter=4000, warmup=2000,  seed=1000, cores=1);


## ---- eval=T, echo=TRUE, fig.width=6, fig.height=5-----------------------
sel.grps <- c(1,4,5);
tbl.sub <- bzSummary(rst.sr, ref.stan.rst=rst.nse, ref.sel.grps=1);
print(tbl.sub);
bzPlot(rst.sr, sel.grps = sel.grps, ref.stan.rst=rst.nse, ref.sel.grps=1);
bzForest(rst.sr, sel.grps = sel.grps, ref.stan.rst=rst.nse, ref.sel.grps=1);

## ---- eval=T, echo=TRUE, fig.width=6, fig.height=5-----------------------
tbl.sub <- bzSummary(rst.bs, ref.stan.rst=rst.nse, ref.sel.grps=1);
print(tbl.sub);
bzPlot(rst.bs, sel.grps = sel.grps, ref.stan.rst=rst.nse, ref.sel.grps=1);
bzForest(rst.bs, sel.grps = sel.grps, ref.stan.rst=rst.nse, ref.sel.grps=1);

## ---- eval=T, echo=TRUE, fig.width=6, fig.height=5-----------------------
tbl.sub <- bzSummaryComp(rst.sr, sel.grps=sel.grps);
print(tbl.sub);
bzPlot(rst.sr, sel.grps = sel.grps);
bzForest(rst.sr, sel.grps = sel.grps);

## ---- eval=T, echo=TRUE, fig.width=6, fig.height=5-----------------------
tbl.sub <- bzSummaryComp(rst.bs, sel.grps=sel.grps);
print(tbl.sub);
bzPlotComp(rst.bs, sel.grps = sel.grps);
bzForestComp(rst.bs, sel.grps = sel.grps);

## ---- echo=TRUE----------------------------------------------------------
lst.rst     <- list(nse=rst.nse, sr=rst.sr, bs=rst.bs);
tbl.summary <- bzRptTbl(lst.rst, dat.sub = subgrp.effect, var.cov = var.cov);
print(tbl.summary);

## ---- eval=T, echo=TRUE--------------------------------------------------
pred.dist <- bzPredSubgrp(rst.sr,
                                  dat.sub=subgrp.effect,
                                  var.estvar = var.estvar);
head(pred.dist);

## ---- eval=F-------------------------------------------------------------
#  bzShiny();

## ---- echo=T-------------------------------------------------------------
gs.pval <- bzGailSimon(subgrp.effect$Estimate,
                       sqrt(subgrp.effect$Variance));
print(gs.pval);

