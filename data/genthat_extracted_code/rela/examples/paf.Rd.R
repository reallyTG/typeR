library(rela)


### Name: paf
### Title: Principal Axis Factoring
### Aliases: paf
### Keywords: manip misc

### ** Examples


library(rela)

Belts <- Seatbelts[,1:7]
summary(Belts)

paf.belt <- paf(Belts)
summary(paf.belt)

Belts2 <- Belts[,-5]
Belts2 <- Belts2[,-5] 

paf.belt2 <- paf(Belts2)
summary(paf.belt2)



