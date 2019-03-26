library(FRESA.CAD)


### Name: rankInverseNormalDataFrame
### Title: rank-based inverse normal transformation of the data
### Aliases: rankInverseNormalDataFrame
### Keywords: Data_Conditioning

### ** Examples

	## Not run: 
##D 	# Start the graphics device driver to save all plots in a pdf format
##D 	pdf(file = "Example.pdf")
##D 	# Get the stage C prostate cancer data from the rpart package
##D 	library(rpart)
##D 	data(stagec)
##D 	# Split the stages into several columns
##D 	dataCancer <- cbind(stagec[,c(1:3,5:6)],
##D 	                    gleason4 = 1*(stagec[,7] == 4),
##D 	                    gleason5 = 1*(stagec[,7] == 5),
##D 	                    gleason6 = 1*(stagec[,7] == 6),
##D 	                    gleason7 = 1*(stagec[,7] == 7),
##D 	                    gleason8 = 1*(stagec[,7] == 8),
##D 	                    gleason910 = 1*(stagec[,7] >= 9),
##D 	                    eet = 1*(stagec[,4] == 2),
##D 	                    diploid = 1*(stagec[,8] == "diploid"),
##D 	                    tetraploid = 1*(stagec[,8] == "tetraploid"),
##D 	                    notAneuploid = 1-1*(stagec[,8] == "aneuploid"))
##D 	# Remove the incomplete cases
##D 	dataCancer <- dataCancer[complete.cases(dataCancer),]
##D 	# Load a pre-established data frame with the names and descriptions of all variables
##D 	data(cancerVarNames)
##D 	# Set the group of no progression
##D 	noProgress <- subset(dataCancer,pgstat==0)
##D 	# z-transform g2 values using the no-progression group as reference
##D 	dataCancerZTransform <- rankInverseNormalDataFrame(variableList = cancerVarNames[2,],
##D 	                                                   data = dataCancer,
##D 	                                                   referenceframe = noProgress)
##D 	# Shut down the graphics device driver
##D 	dev.off()
## End(Not run)



