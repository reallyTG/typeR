library(ddalpha)


### Name: ddalphaf.test
### Title: Test Functional DD-Classifier
### Aliases: ddalphaf.test
### Keywords: benchmark

### ** Examples


# load the fdata
df = dataf.growth()

samp = c(35:70)

ddalphaf.test(learn = df$dataf[-samp], learnlabels = df$labels[-samp], 
              test =  df$dataf[samp],  testlabels =  df$labels[samp], 
              adc.args = list(instance = "avr", 
                              numFcn = 2, 
                              numDer = 2))




