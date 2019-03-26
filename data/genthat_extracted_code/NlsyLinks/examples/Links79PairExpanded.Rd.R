library(NlsyLinks)


### Name: Links79PairExpanded
### Title: Kinship linking file for pairs of relatives.  It builds upon the
###   'Links79Pair' dataset.
### Aliases: Links79PairExpanded
### Keywords: datasets

### ** Examples


library(NlsyLinks) #Load the package into the current R session.
olderR <- Links79PairExpanded$RExplicitOlderSibVersion  #Declare a concise variable name.
youngerR <- Links79PairExpanded$RExplicitYoungerSibVersion  #Declare a concise variable name.

plot(jitter(olderR), jitter(youngerR))  #Scatterplot the siblings' responses.
table(youngerR, olderR)  #Table of the relationship between the siblings' responses.
ftable(youngerR, olderR, dnn=c("Younger's Version", "Older's Version")) #A formatted table.

#write.csv(Links79PairExpanded, file='~/NlsyLinksStaging/Links79PairExpanded.csv', 
#  row.names=FALSE)




