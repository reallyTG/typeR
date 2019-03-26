library(HextractoR)


### Name: HextractoR
### Title: HextractoR: Integrated Tool for Hairping Extraction of RNA
###   Sequences
### Aliases: HextractoR

### ** Examples

# Small example without filter files
library(HextractoR)
# First we get the path of the example FASTA file
fpath <- system.file("Example_tiny.fasta", package="HextractoR")
# To run HextractoR, simply call the main function
HextractoR(input_file = fpath)
## No test: 
# Other example with filter files and bigger input file
fpath1 <- system.file("Example_human.fasta", package="HextractoR")
fpath2 <- system.file("Example_pre-miRNA.fasta", package="HextractoR")
HextractoR(input_file = fpath1, filter_files = {fpath2})
# This function creates 2 files in the working directory and automatically
# names them.
## End(No test)




