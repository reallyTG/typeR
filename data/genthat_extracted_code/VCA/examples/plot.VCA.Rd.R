library(VCA)


### Name: plot.VCA
### Title: Standard 'plot' Method for 'VCA' S3-Objects.
### Aliases: plot.VCA

### ** Examples

## Not run: 
##D data(dataEP05A2_1)
##D fit <- anovaVCA(y~day/run, dataEP05A2_1)
##D 
##D # standard plot without any extras
##D plot(fit)
##D 
##D # plot with some additional features
##D plot(fit, MeanLine=list(var=c("int", "day"), col=c("cyan", "blue"), lwd=c(2,2)))
##D 
##D # more complex model
##D data(realData)
##D Data <- realData[realData$PID == 1,]
##D fit2 <- anovaVCA(y~(calibration+lot)/day/run, Data)
##D plot(fit2, 
##D 		BG=list(var="calibration",
##D 				col=c("#f7fcfd","#e5f5f9","#ccece6","#99d8c9",
##D 				      "#66c2a4","#41ae76","#238b45","#006d2c","#00441b"),
##D 				col.table=TRUE),
##D 	VLine=list(var=c("calibration", "lot"),
##D 				   col=c("black", "darkgray"), lwd=c(2,1), col.table=TRUE),
##D 		JoinLevels=list(var="lot", col=c("#ffffb2","orangered","#feb24c"),
##D 				        lwd=c(2,2,2)),
##D 		MeanLine=list(var="lot", col="blue", lwd=2))
##D #' 
## End(Not run)



