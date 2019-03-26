library(staplr)


### Name: staple_pdf
### Title: Merge multiple PDF files into one
### Aliases: staple_pdf

### ** Examples

## Not run: 
##D staple_pdf()
## End(Not run)

## Not run: 
##D dir <- tempdir()
##D require(lattice)
##D for(i in 1:3) {
##D pdf(file.path(dir, paste("plot", i, ".pdf", sep = "")))
##D print(xyplot(iris[,1] ~ iris[,i], data = iris))
##D dev.off()
##D }
##D output_file <- file.path(dir, paste('Full_pdf.pdf',  sep = ""))
##D staple_pdf(input_directory = dir, output_file)
## End(Not run)



