library(plotfunctions)


### Name: convertFile
### Title: Replacing separators (for example, decimal and thousand
###   separators).
### Aliases: convertFile

### ** Examples

## Not run: 
##D # normally, the function call would look something like this:
##D convertFile("example1.csv", symbol1=",", symbol2=".", sep="\t", 
##D     newsymbol1=".", newsymbol2="")
##D # But as we are not sure that the file example1.csv is available,
##D # we need to do something a little more complicated to point to 
##D # the file "example1.csv" that comes with the package:
##D 
##D # finding one of the example files from the package:
##D file1 <- system.file("extdata", "example1.csv", package = "plotfunctions")
##D 
##D # example 1: 
##D system.time({
##D     convertFile(file1, symbol1=",", symbol2=".", 
##D     newsymbol1=".", newsymbol2="", outputfile="example1_new.csv")
##D })
##D # example 2: type 'yes' to overwrite the previous output file, 
##D # or specify a different filename in outputfile.
##D system.time({
##D     convertFile(file1, symbol1=",", symbol2=".", sep="\t", 
##D     newsymbol1=".", newsymbol2="", columns=1:2, outputfile="example1_new.csv")
##D })
##D # Example 1 takes less  time, as it does not use read.table, 
##D # but just reads the file as text lines. However, the column 
##D # version could be useful when symbols should be replaced only 
##D # in specific columns.
##D # Note that Example 2 writes the output with quotes, but this is 
##D # not a problem for read.table:
##D dat <- read.table("example1_new.csv", header=TRUE, sep="\t", 
##D     stringsAsFactors=FALSE)
## End(Not run)



