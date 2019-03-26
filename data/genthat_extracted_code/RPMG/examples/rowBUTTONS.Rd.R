library(RPMG)


### Name: rowBUTTONS
### Title: Geometry for the Really Poor Man's GUI
### Aliases: rowBUTTONS
### Keywords: iplot

### ** Examples


#######  create a plot
plot(c(0,1), c(0,1))
#######  set the character vector of button labels
mybutts = c("DONE", "REFRESH", "rainbow", "topo", "terrain", "CONT",
"XSEC","PS" )
#########  set colors and plotting chars for buttons
colabs = rep(1, length=length(mybutts))
pchlabs = rep(0,length(mybutts))
#######  create and set geometry for buttons:
buttons = rowBUTTONS(mybutts, col=colabs, pch=pchlabs)




