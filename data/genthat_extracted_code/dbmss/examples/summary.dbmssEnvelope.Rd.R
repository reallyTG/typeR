library(dbmss)


### Name: summary.dbmssEnvelope
### Title: Summary of a confidence envelope
### Aliases: summary.dbmssEnvelope

### ** Examples

data(paracou16)
plot(paracou16)

# Calculate intertype K envelope
Envelope <- KEnvelope(paracou16, NumberOfSimulations = 20, Global = TRUE,
  ReferenceType = "V. Americana", NeighborType = "Q. Rosea")
plot(Envelope)
summary(Envelope)



