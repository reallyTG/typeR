library(Smisc)


### Name: stripExtension
### Title: Remove the extension of a vector of filenames
### Aliases: stripExtension
### Keywords: misc

### ** Examples

stripExtension(c("this old file.doc", "that young file.rtf",
                 "this.good.file.doc", "this_bad_file"))

stripExtension(c("this old file*doc", "that young file*rtf",
                 "this*good*file*doc", "this_bad_file"), split.char = "*")


# Named vectors are not required, but are included here to make the
# output easier to read.  This example demonstrates a number of
# pathological cases.
stripExtension(c(a = NA, b = ".doc", c = "this.pdf", d = "this.file.", e = ".",
                 f = "noExtension", g = "direc.name/filename.txt", h = ""))

# An example with 'real' files
files <- dir(file.path(path.package(package = "Smisc"), "data"), full.names = TRUE)
print(files)
stripExtension(files)
stripExtension(stripPath(files))



