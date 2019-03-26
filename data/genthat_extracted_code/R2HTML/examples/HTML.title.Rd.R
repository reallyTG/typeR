library(R2HTML)


### Name: HTML.title
### Title: Writes a title in a target HTML output
### Aliases: HTML.title as.title
### Keywords: print IO file

### ** Examples

## Write a title in the file /test.html.
## Target file may be changed when submitting this code...

myfile <- paste(tempfile(),".html",sep="")

tit1 <- as.title("This is method 1")

HTML(tit1, file=myfile)

HTML.title("This is method 2",file=myfile, HR=3)
cat("\n Test output written in: ",myfile)





