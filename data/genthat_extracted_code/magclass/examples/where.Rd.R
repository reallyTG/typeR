library(magclass)


### Name: where
### Title: where
### Aliases: where

### ** Examples


data(population_magpie)
 test<-population_magpie
 dimnames(test)[[1]]<-c("AFG","DEU","FRA","EGY","IND","IDN","RUS","CHN","USA","YEM")
 where(test>500)




