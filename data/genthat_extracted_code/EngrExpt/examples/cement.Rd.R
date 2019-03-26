library(EngrExpt)


### Name: cement
### Title: Drying times of concrete
### Aliases: cement
### Keywords: datasets

### ** Examples

str(cement)
dotplot(reorder(type, time) ~ time, cement, type = c("p","a"),
        jitter.y = TRUE, ylab = "Mix type",
        xlab = "Time until concrete is dry enough to walk on (hours)")
qqmath(~ time, cement, groups = type, aspect = 'xy',
       xlab = "Standard normal quantiles",
       type = c("g","p"),
       panel=function(...)
   {
       panel.qqmathline(..., alpha = 0.5, lty = 2)
       panel.qqmath(...)
   },
       ylab = "Time until concrete is dry enough to walk on (hours)",
       auto.key = list(space = "right", title = "Type", lines = TRUE))
summary(fm1 <- aov(time ~ type, cement))
TukeyHSD(fm1)



