library(rsvg)


### Name: rsvg
### Title: Render SVG into Bitmap
### Aliases: rsvg rsvg_pdf rsvg_png rsvg_ps rsvg_raw rsvg_svg rsvg_webp

### ** Examples

# create some svg
options(example.ask=FALSE)
tmp <- tempfile()
svglite::svglite(tmp, width = 10, height = 7)
ggplot2::qplot(mpg, wt, data = mtcars, colour = factor(cyl))
dev.off()

# render it into a bitmap array
bitmap <- rsvg(tmp, height = 1440)
dim(bitmap) # h*w*c

png::writePNG(bitmap, "bitmap.png", dpi = 144)
jpeg::writeJPEG(bitmap, "bitmap.jpg", quality = 1)
webp::write_webp(bitmap, "bitmap.webp", quality = 100)


# render straight to output format
rsvg_pdf(tmp, "out.pdf")
rsvg_png(tmp, "out.png")
rsvg_svg(tmp, "out.svg")
rsvg_ps(tmp, "out.ps")



