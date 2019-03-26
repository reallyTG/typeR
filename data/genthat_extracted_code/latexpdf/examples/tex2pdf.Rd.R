library(latexpdf)


### Name: tex2pdf
### Title: Convert TEX to PDF
### Aliases: tex2pdf

### ** Examples

file <- file.path(tempdir(),'test.tex')
writeLines(as.ltable(head(Theoph)), file)
tex2pdf(file)



