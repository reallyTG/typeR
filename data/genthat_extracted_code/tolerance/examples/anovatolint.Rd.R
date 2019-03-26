library(tolerance)


### Name: anovatol.int
### Title: Tolerance Intervals for ANOVA
### Aliases: anovatol.int
### Keywords: file

### ** Examples
 
## 90%/95% 2-sided tolerance intervals for a 2-way ANOVA 
## using the "warpbreaks" data.

attach(warpbreaks)

lm.out <- lm(breaks ~ wool + tension)
out <- anovatol.int(lm.out, data = warpbreaks, alpha = 0.10,
                    P = 0.95, side = 2, method = "HE")
out

plottol(out, x = warpbreaks)



