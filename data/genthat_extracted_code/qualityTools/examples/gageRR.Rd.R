library(qualityTools)


### Name: gageRR
### Title: Gage R&R - Gage Repeatability and Reproducibility
### Aliases: gageRR

### ** Examples

#create a crossed Gage R&R Design
gdo = gageRRDesign(3,10, 2, randomize = FALSE)

#set the response i.e. Measurements
y = c(23,22,22,22,22,25,23,22,23,22,20,22,22,22,24,25,27,28,23,24,23,24,24,22,
      22,22,24,23,22,24,20,20,25,24,22,24,21,20,21,22,21,22,21,21,24,27,25,27,
      23,22,25,23,23,22,22,23,25,21,24,23)
response(gdo) = y

#perform a Gage R&R
gdo = gageRR(gdo, tolerance = 5)

#summary
summary(gdo)

#standard graphics for Gage R&R
plot(gdo)


##create a crossed Gage R&R Design - 
##Vardeman, VanValkenburg 1999 - Two-Way Random-Effects Analyses and Gauge
#gdo = gageRRDesign(Operators = 5, Parts = 2, Measurements = 3, randomize = FALSE)
#
##Measurements
#weight = c(3.481, 3.448, 3.485, 3.475, 3.472,
#           3.258, 3.254, 3.256, 3.249, 3.241,
#           3.477, 3.472, 3.464, 3.472, 3.470,
#           3.254, 3.247, 3.257, 3.238, 3.250,
#           3.470, 3.470, 3.477, 3.473, 3.474,
#           3.258, 3.239, 3.245, 3.240, 3.254)
#
##set the response i.e. Measurements
#response(gdo) = weight
#
##perform a Gage R&R
#gdo = gageRR(gdo)
#
##summary
#summary(gdo)
#
##standard graphics for Gage R&R
#plot(gdo)
#




