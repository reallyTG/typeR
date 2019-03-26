library(RSEIS)


### Name: swig
### Title: Seismic Wiggle Analysis
### Aliases: swig
### Keywords: iplot

### ** Examples

data("GH")
###  This loads a structure


STDLAB <- c("DONE", "QUIT","zoom out", "zoom in", "Left",
"Right", "restore", "Pinfo","WINFO",
"XTR", "SPEC", "SGRAM" ,"WLET",
"FILT", "UNFILT", "SCALE", "Postscript")

sel <- GH$COMPS=="V" 
if(interactive() ) {  p <- swig(GH, sel=sel, STDLAB=STDLAB)
print(p)
}
if(interactive()) {
p <- swig(GH, sel=sel, WIN=c(4,14) , STDLAB=c("DONE", "LAME", "DAME")  )

print(p)
}

############    example with filter
data(KH)

thefilts <-
list(flo=
c(0.02, 0.02, 0.02, 0.02, 0.02,   0.02,
0.02, 0.02, 0.02,  0.02, 0.02,  0.02,
0.02,
1/2, 1/50,1/100, 1/100,
1/100,1/100,1/100,1,1,
0.2, 15, 5, 2,1,
100),
fhi=
c(1/10, 1/6, 1/5, 1/4, 1/3, 1/2,
0.2,  0.5, 1.0,  2.0, 3.0,  4.0,
7.0,
8, 1/2.0,1/5.0,1/10.0,
1/20, 1/30,1/40,10,5,
7.0, 100, 100, 100,10,
100),
type =
c("LP","LP", "LP", "LP", "LP", "LP",
"LP","LP", "LP", "LP", "LP", "LP",
"LP",
"BP", "BP","BP","BP","BP","BP",
"BP","BP","BP",
"HP", "HP","HP", "HP","HP",
"None"))



if(interactive()) {
swig(KH, filters=thefilts)
}else{
swig(KH, filters=thefilts, SHOWONLY=TRUE )
}








