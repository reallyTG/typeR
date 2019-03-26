library(sciplot)


### Name: lineplot.CI
### Title: Line Plot with CI
### Aliases: lineplot.CI
### Keywords: hplot

### ** Examples

data(ToothGrowth)

# One way design
lineplot.CI(x.factor = dose, response = len, data = ToothGrowth) 

# Two-way design with options
lineplot.CI(dose, len, group = supp, data = ToothGrowth, cex = 2,
            xlab = "Dose", ylab = "Growth", cex.lab = 1.5, x.leg = 1,
            col = c("blue","red"), pch = c(16,16))



