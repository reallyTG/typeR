library(StratigrapheR)


### Name: neatPicked
### Title: Runs neatPick without user input
### Aliases: neatPicked

### ** Examples

fun <- function(x, y, xlim = c(-1,1),...)
{
  plot(x, y, xlim = xlim,...)

  return(paste(x, y, paste(xlim, collapse = "; "), sep = "; "))
}

args <- list(x = list(-0.5, 1) , y = c(0.8, 0.8), pch = c(2,4),
             xlim = list(c(-1,1), c(-20,20)))

temp <- tempfile()
dir.create(temp)

neatPicked(fun, 2, args = args, width = 5, height = 5, dir = temp)




