library(HSAUR2)


### Name: Lanza
### Title: Prevention of Gastointestinal Damages
### Aliases: Lanza
### Keywords: datasets

### ** Examples


  data("Lanza", package = "HSAUR2")
  layout(matrix(1:4, nrow = 2))
  pl <- tapply(1:nrow(Lanza), Lanza$study, function(indx)
      mosaicplot(table(Lanza[indx,"treatment"], 
                       Lanza[indx,"classification"]),
                 main = "", shade = TRUE))




