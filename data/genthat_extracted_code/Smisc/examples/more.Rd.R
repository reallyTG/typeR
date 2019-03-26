library(Smisc)


### Name: more
### Title: Display the contents of a text file to the R console
### Aliases: more

### ** Examples

cat("Here's a file\n", "with a few lines\n",
    "to read.\n", sep = "", file = "tmpFile.txt")
more("tmpFile.txt")
unlink("tmpFile.txt")



