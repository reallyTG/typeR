library(NCmisc)


### Name: file.split
### Title: Split a text file into multiple parts
### Aliases: file.split

### ** Examples

orig.dir <- getwd(); setwd(tempdir()); # move to temporary dir
file.name <- "myfile.txt"
writeLines(fakeLines(max.lines=1000),con=file.name)
new.files <- file.split(file.name,size=50)
unlink(new.files); unlink(file.name)
setwd(orig.dir) # reset working dir to original



