library(basicTrendline)


### Name: trendline
### Title: Add Trendline and Show Equation to Plot
### Aliases: trendline

### ** Examples

library(basicTrendline)
x <- c(1, 3, 6,  9,  13,   17)
y <- c(5, 8, 11, 13, 13.2, 13.5)

# [case 1] default
trendline(x, y, model="line2P", ePos.x = "topleft", summary=TRUE, eDigit=5)

# [case 2]  draw lines of confidenc interval only (set CI.fill = FALSE)
trendline(x, y, model="line3P", CI.fill = FALSE, CI.color = "black", CI.lty = 2, linecolor = "blue")

# [case 3]  draw trendliine only (set CI.color = NA)
trendline(x, y, model="log2P", ePos.x= "top", linecolor = "red", CI.color = NA)

# [case 4]  show regression equation only (set show.Rpvalue = FALSE)
trendline(x, y, model="exp2P", show.equation = TRUE, show.Rpvalue = FALSE)

# [case 5]  specify the name of parameters in equation
# see Arguments c('xname', 'yname', 'yhat', 'Rname', 'Pname').
trendline(x, y, model="exp3P", xname="T", yname=paste(delta^15,"N"),
          yhat=FALSE, Rname=1, Pname=0, ePos.x = "bottom")

# [case 6]  change the digits, font size, and color of equation.
trendline(x, y, model="power2P", eDigit = 3, eSize = 1.4, text.col = "blue")

# [case 7]  don't show equation (set ePos.x = NA)
trendline(x, y, model="power3P", ePos.x = NA)

# [case 8]  set graphical parameters by par {graphics}
### NOT RUN

par(mgp=c(1.5,0.4,0), mar=c(3,3,1,1), tck=-0.01, cex.axis=0.9)

trendline(x, y)

dev.off()

### END (NOT RUN)




