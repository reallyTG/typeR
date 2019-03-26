library(MSG)


### Name: ChinaLifeEdu
### Title: Life Expectancy and the Number of People with Higher Education
###   in China (2005)
### Aliases: ChinaLifeEdu

### ** Examples

data(ChinaLifeEdu)
x = ChinaLifeEdu
plot(x, type = "n", xlim = range(x[, 1]), ylim = range(x[, 2]))
u = par("usr")
rect(u[1], u[3], u[2], u[4], col = "antiquewhite", border = "red")
library(KernSmooth)
est = bkde2D(x, apply(x, 2, dpik))
contour(est$x1, est$x2, est$fhat, nlevels = 15, col = "darkgreen", add = TRUE, 
    vfont = c("sans serif", "plain"))



