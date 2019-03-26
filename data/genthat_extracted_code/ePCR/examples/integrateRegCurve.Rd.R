library(ePCR)


### Name: integrateRegCurve
### Title: Integrate the area over/under the regularization path of a
###   penalized regression model
### Aliases: integrateRegCurve

### ** Examples

# Exemplify one PSP of the readily fitted ensembles
data(ePCRmodels)
RegAUC <- cbind(
integrateRegCurve(fit = DREAM@PSPs[[1]]@fit),
integrateRegCurve(fit = DREAM@PSPs[[2]]@fit),
integrateRegCurve(fit = DREAM@PSPs[[3]]@fit)
)
SortRegAUC <- RegAUC[order(apply(RegAUC, MARGIN=1, 
	FUN=function(z) abs(mean(z)) ), decreasing=TRUE),]
colnames(SortRegAUC) <- c(DREAM@PSPs[[1]]@description, 
DREAM@PSPs[[2]]@description,
DREAM@PSPs[[3]]@description)
SortRegAUC[1:10,] # Top 10 coefficients according to (absolute) regularization curve auc



