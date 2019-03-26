library(R2HTML)


### Name: HTMLbr
### Title: Facility functions to write HTML code
### Aliases: HTMLbr HTMLhr HTMLli
### Keywords: print IO file

### ** Examples


## Insert a line to a HTML file
## Change the path/name of the file to redirect to your test file

myfile <- paste(tempfile(),".html",sep="")
HTMLhr(file=myfile)
cat("\n Test output written in: ",myfile)




