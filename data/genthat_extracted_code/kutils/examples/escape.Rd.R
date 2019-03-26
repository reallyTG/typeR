library(kutils)


### Name: escape
### Title: Text that is to be included as content in documents is cleaned
###   (escaped) to prevent errors
### Aliases: escape

### ** Examples

x1 <- c("_asdf&_&$", "asd adf asd_", "^ % & $asdf_")
escape(x1)
x2 <- c("a>b", "a<b", "a < c", 'Paul "pj" Johnson')
escape(x2, type = "tex")
escape(x2, type = "html")
escape(x2, type = "filename")



