library(RPMG)


### Name: OPTREPLOT
### Title: Replot Function for SELBUT
### Aliases: OPTREPLOT
### Keywords: misc

### ** Examples



STDLAB=c("DONE", "QUIT", "zoom.out", "zoom.in", "SELBUT", "FILT",
"UNFILT", "PSEL", "SGRAM", "WLET", "SPEC", "XTR" )
OPTREPLOT(STDLAB)


XMCOL =  setXMCOL()
YN = OPTREPLOT(XMCOL, cols =XMCOL, tcol=grey(.8)  ,
scol=  "transparent", bcol= "transparent",  mpct=0.05   )


YN = OPTREPLOT(XMCOL, cols =XMCOL, tcol=grey(.8)  ,
scol=  "transparent", bcol= "black",  mpct=0.05   )







