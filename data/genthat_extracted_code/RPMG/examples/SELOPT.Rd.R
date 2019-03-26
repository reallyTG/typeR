library(RPMG)


### Name: SELOPT
### Title: Select Options
### Aliases: SELOPT
### Keywords: misc

### ** Examples


## Not run: 
##D STDLAB=c("DONE", "QUIT", "zoom.out", "zoom.in", "SELOPT",
##D "FILT","UNFILT",
##D  "PSEL", "SGRAM", "WLET", "SPEC", "XTR" )
##D onoff = rep(0, length(STDLAB))
##D onoff[1:5] = 1
##D SELOPT(STDLAB, onoff=onoff)
##D 
##D ###   second option for selecting colors
##D ###dev.new(width=12, height=12)
##D 
##D scol = SELOPT(colors(),  onoff=-1, ncol=15, ocols =colors(), cex=.6 )
##D 
##D ###  old program
##D SHOWPAL(scol, NAME=TRUE)
##D 
##D ###  show the options chosen from top to bottom
##D OPTREPLOT(scol,  cols=scol,  scol="green", bcol="blue", slwd=15 )
##D 
##D 
## End(Not run)




