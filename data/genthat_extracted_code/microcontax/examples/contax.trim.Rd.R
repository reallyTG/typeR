library(microcontax)


### Name: contax.trim
### Title: The ConTax data set
### Aliases: contax.trim

### ** Examples

data(contax.trim)
dim(contax.trim)

# Write to FASTA-file
## Not run: 
##D writeFasta(contax.trim,out.file="ConTax_trim.fasta")
##D 
##D # Install microcontax.data with the BIG contax.full data set
##D if (!requireNamespace("microcontax.data", quietly = TRUE)) {
##D  install.packages("microcontax.data")
##D }
##D # Load data
##D data("contax.full", package="microcontax.data")
## End(Not run)




