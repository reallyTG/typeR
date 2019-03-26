library(GENEAclassify)


### Name: updown
### Title: Extract data relating to the up/down component
### Aliases: updown
### Keywords: internal

### ** Examples

    d1 <- matrix(c(100, 101, -0.79, -0.86, -0.17, -0.14, 0.53, 0.46), 
        nrow = 2, ncol = 4)
    colnames(d1) <- c("timestamp", "x", "y", "z")
    updown(x = d1)



