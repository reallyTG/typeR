library(augmentedRCBD)


### Name: augmentedRCBD.bulk
### Title: Analysis of Augmented Randomised Complete Block Design for
###   Multiple Traits/Characters
### Aliases: augmentedRCBD.bulk

### ** Examples

# Example data
blk <- c(rep(1,7),rep(2,6),rep(3,7))
trt <- c(1, 2, 3, 4, 7, 11, 12, 1, 2, 3, 4, 5, 9, 1, 2, 3, 4, 8, 6, 10)

y1 <- c(92, 79, 87, 81, 96, 89, 82, 79, 81, 81, 91, 79, 78, 83, 77, 78, 78,
        70, 75, 74)
y2 <- c(258, 224, 238, 278, 347, 300, 289, 260, 220, 237, 227, 281, 311, 250,
        240, 268, 287, 226, 395, 450)
dataf <- data.frame(blk, trt, y1, y2)

bout <- augmentedRCBD.bulk(data = dataf, block = "blk",
                           treatment = "trt", traits = c("y1", "y2"),
                           checks = NULL, alpha = 0.05, describe = TRUE,
                           freqdist = TRUE, gva = TRUE,
                           check.col = c("brown", "darkcyan",
                                         "forestgreen", "purple"),
                           console = TRUE)

# Frequency distribution plots
lapply(bout$`Frequency distribution`, plot)

# GVA plots
bout$`GVA plots`




