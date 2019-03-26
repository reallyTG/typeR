library(careless)


### Name: mahad
### Title: Find and graph Mahalanobis Distance (D) and flag potential
###   outliers.
### Aliases: mahad

### ** Examples

mahad_raw <- mahad(careless_dataset) #only the distances themselves
mahad_flags <- mahad(careless_dataset, flag = TRUE) #additionally flag outliers
mahad_flags <- mahad(careless_dataset, flag = TRUE, confidence = 0.999) #Apply a strict criterion



