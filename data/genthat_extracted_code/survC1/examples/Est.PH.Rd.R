library(survC1)


### Name: Est.PH
### Title: Derivation of a risk score by a Cox proportioal hazarzs model
### Aliases: Est.PH

### ** Examples

D=CompCase(pbc[1:200,c(2:4,10:14)]) 
D[,2]=as.numeric(D[,2]==2)

ft=Est.PH(D)




