library(Smisc)


### Name: getExtension
### Title: Get the extension of a vector of filenames
### Aliases: getExtension
### Keywords: misc

### ** Examples

getExtension(c(a = "this old file.doc",
               b = "that young file.rtf",
               c = "this.good.file.doc",
               d = "this_bad_file",
               e = "thisfile.",
               f = NA,
               g = "that.this.pdf",
               h = ".", i = ""))

# An example with 'real' files
files <- dir(file.path(path.package(package = "Smisc"), "data"), full.names = TRUE)
print(files)
getExtension(files)



