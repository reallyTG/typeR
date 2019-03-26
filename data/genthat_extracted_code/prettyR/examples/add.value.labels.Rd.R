library(prettyR)


### Name: add.value.labels
### Title: Add value labels
### Aliases: add.value.labels
### Keywords: misc

### ** Examples

 fgh<-data.frame(sex=sample(1:2,20,TRUE),viviality=sample(1:3,20,TRUE))
 fgh$sex<-add.value.labels(fgh$sex,c("Female","Male"))
 fgh$viviality<-add.value.labels(fgh$viviality,c("Alive","Dead","Zombie"))



