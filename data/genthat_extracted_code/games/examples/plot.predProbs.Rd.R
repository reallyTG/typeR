library(games)


### Name: plot.predProbs
### Title: Plot predicted probabilities
### Aliases: plot.predProbs

### ** Examples

data("war1800")
f1 <- esc + war ~ s_wt_re1 + revis1 | 0 | regime1 | balanc + regime2
m1 <- egame12(f1, data = war1800, boot = 10)
pp1 <- predProbs(m1, x = "balanc", n = 5)
pp2 <- predProbs(m1, x = "regime1")

## if "ask" is FALSE and "which" isn't specified, all plots are printed
op <- par(mfrow = c(2, 2))
plot(pp1)
par(op)

## Not run: 
##D     plot(pp1, ask = TRUE)
##D 
##D     ## Make a plot selection (or 0 to exit):
##D     ##   1: plot: Pr(~esc)
##D     ##   2: plot: Pr(esc,~war)
##D     ##   3: plot: Pr(esc,war)
##D     ##   4: plot all terms
## End(Not run)

## To change line type for confidence bounds, use argument `lty.ci`
plot(pp1, which = 3, lty.ci = 3)

## All the standard plotting options work too
plot(pp1, which = 3, xlab = "Capabilities", ylab = "Probability", main = "Title")

## Discrete `x` variables are plotted via R's boxplot functionality
plot(pp2, which = 3)



