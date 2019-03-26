library(magick)


### Name: editing
### Title: Image Editing
### Aliases: editing image_read image_read_svg image_read_pdf image_write
###   image_convert image_data image_raster image_display image_browse
###   image_strip image_blank image_join image_attributes demo_image

### ** Examples

# Download image from the web
frink <- image_read("https://jeroen.github.io/images/frink.png")
worldcup_frink <- image_fill(frink, "orange", "+100+200", 20)
image_write(worldcup_frink, "output.png")

# extract raw bitmap array
bitmap <- frink[[1]]

# replace pixels with #FF69B4 ('hot pink') and convert back to image
bitmap[,50:100, 50:100] <- as.raw(c(0xff, 0x69, 0xb4, 0xff))
image_read(bitmap)

# Plot to graphics device via legacy raster format
raster <- as.raster(frink)
par(ask=FALSE)
plot(raster)

# Read bitmap arrays from from other image packages
curl::curl_download("https://jeroen.github.io/images/example.webp", "example.webp")
if(require(webp)) image_read(webp::read_webp("example.webp"))
if(require(rsvg))
tiger <- image_read_svg("http://jeroen.github.io/images/tiger.svg")
if(require(pdftools))
image_read_pdf(file.path(R.home('doc'), 'NEWS.pdf'), pages = 1, density = 100)
# create a solid canvas
image_blank(600, 400, "green")
image_blank(600, 400, pseudo_image = "radial-gradient:purple-yellow")



