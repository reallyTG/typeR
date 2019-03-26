library(GameTheory)


### Name: AlphaMin
### Title: AlphaMin Rule
### Aliases: AlphaMin

### ** Examples



CLAIMS<-c(10,20,30,40)
AGENTS<-c("Paul","John","George","Ringo")
AlphaMin(67,CLAIMS,AGENTS)->ALPHA
summary(ALPHA)

# Assignment according to the Alpha-min Rule rule for an Endowment of 67 

#        Claims Amin
# Paul       10 10.0
# John       20 14.5
# George     30 19.0
# Ringo      40 23.5




