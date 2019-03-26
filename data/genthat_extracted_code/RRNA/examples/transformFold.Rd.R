library(RRNA)


### Name: transformFold
### Title: Internal function to translate and rotate a secondary structure
###   plot
### Aliases: transformFold
### Keywords: RNA transform

### ** Examples


ct=makeCt("((((...(((((((.........)))))))...((((.........))))...))))",
          "AAAAAAAACCCCCCCCAAAGGGGGGGAUUACCCCUCCUUUAAAAGGGUUUUCCCCCCC")

c1=ct2coord(ct)

RNAPlot(c1)

c2=transformFold(c1,0,0,pi/2)
c3=transformFold(c2,0,0,pi/2)
c4=transformFold(c3,0,0,pi/2)

RNAPlot(c2,add=TRUE)
RNAPlot(c3,add=TRUE)
RNAPlot(c4,add=TRUE)




