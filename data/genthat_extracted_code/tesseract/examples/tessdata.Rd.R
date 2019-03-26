library(tesseract)


### Name: tesseract_download
### Title: Tesseract Training Data
### Aliases: tesseract_download tessdata

### ** Examples

## No test: 
if(is.na(match("fra", tesseract_info()$available)))
  tesseract_download("fra")
french <- tesseract("fra")
text <- ocr("https://jeroen.github.io/images/french_text.png", engine = french)
cat(text)
## End(No test)



