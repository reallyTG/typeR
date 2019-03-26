library(R.utils)


### Name: capitalize
### Title: Capitalizes/decapitalizes each character string in a vector
### Aliases: capitalize.default capitalize decapitalize
###   decapitalize.default
### Keywords: programming

### ** Examples


words <- strsplit("Hello wOrld", " ")[[1]];
cat(paste(toupper(words), collapse=" "), "\n")      # "HELLO WORLD"
cat(paste(tolower(words), collapse=" "), "\n")      # "hello world"
cat(paste(capitalize(words), collapse=" "), "\n")   # "Hello WOrld"
cat(paste(decapitalize(words), collapse=" "), "\n") # "hello wOrld"

# Sanity checks
stopifnot(paste(toupper(words), collapse=" ") == "HELLO WORLD")
stopifnot(paste(tolower(words), collapse=" ") == "hello world")
stopifnot(paste(capitalize(words), collapse=" ") == "Hello WOrld")
stopifnot(paste(decapitalize(words), collapse=" ") == "hello wOrld")



