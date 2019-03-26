library(optparse)


### Name: parse_args
### Title: Parse command line options.
### Aliases: parse_args parse_args2

### ** Examples

# example from vignette
option_list <- list( 
   make_option(c("-v", "--verbose"), action="store_true", default=TRUE,
       help="Print extra output [default]"),
   make_option(c("-q", "--quietly"), action="store_false", 
       dest="verbose", help="Print little output"),
   make_option(c("-c", "--count"), type="integer", default=5, 
       help="Number of random normals to generate [default %default]",
       metavar="number"),
   make_option("--generator", default="rnorm", 
       help = "Function to generate random deviates [default \"%default\"]"),
   make_option("--mean", default=0, 
       help="Mean if generator == \"rnorm\" [default %default]"),
   make_option("--sd", default=1, metavar="standard deviation",
       help="Standard deviation if generator == \"rnorm\" [default %default]")
   )
parse_args(OptionParser(option_list = option_list), args = c("--sd=3", "--quietly"))

# example from vignette using positional arguments
option_list2 <- list( 
   make_option(c("-n", "--add-numbers"), action="store_true", default=FALSE,
       help="Print line number at the beginning of each line [default]")
   )
parser <- OptionParser(usage = "%prog [options] file", option_list=option_list2)

parse_args(parser, args = c("--add-numbers", "example.txt"), positional_arguments = TRUE)

parse_args(parser, args = c("--add-numbers", "example.txt"), positional_arguments = TRUE,
         convert_hyphens_to_underscores = TRUE)

parse_args2(parser, args = c("--add-numbers", "example.txt"))




