library(base64)


### Name: img
### Title: Encode a png file as a img data uri
### Aliases: img

### ** Examples

pngfile <- tempfile()
png(pngfile, width = 600, height = 400)
plot(1:100, rnorm(100), pch = 21, bg = "red", cex = 2 )
dev.off()
img(pngfile, Rd = TRUE)



