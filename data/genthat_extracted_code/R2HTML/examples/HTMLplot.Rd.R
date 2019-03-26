library(R2HTML)


### Name: HTMLplot
### Title: Insert a graphic into an HTML output
### Aliases: HTMLplot
### Keywords: print IO file

### ** Examples


## Plots a graphic and insert it into the file /test.html.
## Target file and also graph directory should be changed when submitting this code...

myfile <- paste(tempfile(),".html",sep="")
plot(sin, -pi, 2*pi,main="Sinus")
# HTMLplot(file=myfile,GraphDirectory="/",Caption="Look at this curve!")



