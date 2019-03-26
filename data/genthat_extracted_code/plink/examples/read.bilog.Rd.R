library(plink)


### Name: read.bilog
### Title: Import Parameters from IRT Software
### Aliases: read.bilog read.parscale read.multilog read.testfact read.icl
###   read.bmirt read.erm read.ltm
### Keywords: utilities

### ** Examples

# Illustration of how to formulate the contrast argument. Say that we 
# have 20 items where the first 15 are modeled using the 3PL and the 
# last five are modeled using the GPCM.  For the 3PL items, deviation 
# contrasts are commonly used for all of the parameters, whereas with 
# the GPCM items, polynomial contrasts are typically used for the slope 
# parameters and triangle contrasts are used for the category parameters. 
# The contrast argument could be specified as follows

contrast <- vector("list",9)
# Note: the list elements do not need to be named for read.multilog
names(contrast) <- c("dev.a","poly.a","tri.a","dev.c","poly.c","tri.c",
  "dev.d", "poly.d","tri.d") 
contrast$poly.a <- 16:20
contrast$tri.c <- 16:20

# The object could alternatively be formatted as follows
contrast <- vector("list",9)
names(contrast) <- c("dev.a","poly.a","tri.a","dev.c","poly.c","tri.c",
  "dev.d","poly.d","tri.d") 
contrast$dev.a <- 1:15
contrast$poly.a <- 16:20
contrast$dev.c <- 1:15
contrast$tri.c <- 16:20
contrast$dev.d <- 1:15



