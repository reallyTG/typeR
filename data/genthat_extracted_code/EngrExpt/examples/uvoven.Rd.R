library(EngrExpt)


### Name: uvoven
### Title: UV absorbance for lens cured in different ovens
### Aliases: uvoven
### Keywords: datasets

### ** Examples

str(uvoven)
summary(uvoven)
densityplot(~ uv, uvoven, groups = oven, auto.key = list(columns = 2),
            xlab = "UV absorbance")
qqmath(~ uv, uvoven, groups = oven,
       auto.key = list(space = "right", title = "Oven"),
       xlab = "Standard normal quantiles", type = c("p","g"),
       ylab = "UV absorbance",
       panel = function(...)
    {
       panel.qqmath(...)
       panel.qqmathline(..., alpha = 0.5)
    })



