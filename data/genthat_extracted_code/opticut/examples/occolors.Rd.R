library(opticut)


### Name: occolors
### Title: Color Palettes for the opticut Package
### Aliases: occolors col2gray
### Keywords: utilities

### ** Examples

## using palettes
plot(1:100, rep(2, 100), pch = 15,
    ylim = c(0, 21), axes = FALSE, ann = FALSE,
    col = occolors()(100)) # default 'bg'
text(50, 1, "theme = 'br'")
points(1:100, rep(5, 100), pch = 15,
    col=occolors("gr")(100))
text(50, 4, "theme = 'gr'")
points(1:100, rep(8, 100), pch = 15,
    col=occolors("bw")(100))
text(50, 7, "theme = 'bw'")
points(1:100, rep(11, 100), pch = 15,
    col=occolors(terrain.colors)(100))
text(50, 10, "theme = terrain.colors")
points(1:100, rep(14, 100), pch = 15,
    col=occolors(c("purple", "pink", "orange"))(100))
text(50, 13, "theme = c('purple', 'pink', 'orange')")
points(1:100, rep(17, 100), pch = 15,
    col=occolors(c("#a6611a", "#ffffbf", "#018571"))(100))
text(50, 16, "theme = c('#a6611a', '#ffffbf', '#018571')")
points(1:100, rep(20, 100), pch = 15,
    col=occolors(c("#7b3294", "#ffffbf", "#008837"))(100))
text(50, 19, "theme = c('#7b3294', '#ffffbf', '#008837')")

## grayscale conversions
n <- 25
col <- occolors("br")(n)
method <- c("BT.709", "BT.601",
    "desaturate", "average", "maximum", "minimum",
    "red", "green", "blue")
plot(0, type="n", ann=FALSE, axes=FALSE,
    xlim=c(0, n), ylim=c(3*length(method), 0))
for (j in 1:length(method)) {
    for (i in 1:n) {
        polygon(c(i-1, i, i, i-1), c(0, 0, 1, 1)+((j-1)*3),
            col=col[i], border=col[i])
        polygon(c(i-1, i, i, i-1), c(1, 1, 2, 2)+((j-1)*3),
            col=col2gray(col[i], method=method[j]),
            border=col2gray(col[i], method=method[j]))
        text(n/2, 1+((j-1)*3), method[j])
    }
}



