library(BCellMA)


### Name: nucleotide_mutation
### Title: The frequencies of nucleotide mutations and the frequencies of
###   transition and transversion
### Aliases: nucleotide_mutation

### ** Examples

data(IMGTtab8)
bm_proband<- nucleotide_mutation(IMGTtab8[,11:22])
percentlabels<- round(bm_proband$vregion_nt_mut/sum(bm_proband$vregion_nt_mut)*100)
pielabels<- paste(percentlabels, "%", sep="")
pie(bm_proband$vregion_nt_mut, col=c("grey50","black","grey90","white"),
    labels=pielabels, cex=1.5, radius = 0.3)
legend("right", c(" prod. IGHV"), cex=1.5)
legend("topleft", c("A","G","T","C"), cex=2, fill=c("grey50","black",
                                                   "grey90","white"))



