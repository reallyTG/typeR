library(aod)


### Name: summary.glimML-class
### Title: Summary of Objects of Class "summary.glimML"
### Aliases: summary.glimML-class show,glimML-class summary,glimML-method
###   show,summary.glimML-method
### Keywords: classes

### ** Examples

  data(orob2)
  fm1 <- betabin(cbind(y, n - y) ~ seed, ~ 1, data = orob2)
  # show objects of class "glimML"
  fm1
  # summary for objects of class "glimML"
  res <- summary(fm1)
  res@Coef
  # show objects of class "summary.glimML"
  res
  


