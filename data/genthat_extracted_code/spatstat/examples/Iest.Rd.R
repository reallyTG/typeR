library(spatstat)


### Name: Iest
### Title: Estimate the I-function
### Aliases: Iest
### Keywords: spatial nonparametric

### ** Examples

   data(amacrine)
   Ic <- Iest(amacrine)
   plot(Ic, main="Amacrine Cells data")
   # values are below I= 0, suggesting negative association
   # between 'on' and 'off' cells.



