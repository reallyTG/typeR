library(sparkTable)


### Name: plot-methods
### Title: Plot objects of class 'sparkline', 'sparkbar', 'sparkhist' or
###   'sparkbox'
### Aliases: plot plot-methods plot,sparkbar-method plot,sparkbox-method
###   plot,sparkline-method plot,sparkhist-method

### ** Examples

  data(pop)
  x <- pop[pop[,2]=="Insgesamt",3]
  a <- newSparkLine(values=x, pointWidth=8)
  plot(a)



