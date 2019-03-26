library(desplot)


### Name: desplot
### Title: Plot the layout/data of a field experiment.
### Aliases: desplot

### ** Examples

if(require(agridat)){

# Show how to customize any feature.  Here: make the strips bigger.
data(besag.met)
dat <- besag.met
d1 <- desplot(yield ~ col*row|county, dat, main="besag.met",
              out1=rep, out2=block, out2.gpar=list(col="white"), strip.cex=2)
d1 <- update(d1, par.settings = list(layout.heights=list(strip=2)))
print(d1)

# Show experiment layout
data(yates.oats)
# agridat version 1.12 used x/y here instead of col/row
if(is.element("x",names(yates.oats)))
  yates.oats <- transform(yates.oats, col=x, row=y)
desplot(yield ~ col+row, yates.oats, out1=block, out2=gen)

desplot(block ~ col+row, yates.oats, col=nitro, text=gen, cex=1, out1=block,
        out2=gen, out2.gpar=list(col = "gray50", lwd = 1, lty = 1))

  
# Example from Ryder.
data(ryder.groundnut)
gnut <- ryder.groundnut
m1 <- lm(dry~block+gen, gnut)
gnut$res <- resid(m1)
# Note largest positive/negative residuals are adjacent
desplot(res ~ col + row, gnut, text=gen, cex=1,
        main="ryder.groundnut residuals from RCB model")
}



