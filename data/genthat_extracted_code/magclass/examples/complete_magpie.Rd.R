library(magclass)


### Name: complete_magpie
### Title: complete_magpie
### Aliases: complete_magpie

### ** Examples


 data(population_magpie)
 a <- complete_magpie(population_magpie)
 b <- add_dimension(a)
 c <- add_dimension(a,nm="dummy2")
 incomplete<-mbind(b[,,1],c)
 d<-complete_magpie(incomplete)




