library(staplr)


### Name: rename_files
### Title: Rename multiple files
### Aliases: rename_files

### ** Examples

## Not run: 
##D #if the directory contains 3 PDF files
##D rename_files(new_names = paste("file",1:3))
## End(Not run)
## Don't show: 
dir <- tempdir()
require(lattice)
for(i in 1:3) {
pdf(file.path(dir, paste("plot", i, ".pdf", sep = "")))
print(xyplot(iris[,1] ~ iris[,i], data = iris))
dev.off()
}
n <- length(Sys.glob(file.path(dir,"*.pdf")))
rename_files(input_directory = dir, new_names = paste("file",1:n))
## End(Don't show)



