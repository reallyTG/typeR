library(PAS)


### Name: binmod.predict
### Title: predict
### Aliases: PAS.binmod.predict binmod.predict predict predict.binmod

### ** Examples

#load PAS library
library(PAS)
#load the demo data
data(beef)
#conduct bin model analysis.
binmod.result=binmod(x, y, map)
#generate a new sample by sampling 20 individuals from the demo data
x0=x[sample(1:NROW(x) , 20), ]
#predict the genomic values of the new sample.
predict(binmod.result, newx=x0)



