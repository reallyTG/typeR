library(imager)


### Name: interact
### Title: Build simple interactive interfaces using imager
### Aliases: interact

### ** Examples

#Implement a basic image gallery:
#press "right" and "left" to view each image in a list
gallery <- function(iml)
{
    ind <- 1
    f <- function(state)
   {
        if (state$key=="arrowleft")
        {
            ind <<- max(ind-1,1)
        }
        if (state$key=="arrowright")
        {
            ind <<- min(ind+1,length(iml))
        }
        iml[[ind]]
    }
    interact(f)
}
##Not run (interactive only)
##map_il(1:10,~ isoblur(boats,.)) %>% gallery



