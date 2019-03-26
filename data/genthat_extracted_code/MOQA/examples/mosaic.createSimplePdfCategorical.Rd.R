library(MOQA)


### Name: mosaic.createSimplePdfCategorical
### Title: createSimplePdfCategorical
### Aliases: mosaic.createSimplePdfCategorical
### Keywords: categorical pdf generate

### ** Examples


# load MOQA package
library('MOQA')

# specify the import file with categorial data
# first row has to contain variable names without special characters
categorial_datafile='c:/mosaic/cat_single_var_en.csv'

# specify output folder
outputFolder='c:/mosaic/outputs/'

# set treshold to detect missings, default is 99900 (adjust this line to change this global value, 
# but be careful)
mosaic.setGlobalMissingTreshold(99900)

# set description of var
mosaic.setGlobalCodelist(c('1=yes','2=no','99996=not specified','99997=not acquired'))

# create simple pdf file foreach variable column in categorial data file, uncomment to start 
# report-generation
# mosaic.createSimplePdfCategorical(categorial_datafile,outputFolder)



