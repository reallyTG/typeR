library(R2HTML)


### Name: HTML.data.frame
### Title: Write a data.frame (or matrix) to a HTML output
### Aliases: HTML.data.frame HTML.matrix
### Keywords: datasets IO

### ** Examples

tmpfic=HTMLInitFile(tempdir(),CSSFile=system.file("samples", "R2HTML.css", package="R2HTML"))
data(iris)
HTML(as.title("Fisher Iris dataset"),file=tmpfic)
HTML(iris, file=tmpfic)
# File is generated, you can call the browser:
## Not run: browseURL(tmpfic)

# Export one line of iris using default decimal separator
HTML(iris[1,],file="")

# Seeing default decimal separator:
getOption("R2HTML.format.decimal.mark")

# Modifying it:
options("R2HTML.format.decimal.mark"=",")
HTML(iris[1,],file="")

# Bypassing value set in option:
HTML(iris[1,],file="",decimal.mark="*")

# Using a vector for formatting options
HTML(iris[1:2,1:2],nsmall=c(3,1),file="")



