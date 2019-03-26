library(ddalpha)


### Name: ddalphaf.getErrorRatePart
### Title: Test Functional DD-Classifier
### Aliases: ddalphaf.getErrorRatePart
### Keywords: benchmark

### ** Examples

# load the fdata
df = dataf.growth()

stat <- ddalphaf.getErrorRatePart(dataf = df$dataf, labels = df$labels, 
                          size = 0.3, times = 5,
                          adc.args = list(instance = "avr", 
                                         numFcn = 2, 
                                         numDer = 2))

cat("Classification error rate: ", stat$errors, ".\n", sep = "")





