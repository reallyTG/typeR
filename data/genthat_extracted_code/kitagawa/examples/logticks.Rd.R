library(kitagawa)


### Name: logticks
### Title: Add proper logarithm ticks to a plot axis.
### Aliases: logticks log_ticks log2_ticks log10_ticks

### ** Examples

x <- 10^(0:8)
y <- 1:9
plot(log10(x),y,xaxt="n",xlab="x",xlim=c(0,9))
logticks()



