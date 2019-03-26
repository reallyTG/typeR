library(fs)


### Name: path_sanitize
### Title: Sanitize a filename by removing directory paths and invalid
###   characters
### Aliases: path_sanitize

### ** Examples

# potentially unsafe string
str <- "~/.\u0001ssh/authorized_keys"
path_sanitize(str)

path_sanitize("..")



