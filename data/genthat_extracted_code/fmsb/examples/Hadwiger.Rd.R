library(fmsb)


### Name: Hadwiger
### Title: Hadwiger's model fertility and its fitting
### Aliases: Hadwiger fitHad

### ** Examples

 res <- fitHad(,Jfert$ASFR2000)
 FLAG <- res[5]
 while (FLAG>0) {
   res <- fitHad(res[1:3], Jfert$ASFR2000)
   FLAG <- res[5]
 }
 print(res)



