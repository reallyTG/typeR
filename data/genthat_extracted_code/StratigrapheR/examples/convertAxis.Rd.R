library(StratigrapheR)


### Name: convertAxis
### Title: Converts the axis following a given formula
### Aliases: convertAxis

### ** Examples

plot(1,1,type = "n", xlim = c(0,12), axes = FALSE ,xlab = "", ylab = "")

axis(3)

l <- seq_log(10^0,10^12,divide = TRUE)

convertAxis(1,y ~ log10(x),l[[1]],l[[2]])




