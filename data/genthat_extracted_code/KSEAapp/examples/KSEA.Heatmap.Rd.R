library(KSEAapp)


### Name: KSEA.Heatmap
### Title: The KSEA App Analysis (KSEA Heatmap Only)
### Aliases: KSEA.Heatmap

### ** Examples

#The score.list input must be a list of the data frame outputs from KSEA.Scores() function
#KSEA.Scores.1, KSEA.Scores.2, and KSEA.Scores.3 are all 
#sample datasets provided within this package

KSEA.Heatmap(score.list=list(KSEA.Scores.1, KSEA.Scores.2, KSEA.Scores.3), 
             sample.labels=c("Tumor.A", "Tumor.B", "Tumor.C"), 
             stats="p.value", m.cutoff=3, p.cutoff=0.05, sample.cluster=TRUE)




