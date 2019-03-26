library(mgcViz)


### Name: qqplots
### Title: Quantile-Quantile Plots
### Aliases: qqplots qqnorm qqplot qqline

### ** Examples

library(mgcViz)
y <- rt(500, df = 5)

# Compare new and old version of qqnorm
stats::qqnorm(y)
qqnorm(y)

# Compare new and old version of qqplot
x <- rt(200, df = 5)
y <- rt(300, df = 5)
stats::qqplot(x, y)
qqplot(x, y)
# add a qqline()
ggplot2::last_plot() + qqline(y = rt(500, df = 4.8), col = "green") 

## "QQ-Chisquare" : --------------------------
y <- rchisq(500, df = 3)
## Q-Q plot for Chi^2 data against true theoretical distribution:
x <- qchisq(ppoints(500), df = 3)
stats::qqplot(qchisq(ppoints(500), df = 3), rchisq(500, df = 3),
      main = expression("Q-Q plot for" ~~ {chi^2}[nu == 3]))
qqplot(qchisq(ppoints(500), df = 3), rchisq(500, df = 3),
      main = expression("Q-Q plot for" ~~ {chi^2}[nu == 3])) + theme_bw()



