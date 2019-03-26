library(RcmdrMisc)


### Name: discretePlot
### Title: Plot Distribution of Discrete Numeric Variable
### Aliases: discretePlot
### Keywords: hplot

### ** Examples

if (require(datasets)){
  data(mtcars)
  mtcars$cyl <- factor(mtcars$cyl)
  with(mtcars, {
    discretePlot(carb)
    discretePlot(carb, scale="percent")
    discretePlot(carb, by=cyl)
  })
}



