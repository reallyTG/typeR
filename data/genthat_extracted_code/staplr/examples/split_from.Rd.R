library(staplr)


### Name: split_from
### Title: Splits single input PDF document into parts from given points
### Aliases: split_from

### ** Examples

## Not run: 
##D # Split the pdf from page 10
##D split_from(pg_num=10)
## End(Not run)

## Not run: 
##D dir <- tempdir()
##D require(lattice)
##D for(i in 1:4) {
##D pdf(file.path(dir, paste("plot", i, ".pdf", sep = "")))
##D print(xyplot(iris[,1] ~ iris[,i], data = iris))
##D dev.off()
##D }
##D staple_pdf(input_directory = dir, output_filepath = file.path(dir, 'Full_pdf.pdf'))
##D input_path <- file.path(dir, "Full_pdf.pdf")
##D split_from(pg_num=2, input_filepath = input_path ,output_directory = dir )
## End(Not run)



