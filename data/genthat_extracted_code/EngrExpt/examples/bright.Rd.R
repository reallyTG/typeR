library(EngrExpt)


### Name: bright
### Title: Brightness of de-inked newspaper
### Aliases: bright
### Keywords: datasets

### ** Examples

str(bright)
options(contrasts = c("contr.treatment", "contr.helmert"))
summary(fm1 <- lm(bright ~ (type + percent + time + hardness + speed)^2,
                  bright))
qqmath(coef(fm1)[-1], aspect = 1,
       panel = function(...)
   {
       panel.grid(h = -1, v = -1)
       panel.qqmath(...)
       panel.qqmathline(..., alpha = 0.5, lty = 2)
   },
       xlab = "Standard normal quantiles",
       ylab = "First- and second-order effects")
summary(fm2 <- lm(bright ~ (type + hardness)^2, bright))
dotplot(type ~ bright, bright, groups = hardness,
        type = c("p", "a"), jitter.y = TRUE,
        xlab = "Brightness of pulp (lines and point styles are levels of water hardness)",
        ylab = "Alkali type", aspect = 0.4,
        auto.key = list(lines = TRUE, columns = 2))



