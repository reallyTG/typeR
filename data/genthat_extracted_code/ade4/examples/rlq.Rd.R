library(ade4)


### Name: rlq
### Title: RLQ analysis
### Aliases: rlq print.rlq plot.rlq summary.rlq randtest.rlq
### Keywords: multivariate spatial

### ** Examples

   data(aviurba)
   coa1 <- dudi.coa(aviurba$fau, scannf = FALSE, nf = 2)
   dudimil <- dudi.hillsmith(aviurba$mil, scannf = FALSE, nf = 2, row.w = coa1$lw)
   duditrait <- dudi.hillsmith(aviurba$traits, scannf = FALSE, nf = 2, row.w = coa1$cw)
   rlq1 <- rlq(dudimil, coa1, duditrait, scannf = FALSE, nf = 2)
   plot(rlq1)
   summary(rlq1)
   randtest(rlq1)
   fourthcorner.rlq(rlq1,type="Q.axes")
   fourthcorner.rlq(rlq1,type="R.axes")




