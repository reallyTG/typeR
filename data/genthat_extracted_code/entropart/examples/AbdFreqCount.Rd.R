library(entropart)


### Name: AbdFreqCount
### Title: Abundance Frequency Count of a Community
### Aliases: AbdFreqCount

### ** Examples

# Load Paracou data (number of trees per species in two 1-ha plot of a tropical forest
#      and their taxonomy)
data(Paracou618)
# Ns is the vector of abundances of the first plot
Ns <- Paracou618.MC$Nsi[, 1]

# Return the abundance frequency count
(AbdFreqCount(Ns) -> afc)
plot(afc, xlab="Number of observations", ylab="Number of species")
lines(afc)



