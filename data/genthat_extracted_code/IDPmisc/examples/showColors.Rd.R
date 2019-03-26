library(IDPmisc)


### Name: showColors
### Title: Displays vectors of colors
### Aliases: showColors
### Keywords: color hplot

### ** Examples

showColors(IDPcolorRamp(5))
showColors(IDPcolorRamp(200),border=FALSE)
showColors(IDPcolorRamp(200),border=FALSE,ntm=5)

showColors(IDPcolorRamp(4,
                        colInt = data.frame(
                            h = c(0.47, 0.28, 0.22, 0.2, 0.00),
                            s = c(0.3, 0.55, 0.75, 0.75, 0.75),
                            v = c(1, 1, 1, 1, 1)),
                        fr     = c(0.2,0.2,0.2))
           ,border=FALSE)

showColors(IDPcolorRamp(200,
                        t(col2hsv(c("darkviolet","blue",
                                    "green","yellow","red"))),
                        fr=rep(0.25,3)),border=FALSE)




