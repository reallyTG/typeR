library(entropart)


### Name: DivPart
### Title: Diversity Partition of a metacommunity
### Aliases: DivPart is.DivPart plot.DivPart summary.DivPart

### ** Examples

# Load Paracou data (number of trees per species in two 1-ha plot of a tropical forest)
data(Paracou618)
# Estimate Shannon diversity.
summary(DivPart(q = 1, Paracou618.MC, Biased = FALSE) -> dp)
plot(dp)



