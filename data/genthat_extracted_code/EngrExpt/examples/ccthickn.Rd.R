library(EngrExpt)


### Name: ccthickn
### Title: Clear coat thickness
### Aliases: ccthickn
### Keywords: datasets

### ** Examples

str(ccthickn)
densityplot(~ thickness, ccthickn, xlab = "Clear coat thickness (microns)")
qqmath(~ thickness, ccthickn, aspect = 1,
       ylab = "Clear coat thickness (microns)",
       xlab = "Standard normal quantiles",
       type = c("g","p"),
       panel=function(...)
   {
       panel.qqmathline(..., alpha = 0.5, lty = 2)
       panel.qqmath(...)
   })



