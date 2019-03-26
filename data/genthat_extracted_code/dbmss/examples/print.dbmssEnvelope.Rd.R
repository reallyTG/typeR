library(dbmss)


### Name: print.dbmssEnvelope
### Title: Print a confidence envelope
### Aliases: print.dbmssEnvelope

### ** Examples

data(paracou16)
plot(paracou16)

# Calculate intertype K envelope
Envelope <- KEnvelope(paracou16, NumberOfSimulations = 20, Global = TRUE,
  ReferenceType = "V. Americana", NeighborType = "Q. Rosea")
plot(Envelope)
# print
print(Envelope)



