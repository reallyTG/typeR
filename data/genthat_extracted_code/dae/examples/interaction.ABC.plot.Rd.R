library(dae)


### Name: interaction.ABC.plot
### Title: Plots an interaction plot for three factors
### Aliases: interaction.ABC.plot
### Keywords: aplot hplot design

### ** Examples

## Not run: 
##D ## plot for Example 14.1 from Mead, R. (1990). The Design of Experiments: 
##D ## Statistical Principles for Practical Application. Cambridge, 
##D ## Cambridge University Press.  
##D ## use ?SPLGrass.dat for details
##D data(SPLGrass.dat)
##D interaction.ABC.plot(Main.Grass, x.factor=Period,
##D                      groups.factor=Spring, trace.factor=Summer,
##D                      data=SPLGrass.dat,
##D                      title="Effect of Period, Spring and Summer on Main Grass")
##D 
##D ## plot for generated data
##D ## use ?ABC.Interact.dat for data set details
##D data(ABC.Interact.dat)
##D ## Add standard errors for plotting 
##D ## - here data contains a single value for each combintion of A, B and C
##D ## - need to supply name for data twice 
##D ABC.Interact.dat$se <- rep(c(0.5,1), each=4)
##D interaction.ABC.plot(MOE, A, B, C, data=ABC.Interact.dat,
##D                      ggplotFunc=list(geom_errorbar(data=ABC.Interact.dat, 
##D                                                    aes(ymax=MOE+se, ymin=MOE-se), 
##D                                                    width=0.2)))
## End(Not run)


