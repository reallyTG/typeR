library(PAS)


### Name: PAS.binmod
### Title: binmod
### Aliases: PAS.binmod binmod

### ** Examples

#load PAS library
library (PAS)
#load the demo data
data (beef)
#perform binmod analysis under the default settings.
binmod.result=binmod (x , y , map)
#plot binmod result
plot(binmod.result)
str(binmod.result)
#Output the predicted phenotypic values that was obtained
#by 10-fold cross validation .
predict(binmod.result)
#predict the phenotypic values for new individuals
x1=x[sample(1:NROW(x) , 20), ]
bin.pred.x1=predict(binmod.result, newx=x1)
str(bin.pred.x1)



