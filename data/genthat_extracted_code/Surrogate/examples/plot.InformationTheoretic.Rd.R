library(Surrogate)


### Name: plot Information-Theoretic
### Title: Provides plots of trial- and individual-level surrogacy in the
###   Information-Theoretic framework
### Aliases: 'plot Information-Theoretic' plot.FixedContContIT
###   plot.MixedContContIT
### Keywords: Plot surrogacy Information-Theoretic framework Trial-level
###   surrogacy Individual-level surrogacy Multiple-trial setting

### ** Examples

## Load ARMD dataset
data(ARMD)

## Conduct a surrogacy analysis, using a weighted reduced univariate fixed effect model:
Sur <- MixedContContIT(Dataset=ARMD, Surr=Diff24, True=Diff52, Treat=Treat, Trial.ID=Center, 
Pat.ID=Id, Model=c("Full"))

## Request both trial- and individual-level surrogacy plots. In the trial-level plot,
## make the size of the circles proportional to the number of patients in a trial:
plot(Sur, Trial.Level=TRUE, Weighted=TRUE, Indiv.Level=TRUE)

## Make a trial-level surrogacy plot using filled blue circles that 
## are transparent (to make sure that the results of overlapping trials remain
## visible), and modify the title and the axes labels of the plot: 
plot(Sur, pch=16, col=rgb(.3, .2, 1, 0.3), Indiv.Level=FALSE, Trial.Level=TRUE, 
Weighted=TRUE, Main.Trial=c("Trial-level surrogacy (ARMD dataset)"), 
Xlab.Trial=c("Difference in vision after 6 months (Surrogate)"),
Ylab.Trial=c("Difference in vision after 12 months (True enpoint)"))

## Add the estimated R2_ht value in the previous plot at position (X=-2.2, Y=0)  
## (the previous plot should not have been closed):
R2ht <- format(round(as.numeric(Sur$R2ht[1]), 3))
text(x=-2.2, y=0, cex=1.4, labels=(bquote(paste("R"[ht]^{2}, "="~.(R2ht)))))

## Make an Individual-level surrogacy plot with red squares to depict individuals
## (rather than black circles):
plot(Sur, pch=15, col="red", Indiv.Level=TRUE, Trial.Level=FALSE)



