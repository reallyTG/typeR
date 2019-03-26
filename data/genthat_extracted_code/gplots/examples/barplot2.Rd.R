library(gplots)


### Name: barplot2
### Title: Enhanced Bar Plots
### Aliases: barplot2 barplot2.default
### Keywords: hplot

### ** Examples

tN <- table(Ni <- rpois(100, lambda = 5))
r <- barplot2(tN, col = 'gray')

#- type = "h" plotting *is* `bar'plot
lines(r, tN, type = 'h', col = 'red', lwd = 2)

barplot2(tN, space = 1.5, axisnames = FALSE,
        sub = "barplot2(..., space = 1.5, axisnames = FALSE)")

data(VADeaths, package = "datasets")
barplot2(VADeaths, plot = FALSE)
barplot2(VADeaths, plot = FALSE, beside = TRUE)

mp <- barplot2(VADeaths) # default
tot <- colMeans(VADeaths)
text(mp, tot + 3, format(tot), xpd = TRUE, col = "blue")
barplot2(VADeaths, beside = TRUE,
        col = c("lightblue", "mistyrose", "lightcyan",
                "lavender", "cornsilk"),
        legend = rownames(VADeaths), ylim = c(0, 100))
title(main = "Death Rates in Virginia", font.main = 4)

# Example with confidence intervals and grid
hh <- t(VADeaths)[, 5:1]
mybarcol <- "gray20"
ci.l <- hh * 0.85
ci.u <- hh * 1.15
mp <- barplot2(hh, beside = TRUE,
        col = c("lightblue", "mistyrose",
                "lightcyan", "lavender"),
        legend = colnames(VADeaths), ylim = c(0, 100),
        main = "Death Rates in Virginia", font.main = 4,
        sub = "Faked 95 percent error bars", col.sub = mybarcol,
        cex.names = 1.5, plot.ci = TRUE, ci.l = ci.l, ci.u = ci.u,
        plot.grid = TRUE)
mtext(side = 1, at = colMeans(mp), line = -2,
      text = paste("Mean", formatC(colMeans(hh))), col = "red")
box()

# Example with horizontal bars, grid and logarithmic x axis
barplot2(1:10 , log = "x", plot.grid = TRUE, grid.inc = 10,
        xlim = c(0.5, 20), horiz = TRUE, cex.axis = 0.9,
        prcol = "gray95")
box()

# Bar shading example
barplot2(VADeaths, angle = 15 + 10 * 1:5, density = 20, col = "black",
        legend = rownames(VADeaths))
title(main = list("Death Rates in Virginia", font = 4))

# border :
barplot2(VADeaths, border = "dark blue") 



