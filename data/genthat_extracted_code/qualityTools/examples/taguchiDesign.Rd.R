library(qualityTools)


### Name: taguchiDesign
### Title: Taguchi Designs
### Aliases: taguchiDesign
### Keywords: Design of Experiments Six Sigma design

### ** Examples

tdo = taguchiDesign("L9_3")
values(tdo) = list(A = c("material 1","material 2","material 3"), 
                   B = c(29, 30, 35))
names(tdo) = c("Factors", "Are", "Documented", "In The Design")
response(tdo) = rnorm(9)
summary(tdo)
effectPlot(tdo)



