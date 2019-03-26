library(MASSTIMATE)


### Name: AHR1985
### Title: Body Mass Estimates Using Anderson et al. (1985)
### Aliases: AHR1985

### ** Examples

##Quadrupedal dinosaurs
data(dinos)
AHR1985(dinos$HC, dinos$FC, equation = "quad", data = dinos)

##Bipedal dinosaurs
data(dinosbip)
AHR1985(HC=NULL, dinosbip$FC, equation = "bip", data = dinosbip)



