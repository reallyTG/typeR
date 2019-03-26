library(fingerPro)


### Name: fingerPro-package
### Title: Sediment Source Fingerprinting
### Aliases: fingerPro-package fingerPro
### Keywords: Sediment source fingerprinting package

### ** Examples

#Created on 22/08/2018

#If you want to use your own data
#setwd("the directory that contains your dataset")
#data <- read.table('your dataset', header = T, sep = '\t')
#install.packages("fingerPro")
#library(fingerPro)
#Example of the data included in the fingerPro package
#Load the dataset called "catchment" 

# "Catchment": this dataset has been selected from a Mediterranean catchment for 
#this purpose and contains high-quality radionuclides and geochemistry data.
#AG (cropland)
#PI and PI1 (Pine forest, at first looks different but when you display de LDA plot 
#you will see that the wisher decision in join both pines as the same source)
#SS (subsoil)
data <- catchment
#boxPlot(data, columns = 1:6, ncol = 3)
#correlationPlot(data, columns = 1:5, mixtures = TRUE)
LDAPlot(data, P3D=FALSE)
#variables are collinear
#select the optimum set of tracers by implementing the statistical tests 
data <- rangeTest(data)
data <- KWTest(data)
data <- DFATest(data)
#Check how the selected tracers discriminate between sources
LDAPlot(data, P3D=FALSE)
#change P3D=FALSE to P3D=TRUE to visualize the 3D LDAPlot
#2D and 3D LDAPlots suggest that two of the sources have to be combined
#reload the original dataset "catchment"
data <- catchment
# Combine sources PI1 and PI based on the previous LDAPlot
data$Land_Use[data$Land_Use == 'PI1'] <- 'PI'
#select the optimum set of tracers by implementing the statistical tests 
data <- rangeTest(data)
data <- KWTest(data)
data <- DFATest(data)
LDAPlot(data, P3D=FALSE)
PCAPlot(data)
#Now the optimum tracer properties selected discriminate well, so proceed with the unmix function
result <- unmix(data, samples = 100L, iter =100L)
#Display the results
plotResults(result, y_high = 5, n = 1)
writeResults(result)



