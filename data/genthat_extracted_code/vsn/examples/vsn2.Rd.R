library(vsn)


### Name: vsn2
### Title: Fit the vsn model
### Aliases: vsn2 vsn2-methods vsn2,matrix-method vsn2,numeric-method
###   vsn2,ExpressionSet-method vsn2,AffyBatch-method vsn2,RGList-method
###   vsn2,NChannelSet-method coerce,RGList,NChannelSet-method vsnMatrix

### ** Examples

data("kidney")

fit = vsn2(kidney)                   ## fit
nkid = predict(fit, newdata=kidney)  ## apply fit

plot(exprs(nkid), pch=".")
abline(a=0, b=1, col="red")



