library(R2HTML)


### Name: HTML.function
### Title: Writes the code of a function to a target HTML file
### Aliases: HTML.function
### Keywords: print IO file

### ** Examples


## Define a function and export it's code to the file /test.html.
## Target file may be changed when submitting this code...

myfile <- paste(tempfile(),".html",sep="")
myfun <- function(x){
	cat("\n Euclidian norm")
	return(sqrt(sum(x^2)))
 }
HTML(myfun,file=myfile)
cat("\n Test output written in: ",myfile)




