library(entropart)


### Name: Coverage
### Title: Sample coverage of a community
### Aliases: Coverage

### ** Examples

# Load Paracou data (number of trees per species in two 1-ha plot of a tropical forest)
data(Paracou618)
# Ns is the vector of abundances of the metacommunity
Ns <- Paracou618.MC$Ns
# Calculate the sample coverage of the metacommunity
Coverage(Ns)    # Stored in Paracou618.SampleCoverage



