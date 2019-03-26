library(gtx)


### Name: contrasting.rainbow
### Title: Rainbow of colours permuted to maximise contrast.
### Aliases: contrasting.rainbow

### ** Examples

## contrasting colours suitable for Manhattan plot for 22 autosomes
plot(1:22, rep(1, 22), pch = 22, cex = 2, ann = FALSE, 
     yaxt = "n", bg = contrasting.rainbow(22))



