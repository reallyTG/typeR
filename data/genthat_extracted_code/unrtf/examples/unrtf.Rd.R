library(unrtf)


### Name: unrtf
### Title: Convert rtf Documents
### Aliases: unrtf

### ** Examples

library(unrtf)
text <- unrtf("https://jeroen.github.io/files/sample.rtf", format = "text")
html <- unrtf("https://jeroen.github.io/files/sample.rtf", format = "html")
cat(text)



