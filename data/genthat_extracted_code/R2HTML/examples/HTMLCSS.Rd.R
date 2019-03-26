library(R2HTML)


### Name: HTMLCSS
### Title: Insert HTML code to refer to an external CSS file
### Aliases: HTMLCSS
### Keywords: print IO file

### ** Examples

myfile <- file.path(tempdir(),"tmp.html")
HTMLCSS(myfile,CSSfile="myownCSS.CSS")



