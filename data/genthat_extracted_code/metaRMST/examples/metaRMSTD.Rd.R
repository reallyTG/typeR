library(metaRMST)


### Name: metaRMSTD
### Title: Meta-analysis of RMSTD at multiple time horizons
### Aliases: metaRMSTD

### ** Examples


# read in built-in dataset 
data(AorticStenosisTrials)

## No test: 
# meta-analysis to obtain combined effect by multivariate model (method="mvma")
result <- metaRMSTD(AorticStenosisTrials, time_horizons=c(12,24,36), MA_method="mvma")

# generate figure: 
obj <- RMSTcurves(AorticStenosisTrials, time_horizons=c(12,24,36), tmax=40, nboot=500)
RMSTplot(obj, xlim=c(0,40), ylim=c(-0.25,2.75), yby=0.5, ylab="RMSTD (mos)", xlab="Time (mos)")
## End(No test)

## Don't show: 
set.seed(10)
sample_rows <- sample(1:nrow(AorticStenosisTrials),500, replace=FALSE)
result_hidden <- metaRMSTD(AorticStenosisTrials[sample_rows,], time_horizons=c(12,24,36), MA_method="uni")
obj_hidden <- RMSTcurves(AorticStenosisTrials[sample_rows,], time_horizons=c(12,24,36), tmax=40, MA_mvma_boot=FALSE, MA_uni_flex=FALSE, MA_mvma=FALSE, tstep=1)
RMSTplot(obj_hidden, xlim=c(0,40), ylim=c(-0.25,2.75), yby=0.5, ylab="RMSTD (mos)", xlab="Time (mos)")
## End(Don't show)




