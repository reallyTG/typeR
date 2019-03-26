library(plotrix)


### Name: textbox
### Title: Add text box
### Aliases: textbox
### Keywords: aplot

### ** Examples

 plot.new()
 textbox(c(0,0.2), 1, c("many words","more words","why not?",
  "keep going",rep("and going",10)))
 textbox(c(0.3,0.5), 1, c("keep going",rep("and going",10)), cex=0.45,
  col="blue", border="red", fill="#00FFEE80", density=25, angle=60)
 textbox(c(0.6,0.8), 1, c("keep going",rep("and going",10)), justify='c', cex=0.6,
  leading=1, font=4, border="gold", lty=2, lwd=4, margin=0.025)
 textbox(c(0.6,0.8), 0.5, c("keep going",rep("and going",10)), justify='r', cex=0.7,
  col="purple", font=3, border="green", margin=-0.025)
 lines(c(0,1), c(1,1), col="red", lty=2)
 lines(c(0,1), c(0.5,0.5), col="red", lty=2)



