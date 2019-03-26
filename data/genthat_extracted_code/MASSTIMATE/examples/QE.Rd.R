library(MASSTIMATE)


### Name: QE
### Title: Body Mass Estimates Using Combined Humeral and Femoral
###   Circumferences
### Aliases: QE

### ** Examples

##Dinosaur data from Campione and Evans (2012) for quadrupedal dinosaurs
data(dinos)

##Combined equation based on the raw regression
QE(HC = dinos$HC, FC = dinos$FC, quadratic = TRUE, data = dinos)

##Combined equation based on the phylogenetically corrected regression, data not specified
QE(HC = dinos$HC, FC = dinos$FC, equation = "phylocor")



