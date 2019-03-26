library(tkrplot)


### Name: TkRplot
### Title: Tk Rplot
### Aliases: tkrplot tkrreplot tkpersp
### Keywords: misc

### ** Examples

## Not run: 
##D ## These cannot be run by examples() but should be OK when pasted
##D ## into an interactive R session with the tcltk package loaded
##D 
##D tt <- tktoplevel()
##D bb<-1
##D img <-tkrplot(tt, function() plot(1:20,(1:20)^bb))
##D f<-function(...) {
##D     b <- as.numeric(tclvalue("bb"))
##D     if (b != bb) {
##D         bb <<- b
##D         tkrreplot(img)
##D     }
##D }
##D s <- tkscale(tt, command=f, from=0.05, to=2.00, variable="bb",
##D              showvalue=FALSE, resolution=0.05, orient="horiz")
##D tkpack(img,s)
## End(Not run)



