library(magick)


### Name: ocr
### Title: Image Text OCR
### Aliases: ocr image_ocr image_ocr_data

### ** Examples

if(require("tesseract")){
img <- image_read("http://jeroen.github.io/images/testocr.png")
image_ocr(img)
image_ocr_data(img)
}



