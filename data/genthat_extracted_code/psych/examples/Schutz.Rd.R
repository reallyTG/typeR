library(psych)


### Name: Schutz
### Title: The Schutz correlation matrix example from Shapiro and ten Berge
### Aliases: Schutz
### Keywords: datasets

### ** Examples

data(Schutz)
corPlot(Schutz,numbers=TRUE,upper=FALSE)
#f4min <- fa(Schutz,4,fm="minrank")  #for an example of minimum rank factor Analysis
#compare to
#f4 <- fa(Schutz,4,fm="mle")  #for the maximum likelihood solution which has a Heywood case 



