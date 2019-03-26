library(BCE)


### Name: bceInput
### Title: ratiomatrix and datamatrix for demonstration of BCE().
### Aliases: bceInput
### Keywords: datasets

### ** Examples

##====================================
## Graphical representation of the example input data
palette(rainbow(12, s = 0.6, v = 0.75))

mp     <- apply(bceInput$Rat,MARGIN=2,max)
mp2    <- apply(bceInput$Dat,MARGIN=2,max)
pstars <- rbind(t(t(bceInput$Rat)/mp),t(t(bceInput$Dat)/mp2))

stars(pstars, len = 0.9, key.loc = c(7.2, -2),scale=FALSE,
      ncol=5,ylim=c(0,3),main = "bce Input: species + field samples", 
      draw.segments = TRUE, flip.labels=FALSE)



