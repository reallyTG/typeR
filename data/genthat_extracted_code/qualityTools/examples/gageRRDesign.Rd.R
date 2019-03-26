library(qualityTools)


### Name: gageRRDesign
### Title: Gage R&R - Gage Repeatability and Reproducibility
### Aliases: gageRRDesign
### Keywords: Measurement Systems Analysis

### ** Examples

#create a Gage R&R Design
temp = gageRRDesign(3,10, 2, randomize = FALSE)

#set the response i.e. Measurements
y = c(23,22,22,22,22,25,23,22,23,22,20,22,22,22,24,25,27,28,23,24,23,24,24,22,
      22,22,24,23,22,24,20,20,25,24,22,24,21,20,21,22,21,22,21,21,24,27,25,27,
      23,22,25,23,23,22,22,23,25,21,24,23)
response(temp) = y

#perform a Gage R&R
gdo = gageRR(temp)

#summary
summary(gdo)

#standard graphics for Gage R&R
plot(gdo)



