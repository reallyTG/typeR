library(seqRFLP)


### Name: plotenz
### Title: Plotting the simulated RFLP or TRFLP pattern
### Aliases: plotenz
### Keywords: RFLP TRFLP

### ** Examples


## plotenz() example

data(enzdata)
data(fil.phy)
fas <- ConvFas(fil = fil.phy, type = "phy")

enznames <- c("EcoRI", "Acc65I", "HinfI")

plotenz(sequences = fas, enznames = enznames, 
        enzdata = enzdata, side = TRUE, type = "RFLP")
		
plotenz(sequences = fas, enznames = enznames, 
        enzdata = enzdata, side = FALSE, type = "RFLP")		
				
plotenz(sequences = fas, enznames = enznames, 
        enzdata = enzdata, side = TRUE, type = "TRFLP", "T3")
		
		



