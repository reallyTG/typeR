library(staplr)


### Name: rotate_pdf
### Title: Rotate entire pdf document
### Aliases: rotate_pdf

### ** Examples

## Not run: 
##D # This command promts the user to select the file interactively.
##D # Rotate the entire PDF document to 90 degrees clockwise
##D rotate_pdf(page_rotation = 90)
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
##D input_path <- file.path(dir, paste("Full_pdf.pdf",  sep = ""))
##D output_path <-  file.path(dir, paste("rotated_pdf.pdf",  sep = ""))
##D rotate_pdf( page_rotation = 90,  input_path, output_path)
## End(Not run)



