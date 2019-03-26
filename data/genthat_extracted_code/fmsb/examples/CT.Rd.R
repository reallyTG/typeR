library(fmsb)


### Name: CT
### Title: Coale and Trussell's model marital fertility and its fitting
### Aliases: CT fitCT

### ** Examples

 ASMFR <- c(0, 0, 0, Jfert$ASMFR2000[1:35]) # Jfert's ASMFR should be rearranged to 12:49
 res <- fitCT(,ASMFR)
 FLAG <- res[4]
 while (FLAG>0) {
   res <- fitCT(res[1:2], ASMFR)
   FLAG <- res[4]
 }
 print(res)



