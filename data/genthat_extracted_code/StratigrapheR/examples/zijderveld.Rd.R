library(StratigrapheR)


### Name: zijderveld
### Title: Draws a Zijderveld plot
### Aliases: zijderveld

### ** Examples

zd <- zeq_example

par(mfrow = c(1,2))

zijderveld(dec = zd$Dec, inc = zd$Inc, int = zd$Int,
           xh = "WE", unit = 10^-5)

zijderveld(dec = zd$Dec, inc = zd$Inc, int = zd$Int,
           style = "box1", scientific = FALSE, decimals = 5,
           labels = zd$Treat, nlabels = 2)




