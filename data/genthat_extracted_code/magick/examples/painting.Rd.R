library(magick)


### Name: painting
### Title: Image Painting
### Aliases: painting image_fill image_annotate

### ** Examples

logo <- image_read("logo:")
logo <- image_background(logo, 'white')
image_fill(logo, "pink", point = "+450+400")
image_fill(logo, "pink", point = "+450+400", fuzz = 25)
# Add some text to an image
image_annotate(logo, "This is a test")
image_annotate(logo, "CONFIDENTIAL", size = 50, color = "red", boxcolor = "pink",
 degrees = 30, location = "+100+100")

# Setting fonts requires fontconfig support (and that you have the font)
image_annotate(logo, "The quick brown fox", font = "monospace", size = 50)



