library(fmsb)


### Name: Siler
### Title: Siler's model mortality for qx and its fitting
### Aliases: Siler fitSiler

### ** Examples

 res <- fitSiler(,Jlife$qx2005M)
 FLAG <- res[7]
 while (FLAG>0) {
   res <- fitSiler(res[1:5], Jlife$qx2005M)
   FLAG <- res[7]
 }
 print(res)



