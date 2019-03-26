library(gap)


### Name: read.ms.output
### Title: A utility function to read ms output
### Aliases: read.ms.output
### Keywords: utilities

### ** Examples

## Not run: 
##D 
##D # Assuming ms is on the path
##D 
##D system("ms 5 4 -s 5 > ms.out")
##D msout1 <- read.ms.output("ms.out")
##D 
##D system("ms 50 4 -s 5 > ms.out")
##D msout2 <- read.ms.output("ms.out",outfile="out",outfileonly=TRUE)
##D 
##D msout <- system("ms 5 4 -s 5 -L", intern=TRUE)
##D msout3 <- read.ms.output(msout,FALSE)
## End(Not run)



