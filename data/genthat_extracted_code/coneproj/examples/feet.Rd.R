library(coneproj)


### Name: feet
### Title: Foot Measurements for Fourth Grade Children
### Aliases: feet
### Keywords: data sets

### ** Examples

    data(feet)
    l <- feet$length
    w <- feet$width
    s <- feet$sex
    plot(l, w, type = "n", xlab = "Foot Length (cm)", ylab = "Foot Width (cm)")
    points(l[s == "G"], w[s == "G"], pch = 24, col = 2)
    points(l[s == "B"], w[s == "B"], pch = 21, col = 4)
    legend("topleft", bty = "n", c("Girl", "Boy"), pch = c(24, 21), col = c(2, 4))
    title("Kidsfeet Width vs Length Scatterplot")



