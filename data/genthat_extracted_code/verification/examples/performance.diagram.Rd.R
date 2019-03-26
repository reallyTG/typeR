library(verification)


### Name: performance.diagram
### Title: Performance Diagram
### Aliases: performance.diagram
### Keywords: file

### ** Examples

performance.diagram(main = "Sample Plot")
RB1 <- matrix(c(95, 55, 42, 141), ncol = 2)
## at point
pts     <- table.stats(RB1)
boot.pts <- table.stats.boot(RB1, R = 100   )
## add confidence intervals
segments(x0=1-pts$FAR, y0=boot.pts["up","pod"],
    x1=1-pts$FAR, y1=boot.pts["dw", "pod"], col=2, lwd=2)

segments(x0=1-boot.pts["up","far"], y0=pts$POD,
    x1=1-boot.pts["dw","far"], y1=pts$POD, col=2, lwd=2)
points(1 - pts$FAR, pts$POD, col = 2, cex = 2)





