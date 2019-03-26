library(reader)


### Name: rmv.ext
### Title: Remove the file extension from a file-name.
### Aliases: rmv.ext

### ** Examples

rmv.ext(print.known=TRUE)
rmv.ext("/documents/nick/mydoc.xlsx")
rmv.ext(c("temp.cnv","temp.txt","temp.epi"))
# remove anything that looks like an extension
rmv.ext(c("temp.cnv","temp.txt","temp.epi"),only.known=FALSE) 
# add to list of known extensions
rmv.ext(c("temp.cnv","temp.txt","temp.epi"),more.known="epi") 



