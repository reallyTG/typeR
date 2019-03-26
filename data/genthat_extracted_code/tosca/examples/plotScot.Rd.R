library(tosca)


### Name: plotScot
### Title: Plots Counts of Documents or Words over Time (relative to
###   Corpus)
### Aliases: plotScot

### ** Examples

## No test: 
data(politics)
poliClean <- cleanTexts(politics)

# complete corpus
plotScot(object=poliClean)

# subcorpus
subID <- filterWord(poliClean, search=c("bush", "obama"), out="bin")
plotScot(object=poliClean, id=names(subID)[subID], curves="both", smooth=0.3)
## End(No test)



