library(BAMMtools)


### Name: generateControlFile
### Title: Generate control file for 'BAMM'
### Aliases: generateControlFile

### ** Examples

#Produce a blank template control file
generateControlFile(file = 'traitcontrol.txt', type='trait')

#Produce a customized control file
data(whales)

#get bamm priors to supply to control file
priors <- setBAMMpriors(whales, outfile = NULL)

generateControlFile(file = 'divcontrol.txt', params = list(
    treefile = 'whales.tre',
    globalSamplingFraction = '1',
    numberOfGenerations = '100000',
    overwrite = '1',
    lambdaInitPrior = as.numeric(priors['lambdaInitPrior']),
    lambdaShiftPrior = as.numeric(priors['lambdaShiftPrior']),
    muInitPrior = as.numeric(priors['muInitPrior']),
    expectedNumberOfShifts = '1'))



