library(fmsb)


### Name: GompertzMakeham
### Title: Gompertz-Makeham's model mortality for u(x) and its fitting
### Aliases: GompertzMakeham fitGM

### ** Examples

 res <- fitGM(,Jlife$qx2005M)
 FLAG <- res[5]
 while (FLAG>0) {
   res <- fitGM(res[1:3], Jlife$qx2005M)
   FLAG <- res[5]
 }
 print(res)



