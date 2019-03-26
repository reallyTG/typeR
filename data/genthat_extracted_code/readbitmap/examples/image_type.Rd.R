library(readbitmap)


### Name: image_type
### Title: Identify the type of an image using the magic value at the start
###   of the file
### Aliases: image_type

### ** Examples

jpegfile=system.file("img", "Rlogo.jpg", package="jpeg")
image_type(jpegfile)
jpeg_pretending_to_be_png=tempfile(fileext = '.png')
file.copy(jpegfile, jpeg_pretending_to_be_png)
image_type(jpeg_pretending_to_be_png)
unlink(jpeg_pretending_to_be_png)



