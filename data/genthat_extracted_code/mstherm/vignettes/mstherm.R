## ------------------------------------------------------------------------
library(mstherm)
control <- system.file("extdata", "demo_project/control.tsv", package="mstherm")
annots <- system.file("extdata", "demo_project/annots.tsv", package="mstherm")
expt <- MSThermExperiment(control, annots)

## ---- fig.cap="Summary of normalization"---------------------------------
expt <- normalize_to_std(expt, "cRAP_ALBU_BOVIN")

## ---- message=FALSE, results="hide"--------------------------------------
res <- model_experiment(expt, bootstrap=T, smooth=T, min_rep_psm=3, np=1)

## ---- message=FALSE, results="hide"--------------------------------------
expt <- normalize_to_tm( expt, res )
res  <- model_experiment(expt, bootstrap=T, smooth=T, min_rep_psm=3, np=1)

## ------------------------------------------------------------------------
plot(res$P38707)

## ---- eval=FALSE---------------------------------------------------------
#  pdf("models.pdf", 5, 5, pointsize=10, useDingbats=F)
#  plot(res)
#  dev.off()

