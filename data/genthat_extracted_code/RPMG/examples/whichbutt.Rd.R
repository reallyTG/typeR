library(RPMG)


### Name: whichbutt
### Title: Determines which button was selected in RPGM
### Aliases: whichbutt
### Keywords: iplot

### ** Examples


###################  initial plot
plot(c(0,1), c(0,1))
######  set buttons
mybutts = c("DONE", "REFRESH", "rainbow", "topo", "terrain", "CONT",
"XSEC","PS" )
colabs = rep(1, length=length(mybutts))
pchlabs = rep(0,length(mybutts))
######  set button geometry  
buttons = rowBUTTONS(mybutts, col=colabs, pch=pchlabs)
########  user clicks on plot.  When locator finishes, whichbutt
########  determines which buttons were selected and returns the vector
L = locator()

K = whichbutt(L, buttons)
print(K)





