library(gtools)


### Name: lastAdd
### Title: Non-destructively construct a .Last function to be executed when
###   R exits.
### Aliases: lastAdd
### Keywords: programming

### ** Examples


## Print a couple of cute messages when R exits.
helloWorld <- function() cat("\nHello World!\n")
byeWorld <- function() cat("\nGoodbye World!\n")

.Last <- lastAdd(byeWorld)
.Last <- lastAdd(helloWorld)

## Don't show: 
.Last()
## End(Don't show)
## Not run: 
##D q("no")
##D 
##D ## Should yield:
##D ##
##D ##   Save workspace image? [y/n/c]: n
##D ##
##D ##   Hello World!
##D ##
##D ##   Goodbye World!
##D ##
##D ##   Process R finished at Tue Nov 22 10:28:55 2005
## End(Not run)

## Unix-flavour example: send Rplots.ps to printer on exit.
myLast <- function()
{
  cat("Now sending PostScript graphics to the printer:\n")
  system("lpr Rplots.ps")
  cat("bye bye...\n")
}
.Last <- lastAdd(myLast)
## Don't show: 
.Last()
## End(Don't show)
## Not run: 
##D quit("yes")
##D 
##D ## Should yield:
##D ##
##D ##  Now sending PostScript graphics to the printer:
##D ##  lpr: job 1341 queued
##D ##  bye bye...
##D ##
##D ##   Process R finished at Tue Nov 22 10:28:55 2005
## End(Not run)




