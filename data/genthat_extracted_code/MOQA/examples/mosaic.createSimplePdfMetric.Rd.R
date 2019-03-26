library(MOQA)


### Name: mosaic.createSimplePdfMetric
### Title: createSimplePdfMetric
### Aliases: mosaic.createSimplePdfMetric
### Keywords: pdf generate metric

### ** Examples

# load MOQA package
library('MOQA')

# specify the csv import file with metric data, use one column per variable
metric_datafile='c:/mosaic/metric_single_var.csv'

#specify output folder
outputFolder='c:/mosaic/output/'

#set missing threshold, optional, default is 99900
mosaic.setGlobalMissingTreshold(99900)

#set variable unit, optional
mosaic.setGlobalUnit('(cm)')

#set variable description, optional
mosaic.setGlobalDescription('Height')

#create PDF-report, uncomment to start report-generation
#mosaic.createSimplePdfMetric(metric_datafile, outputFolder)



