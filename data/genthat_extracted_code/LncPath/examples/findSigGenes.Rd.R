library(LncPath)


### Name: findSigGenes
### Title: Find genes significantly differentially expressed between two
###   conditions.
### Aliases: findSigGenes
### Keywords: ~kwd1 ~kwd2

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.
Profile <- getExampleData("Profile")
Labels <- getExampleData("Labels")

SigGenes <- findSigGenes(Profile, Labels)
head(SigGenes)




