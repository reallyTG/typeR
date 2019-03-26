library(staplr)


### Name: split_pdf
### Title: Splits single input PDF document into individual pages.
### Aliases: split_pdf

### ** Examples

## Not run: 
##D split_pdf()
## End(Not run)

## Not run: 
##D dir <- tempdir()
##D require(lattice)
##D for(i in 1:3) {
##D pdf(file.path(dir, paste("plot", i, ".pdf", sep = "")))
##D print(xyplot(iris[,1] ~ iris[,i], data = iris))
##D dev.off()
##D }
##D staple_pdf(input_directory = dir, output_filepath = file.path(dir, 'Full_pdf.pdf'))
##D split_pdf(input_filepath = file.path(dir, paste("Full_pdf.pdf",  sep = "")),output_directory = dir )
## End(Not run)



