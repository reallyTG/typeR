library(fmsb)


### Name: Denny
### Title: Denny's model mortality for lx and its fitting
### Aliases: Denny fitDenny

### ** Examples

 res <- fitDenny(,qxtolx(Jlife$qx2005M))
 FLAG <- res[5]
 while (FLAG>0) {
   res <- fitDenny(res[1:3], qxtolx(Jlife$qx2005M))
   FLAG <- res[5]
 }
 print(res)



