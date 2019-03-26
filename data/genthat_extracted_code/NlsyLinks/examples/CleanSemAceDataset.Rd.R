library(NlsyLinks)


### Name: CleanSemAceDataset
### Title: Produces a cleaned dataset that works well with when using SEM
###   to estimate a univariate ACE model.
### Aliases: CleanSemAceDataset
### Keywords: ACE

### ** Examples

library(NlsyLinks) #Load the package into the current R session.
dsLinks <- Links79PairExpanded #Start with the built-in data.frame in NlsyLinks
dsLinks <- dsLinks[dsLinks$RelationshipPath=='Gen2Siblings', ] #Use only NLSY79-C siblings

oName_S1 <- "MathStandardized_S1" #Stands for Outcome1
oName_S2 <- "MathStandardized_S2" #Stands for Outcome2
dsGroupSummary <- RGroupSummary(dsLinks, oName_S1, oName_S2)

dsClean <- CleanSemAceDataset( dsDirty=dsLinks, dsGroupSummary, oName_S1, oName_S2, rName="R" )
summary(dsClean)

dsClean$AbsDifference <- abs(dsClean$O1 - dsClean$O2)
plot(jitter(dsClean$R), dsClean$AbsDifference, col="gray70")



