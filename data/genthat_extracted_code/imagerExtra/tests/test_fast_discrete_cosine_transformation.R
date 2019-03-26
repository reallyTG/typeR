library(imagerExtra)

test_that("fast discrete cosine transformation",
{
    notim <- 1
    im <- boats
    gim <- grayscale(im)
    mat_gim <- as.matrix(gim)
    gim2 <- imrep(gim, 2) %>% imappend(., "z")
    im_NA <- as.cimg(matrix(NA, 100, 100))
    mat_bad1 <- 1
    mat_bad2 <- NULL
    mat_bad3 <- matrix(NA,100,100)
    mat_bad4 <- matrix("A", 200,300)
    bad1 <- "A"
    bad2 <- -1
    bad3 <- c(1,1,1)
    bad4 <- NA
    bad5 <- NULL
    
    expect_error(DCT2D(notim))
    expect_error(DCT2D(im))
    expect_error(DCT2D(gim2))
    expect_error(DCT2D(im_NA))
    expect_error(DCT2D(mat_bad1))
    expect_error(DCT2D(mat_bad2))
    expect_error(DCT2D(mat_bad3))
    expect_error(DCT2D(mat_bad4))
    expect_equal(DCT2D(gim), DCT2D(mat_gim))
    expect_error(DCT2D(gim, returnmat = bad1))
    expect_error(DCT2D(gim, returnmat = bad2))
    expect_error(DCT2D(gim, returnmat = bad3))
    expect_error(DCT2D(gim, returnmat = bad4))
    expect_error(DCT2D(gim, returnmat = bad5))
    expect_equal(DCT2D(gim, returnmat = TRUE), as.matrix(DCT2D(gim)))    
})