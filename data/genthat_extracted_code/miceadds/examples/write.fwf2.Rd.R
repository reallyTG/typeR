library(miceadds)


### Name: write.fwf2
### Title: Reading and Writing Files in Fixed Width Format
### Aliases: write.fwf2 read.fwf2

### ** Examples

## Not run: 
##D #############################################################################
##D # EXAMPLE 1: Write and read a file in fixed width format
##D #############################################################################
##D 
##D # set working directory
##D path <- "P:/ARb/temp"
##D setwd(path)
##D 
##D # define a data frame
##D set.seed(9876)
##D dat <- data.frame( "x"=seq( 1, 21, len=5), "y"=stats::runif( 5 ),
##D             "z"=stats::rnorm( 5 ) )
##D 
##D # save data frame in fixed width format
##D format.full <- c(6, 6, 8 )
##D format.round <- c( 0, 2, 3 )
##D write.fwf2( dat, format.full=format.full, format.round=format.round,
##D                 file="testdata" )
##D 
##D # read the data
##D dat1 <- miceadds::read.fwf2( file="testdata.dat", format.full=c(6,6,8),
##D                variables=c("x","y","z") )
##D # check differences between data frames
##D dat - dat1
##D 
##D #############################################################################
##D # EXAMPLE 2: Write datasets containing some string variables in fwf format
##D #############################################################################
##D 
##D n <- 5
##D dat <- data.frame( "x"=stats::runif(n, 0, 9 ), "y"=LETTERS[1:n] )
##D write.fwf2(dat, format.full=c(4,2), format.round=c(2,0),  file="testdata")
## End(Not run)



