library(RSEIS)


### Name: uwpfile2ypx
### Title: UW pickfile to pphase pick data.frame
### Aliases: uwpfile2ypx
### Keywords: misc

### ** Examples

data("GH")
WW = RSEIS::uwpfile2ypx(GH$pickfile)
vertord <-  getvertsorder(GH$pickfile, GH)
R1 = rangedatetime(WW)
R2 = rangedatetime(GH$info)
S1 = secdifL(R2$min, R1$min)



swig(GH, sel=vertord$sel, APIX=WW, WIN=c(S1-1, 15) , SHOWONLY=0)




