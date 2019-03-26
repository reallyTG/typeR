library(strataG)


### Name: gelato
### Title: GELATo - Group ExcLusion and Assignment Test
### Aliases: gelato gelatoPlot

### ** Examples

data(msats.g)

# Run GELATo analysis
gelato.fine <- gelato(msats.g, unk = "Offshore.South", nrep = 20)
gelato.fine

# Plot results
gelatoPlot(gelato.fine, "Offshore.South")




