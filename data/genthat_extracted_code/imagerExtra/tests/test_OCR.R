library(imagerExtra)

test_that("OCR",
{
  if (requireNamespace("tesseract", quietly = TRUE))
  {
    notim <- 1
    im <- boats
    gim <- grayscale(im)
    gim2 <- imrep(gim, 2) %>% imappend(., "z")
    im_NA <- as.cimg(matrix(NA, 100, 100))
    im_char <- as.cimg(matrix("A", 100, 100))
    impix <- boats %>% as.pixset
    gimpix <- gim %>% as.pixset
    gim2pix <- gim2 %>% as.pixset
    impix_NA <- im_NA%>% as.pixset   

    expect_error(OCR(notim))
    expect_error(OCR(im))
    expect_error(OCR(gim2))
    expect_error(OCR(im_NA))
    expect_error(OCR(im_char))
    expect_error(OCR(impix))
    expect_error(OCR(gim2pix))
    expect_error(OCR(impix_NA))
    
    expect_error(OCR_data(notim))
    expect_error(OCR_data(im))
    expect_error(OCR_data(gim2))
    expect_error(OCR_data(im_NA))
    expect_error(OCR_data(im_char))
    expect_error(OCR_data(impix))
    expect_error(OCR_data(gim2pix))
    expect_error(OCR_data(impix_NA))
  }
})