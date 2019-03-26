library(VFP)


### Name: legend.rm
### Title: Add Legend to Right Margin.
### Aliases: legend.rm

### ** Examples

## No test: 
library(VCA)
data(VCAdata1)
# perform VCA-anaylsis
lst <- anovaVCA(y~(device+lot)/day/run, VCAdata1, by="sample")
# transform list of VCA-objects into required matrix
mat <- getMat.VCA(lst)		# automatically selects "total"
mat

# fit all 9 models batch-wise
res <- fit.vfp(model.no=1:10, Data=mat)

plot(res, mar=c(5.1, 4.1, 4.1,15), Crit=NULL)

legend.rm(cex=1.25, text.font=10,
	 legend=c(
    paste0("AIC:    ", signif(as.numeric(res$AIC["Model_6"]), 4)),
	   paste0("Dev:    ", signif(as.numeric(res$Deviance["Model_6"]), 4)),
    paste0("RSS:    ", signif(as.numeric(res$RSS["Model_6"]),4))))
## End(No test)



