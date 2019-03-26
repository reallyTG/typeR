library(StratigrapheR)


### Name: infobar
### Title: Draws rectangles with text in them
### Aliases: infobar

### ** Examples

labels <- c("High 5", "Low 5", "5")
ymin <- c(10,-10,2.5)
ymax <- c(20,0, 7.5)

plot(c(0,6),c(-20,20), type = "n")

infobar(xmin = 0, xmax = 1, ymin = ymin, ymax = ymax, labels,
        m = list(col = c("grey","grey", "red"),
                 border = "black", density = 10),
        t = list(cex = 1.5, col = "white"))




