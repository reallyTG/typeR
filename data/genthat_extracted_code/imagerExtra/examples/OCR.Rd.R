library(imagerExtra)


### Name: OCR
### Title: Optical Character Recognition with tesseract
### Aliases: OCR OCR_data

### ** Examples

hello <- DenoiseDCT(papers, 0.01) %>% ThresholdAdaptive(., 0.1, range = c(0,1))
if (requireNamespace("tesseract", quietly = TRUE))
{
  OCR(hello) %>% cat
  OCR_data(hello)
}



