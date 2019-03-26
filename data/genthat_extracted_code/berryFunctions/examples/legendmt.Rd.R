library(berryFunctions)


### Name: legendmt
### Title: legend with multiline title
### Aliases: legendmt
### Keywords: aplot

### ** Examples

plot(1:10)
  legend("topleft", letters[1:4], col=1:4, pch=1, title="very long title to be split up")
legendmt("topleft", letters[1:4], col=1:4, pch=1, title="very long title\nnow splat up")

# Alternative:
plot(1:10)
legend("topleft", "very long title to be split up")
legend("topleft", letters[1:4], col=1:4, pch=1, inset=c(0,0.09) )




