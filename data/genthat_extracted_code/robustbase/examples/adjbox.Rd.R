library(robustbase)


### Name: adjbox
### Title: Plot an Adjusted Boxplot for Skew Distributions
### Aliases: adjbox adjbox.default adjbox.formula
### Keywords: hplot

### ** Examples

if(require("boot")) {
 ### Hubert and Vandervieren (2006), p. 10, Fig. 4.
 data(coal, package = "boot")
 coaldiff <- diff(coal$date)
 op <- par(mfrow = c(1,2))
 boxplot(coaldiff, main = "Original Boxplot")
 adjbox(coaldiff, main  = "Adjusted Boxplot")
 par(op)
}

### Hubert and Vandervieren (2006), p. 11, Fig. 6. -- enhanced
op <- par(mfrow = c(2,2), mar = c(1,3,3,1), oma = c(0,0,3,0))
with(condroz, {
 boxplot(Ca, main = "Original Boxplot")
 adjbox (Ca, main = "Adjusted Boxplot")
 boxplot(Ca, main = "Original Boxplot [log]", log = "y")
 adjbox (Ca, main = "Adjusted Boxplot [log]", log = "y")
})
mtext("'Ca' from data(condroz)",
      outer=TRUE, font = par("font.main"), cex = 2)
par(op)



