library(cmrutils)


### Name: makefig
### Title: Helper Plotting Routine
### Aliases: makefig
### Keywords: utilities hplot

### ** Examples

  x <- rnorm(10)

  myplot <- function(x, legend, ...)
  {
    plot(x, ..., pch = 1)
    legend('bottomright', bg = 'white',
           legend = legend, pch = 1)
  }

  makefig(myplot, x = x, legend = 'Simulation')
  makefig(myplot, x = x, legend = 'Simulation', pointsize = 8)

## No test: 
  makefig(myplot, x = x, legend = 'Simulation',
          device = 'pdf', filename = 'embedding.pdf', family = 'CMSans')

  mapply(makefig, device = c('window', 'pdf', 'svg'),
         MoreArgs = list(plotfun = myplot, x = x, legend = 'Simulation',
           filename = 'test', family = 'CMSans'))
## End(No test)



