library(MOQA)


### Name: mosaic.createSimplePdfMetricDataframe
### Title: createSimplePdfMetricDataframe
### Aliases: mosaic.createSimplePdfMetricDataframe
### Keywords: pdf generate metric

### ** Examples

# load MOQA package
library('MOQA')

# specify the metric dataframe with 1-n columns, here sample data is generated
metric_data=data.frame(matrix(rnorm(20), nrow=10))

#specify output folder
outputFolder="c:/mosaic/outputs/"

# set treshold to detect missings, default is 99900 (adjust this line to change this global value
# but be careful)
mosaic.setGlobalMissingTreshold(99900)

# create PDF-Files for vars, 
# uncomment to start report-generation
#mosaic.createSimplePdfMetricDataframe(metric_data, outputFolder)



