library(vegan)


### Name: ordiArrowTextXY
### Title: Support Functions for Drawing Vectors
### Aliases: ordiArrowMul ordiArrowTextXY
### Keywords: utilities

### ** Examples

    ## Scale arrows by hand to fill 80% of the plot
    ## Biplot arrows by hand
    data(varespec, varechem)
    ord <- cca(varespec ~ Al + P + K, varechem)
    plot(ord, display = c("species","sites"))

    ## biplot scores
    bip <- scores(ord, choices = 1:2, display = "bp")

    ## scaling factor for arrows to fill 80% of plot
    (mul <- ordiArrowMul(bip, fill = 0.8))
    bip.scl <- bip * mul                    # Scale the biplot scores
    labs <- rownames(bip)                   # Arrow labels

    ## calculate coordinate of labels for arrows
    (bip.lab <- ordiArrowTextXY(bip.scl, rescale = FALSE, labels = labs))

    ## draw arrows and text labels
    arrows(0, 0, bip.scl[,1], bip.scl[,2], length = 0.1)
    text(bip.lab, labels = labs)

    ## Handling of ordination objects directly
    mul2 <- ordiArrowMul(ord, display = "bp", fill = 0.8)
    stopifnot(all.equal(mul, mul2))



