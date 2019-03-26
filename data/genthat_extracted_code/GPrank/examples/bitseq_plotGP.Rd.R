library(GPrank)


### Name: bitseq_plotGP
### Title: Plotting fitted GP models for the BitSeq example
### Aliases: bitseq_plotGP
### Keywords: GP multi plot

### ** Examples

## Not run: 
##D RNAseqDATA
##D gpData=RNAseqDATA$reltr
##D GPfits=bitseq_fitGPs(gpData)
##D item="ARAP2"
##D multi=1
##D ylimits=c(0,1)
##D x_ticks=c("0","5","10","20","40","80","160","320","640","1280")
##D x_label="Time (minutes)"
##D y_label="Expression level (rpkm)"
##D plotName="ARAP2_reltr.pdf"
##D bitseq_plotGP(item, GPfits, gpData, multi, ylimits, x_ticks, x_label, y_label, plotName)
## End(Not run)




