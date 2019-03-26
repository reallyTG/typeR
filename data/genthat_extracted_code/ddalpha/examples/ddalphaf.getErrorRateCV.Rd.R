library(ddalpha)


### Name: ddalphaf.getErrorRateCV
### Title: Test Functional DD-Classifier
### Aliases: ddalphaf.getErrorRateCV
### Keywords: benchmark

### ** Examples

# load the fdata
df = dataf.growth()

stat <- ddalphaf.getErrorRateCV(dataf = df$dataf, labels = df$labels, 
                                numchunks = 5,
                                adc.args = list(instance = "avr", 
                                                numFcn = 2, 
                                                numDer = 2))
                                                
cat("Classification error rate: ", stat$errors, ".\n", sep = "")

    



