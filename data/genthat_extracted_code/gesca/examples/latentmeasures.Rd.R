library(gesca)


### Name: latentmeasures
### Title: Means, Variances, and Correlations of Latent Variables
### Aliases: latentmeasures

### ** Examples


library(gesca)
data(gesca.rick2) # Organizational identification example of Bagozzi

# Model specification
myModel <- "
		# Measurement model 
		OP =~ cei1 + cei2 + cei3
		OI =~ ma1 + ma2 + ma3
		AC_J =~ orgcmt1 + orgcmt2 + orgcmt3
		AC_L =~ orgcmt5 + orgcmt6 + orgcmt8
		
		# Structural model 
		OI ~ OP
		AC_J ~ OI
		AC_L ~ OI
"

# Run a multiple-group GSCA with the grouping variable gender:
GSCA.group <- gesca.run(myModel, gesca.rick2, group.name = "gender", nbt=50)
latentmeasures(GSCA.group)




