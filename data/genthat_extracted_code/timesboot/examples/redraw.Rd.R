library(timesboot)


### Name: redraw
### Title: Auxiliary function that computes the spectrum
### Aliases: redraw
### Keywords: Periodogram

### ** Examples

function (series, ...) 
{
    args <- list(...)
    ws = spec.pgram(series, spans = args$p, plot = FALSE, detrend = args$detrend)
    return(ws$spec)
  }



