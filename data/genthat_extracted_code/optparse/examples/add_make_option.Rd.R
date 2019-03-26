library(optparse)


### Name: make_option
### Title: Functions to enable our OptionParser to recognize specific
###   command line options.
### Aliases: make_option add_option

### ** Examples


   make_option("--longflag")
   make_option(c("-l", "--longflag"))
   make_option("--integer", type="integer", default=5)
   make_option("--integer", default=as.integer(5))  # same as previous

   # examples from package vignette
   make_option(c("-v", "--verbose"), action="store_true", default=TRUE,
       help="Print extra output [default]")
   make_option(c("-q", "--quietly"), action="store_false",
     dest="verbose", help="Print little output")
   make_option(c("-c", "--count"), type="integer", default=5, 
       help="Number of random normals to generate [default %default]",
       metavar="number")
   make_option("--generator", default="rnorm", 
       help = "Function to generate random deviates [default \"%default\"]")
   make_option("--mean", default=0, 
       help="Mean if generator == \"rnorm\" [default %default]")
   make_option("--sd", default=1, metavar="standard deviation",
       help="Standard deviation if generator == \"rnorm\" [default %default]")




