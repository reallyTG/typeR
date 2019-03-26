library(ThreeWay)


### Name: varimcoco
### Title: Varimax Rotation for Tucker3 and Tucker2
### Aliases: varimcoco
### Keywords: array multivariate algebra

### ** Examples

data(Bus)
# T3 solution
BusT3 <- T3funcrep(Bus, 7, 5, 37, 2, 2, 2, 0, 1e-6)
# Simplicity of A (with weight = 2.5), B (with weight = 2) and C (with weight = 1.5)
T3vmABC <- varimcoco(BusT3$A, BusT3$B, BusT3$C, BusT3$H, 2.5, 2, 1.5)
# Simplicity of only A (with weight = 2.5) and B (with weight = 2)
# rot3=0; the value of wc_rel (= 0) does not play an active role
T3vmAB <- varimcoco(BusT3$A, BusT3$B, BusT3$C, BusT3$H, 2.5, 2, 0, 1, 1, 0)
# simplicity repeatedly with different relative weights for A, B and C
T3vm <- list()
weight.a <- c(1, 3, 6)
weight.b <- c(0, 2, 5)
weight.c <- c(1, 4)
i <- 1
for (wa_rel in weight.a){
 for (wb_rel in weight.b){
  for (wc_rel in weight.c){
   T3vm[[i]] <- varimcoco(BusT3$A, BusT3$B, BusT3$C, 
    BusT3$H, wa_rel, wb_rel, wc_rel)
   i <- i+1
  }
 }
}



