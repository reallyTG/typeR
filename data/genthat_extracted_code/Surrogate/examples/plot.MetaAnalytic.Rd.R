library(Surrogate)


### Name: plot Meta-Analytic
### Title: Provides plots of trial- and individual-level surrogacy in the
###   meta-analytic framework
### Aliases: 'plot Meta-Analytic' plot.BifixedContCont plot.BimixedContCont
###   plot.UnifixedContCont plot.UnimixedContCont
### Keywords: Plot surrogacy Meta-analytic framework Trial-level surrogacy
###   Individual-level surrogacy Multiple-trial setting Single-trial
###   setting Continuous endpoint

### ** Examples

## Not run: 
##D  # time consuming code part
##D ##### Multiple-trial setting
##D 
##D ## Load ARMD dataset
##D data(ARMD)
##D 
##D ## Conduct a surrogacy analysis, using a weighted reduced univariate fixed effect model:
##D Sur <- UnifixedContCont(Dataset=ARMD, Surr=Diff24, True=Diff52, Treat=Treat, Trial.ID=Center, 
##D Pat.ID=Id, Number.Bootstraps=100, Model=c("Reduced"), Weighted=TRUE)
##D 
##D ## Request both trial- and individual-level surrogacy plots. In the trial-level plot,
##D ## make the size of the circles proportional to the number of patients in a trial:
##D plot(Sur, Trial.Level=TRUE, Weighted=TRUE, Indiv.Level=TRUE)
##D 
##D ## Make a trial-level surrogacy plot using filled blue circles that 
##D ## are transparent (to make sure that the results of overlapping trials remain
##D ## visible), and modify the title and the axes labels of the plot: 
##D plot(Sur, pch=16, col=rgb(.3, .2, 1, 0.3), Indiv.Level=FALSE, Trial.Level=TRUE, 
##D Weighted=TRUE, Main.Trial=c("Trial-level surrogacy (ARMD dataset)"), 
##D Xlab.Trial=c("Difference in vision after 6 months (Surrogate)"),
##D Ylab.Trial=c("Difference in vision after 12 months (True enpoint)"))
##D 
##D ## Add the estimated R2_trial value in the previous plot at position (X=-7, Y=11)  
##D ## (the previous plot should not have been closed):
##D R2trial <- format(round(as.numeric(Sur$Trial.R2[1]), 3))
##D text(x=-7, y=11, cex=1.4, labels=(bquote(paste("R"[trial]^{2}, "="~.(R2trial)))))
##D 
##D ## Make an Individual-level surrogacy plot with red squares to depict individuals
##D ## (rather than black circles):
##D plot(Sur, pch=15, col="red", Indiv.Level=TRUE, Trial.Level=FALSE)
##D 
##D ## Same plot as before, but now with smaller squares, a y-axis with range [-40; 40], 
##D ## and the estimated R2_indiv value in the title of the plot:
##D R2ind <- format(round(as.numeric(Sur$Indiv.R2[1]), 3))
##D plot(Sur, pch=15, col="red", Indiv.Level=TRUE, Trial.Level=FALSE, cex=.5, 
##D ylim=c(-40, 40), Main.Indiv=bquote(paste("R"[indiv]^{2}, "="~.(R2ind))))
##D 
##D 
##D ##### Single-trial setting
##D 
##D ## Conduct a surrogacy analysis in the single-trial meta-analytic setting:
##D SurSTS <- Single.Trial.RE.AA(Dataset=ARMD, Surr=Diff24, True=Diff52, Treat=Treat, Pat.ID=Id)
##D 
##D # Request a plot of individual-level surrogacy and a plot that depicts the Relative effect 
##D # and the constant RE assumption:
##D plot(SurSTS, Trial.Level=TRUE, Indiv.Level=TRUE)
## End(Not run)



