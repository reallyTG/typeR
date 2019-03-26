library(geneplotter)


### Name: plotMA-methods
### Title: Generate an MA plot
### Aliases: plotMA plotMA-methods plotMA,data.frame-method
###   plotMA,ExonCountSet-method

### ** Examples

  plotMA(
    data.frame(
      `M` = exp(rexp(1000)),
      `A` = rnorm(1000) -> tmp,
      `isde` = abs(tmp)>2) 
  )



