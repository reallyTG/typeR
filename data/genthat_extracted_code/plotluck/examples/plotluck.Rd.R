library(plotluck)


### Name: plotluck
### Title: "I'm feeling lucky" for ggplot
### Aliases: plotluck
### Keywords: aplot, dplot hplot,

### ** Examples

# Single-variable density
data(diamonds, package='ggplot2')
plotluck(diamonds, price~1)
invisible(readline(prompt="Press [enter] to continue"))

# Violin plot
data(iris)
plotluck(iris, Species~Petal.Length)
invisible(readline(prompt="Press [enter] to continue"))

# Scatter plot
data(mpg, package='ggplot2')
plotluck(mpg, cty~model)
invisible(readline(prompt="Press [enter] to continue"))

# Spine plot
data(Titanic)
plotluck(as.data.frame(Titanic), Survived~Class+Sex, weights=Freq)
invisible(readline(prompt="Press [enter] to continue"))

# Facetting
data(msleep, package='ggplot2')
plotluck(msleep, sleep_total~bodywt|vore)
invisible(readline(prompt="Press [enter] to continue"))

# Heat map
plotluck(diamonds, price~cut+color)

## No test: 
# Multi plots
# All 1D distributions
plotluck(iris, .~1)

# 2D dependencies with one fixed variable on vertical axis
plotluck(iris, Species~.)
## End(No test)
# See also tests/testthat/test_plotluck.R for more examples!




