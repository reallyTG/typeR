library(emmeans)


### Name: emmobj
### Title: Construct an 'emmGrid' object from scratch
### Aliases: emmobj

### ** Examples

# Given summary statistics for 4 cells in a 2 x 2 layout, obtain 
# marginal means and comparisons thereof. Assume heteroscedasticity
# and use the Satterthwaite method
levels <- list(trt = c("A", "B"), dose = c("high", "low"))
ybar <- c(57.6, 43.2, 88.9, 69.8)
s <-    c(12.1, 19.5, 22.8, 43.2)
n <-    c(44,   11,   37,   24)
se2 = s^2 / n
Satt.df <- function(x, dfargs)
    sum(x * dfargs$v)^2 / sum((x * dfargs$v)^2 / (dfargs$n - 1))
    
expt.rg <- emmobj(bhat = ybar, V = diag(se2),
    levels = levels, linfct = diag(c(1, 1, 1, 1)),
    df = Satt.df, dfargs = list(v = se2, n = n), estName = "mean")
plot(expt.rg)

( trt.emm <- emmeans(expt.rg, "trt") )
( dose.emm <- emmeans(expt.rg, "dose") )

rbind(pairs(trt.emm), pairs(dose.emm), adjust = "mvt")



