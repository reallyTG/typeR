library(MASSTIMATE)


### Name: cQE
### Title: Body Mass Estimates Using Bipedal Correction Factor
### Aliases: cQE

### ** Examples

##Bipedal dinosaurs
data(dinosbip)

#Estimates for Tyrannosaurus (FMNH PR 2081 "Sue")
sue<-which(dinosbip$Taxon=="TyrannosaurusFMNH2081")
cQE(dinosbip$FC[sue]) #default correction factor
cQE(dinosbip$FC[sue], cor = 1.815) #based on eccentricity of the femur

##Estimates of bipedal dinosaurs using phylogeneteically corrected linear and quadratic equations
cQE(dinosbip$FC, equation = "phylocor", cor = dinosbip$cor, quadratic = TRUE, data = dinosbip)



