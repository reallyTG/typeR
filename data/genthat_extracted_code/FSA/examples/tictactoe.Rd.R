library(FSA)


### Name: tictactoe
### Title: Construct a base tic-tac-toe plot for presenting predator-prey
###   PSD values.
### Aliases: tictactoe
### Keywords: hplot

### ** Examples

## Create hypothetical data for plotting one point .. similar to what might come from psdCalc()
prey <- c(45.4,30.2,56.8)
pred <- c(24.5,10.2,36.7)
names(prey) <- names(pred) <- c("Estimate","95% LCI","95% UCI")
prey
pred

tictactoe()
if (require(plotrix)) {
  plotCI(prey[1],pred[1],li=prey[2],ui=prey[3],err="x",pch=16,add=TRUE)
  plotCI(prey[1],pred[1],li=pred[2],ui=pred[3],err="y",pch=16,add=TRUE) 
}

## Create hypothetical data for plotting three points .. similar to what might come from psdCalc()
prey <- rbind(c(45.4,30.2,56.8),
              c(68.2,56.7,79.4),
              c(17.1, 9.5,26.3))
pred <- rbind(c(24.5,10.2,36.7),
              c(14.2, 7.1,21.3),
              c(16.3, 8.2,24.4))
colnames(prey) <- colnames(pred) <- c("Estimate","95% LCI","95% UCI")
prey
pred

tictactoe()
if (require(plotrix)) {
  plotCI(prey[,1],pred[,1],li=prey[,2],ui=prey[,3],err="x",pch=16,add=TRUE)
  plotCI(prey[,1],pred[,1],li=pred[,2],ui=pred[,3],err="y",pch=16,add=TRUE)
}
lines(prey[,1],pred[,1])
text(prey[,1],pred[,1],labels=c(2010,2011,2012),adj=c(-0.5,-0.5))




