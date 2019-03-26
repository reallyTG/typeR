library(staplr)


### Name: remove_pages
### Title: Remove selected pages from a file
### Aliases: remove_pages

### ** Examples

## Not run: 
##D # This command promts the user to select the file interactively.
##D # Remove page 2 and 3 from the selected file.
##D remove_pages(rmpages = c(3,6))
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
##D output_path <-  file.path(dir, paste("trimmed_pdf.pdf",  sep = ""))
##D remove_pages(rmpages = 1, input_path, output_path)
## End(Not run)



