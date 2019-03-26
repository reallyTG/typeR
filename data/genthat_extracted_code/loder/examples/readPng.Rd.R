library(loder)


### Name: readPng
### Title: Read a PNG file
### Aliases: readPng print.loder

### ** Examples

path <- system.file("extdata", "pngsuite", package="loder")
image <- readPng(file.path(path, "basn6a08.png"))
print(image)
attributes(image)




