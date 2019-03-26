library(Comp2ROC)


### Name: rocboot.summary
### Title: Summary of Comparation
### Aliases: rocboot.summary
### Keywords: Summary ROC

### ** Examples

## No test: 
data(zhang)
moda1 = "modality1" 
moda2 = "modality2"
nameE = "new_Zhang"
data = read.manually.introduced(zhang, moda1, TRUE, moda2, TRUE, "status", TRUE)
results = roc.curves.boot(data, name=nameE, mod1=moda1, mod2=moda2) 
rocboot.summary(results, moda1, moda2)
## End(No test)



