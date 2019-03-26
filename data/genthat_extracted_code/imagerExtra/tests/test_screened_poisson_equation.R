library(imagerExtra)

test_that("screened_poisson_equation",
{
    notim <- 1
    im <- boats
    gim <- grayscale(im)
    gim2 <- imrep(gim, 2) %>% imappend(., "z")
    im_NA <- as.cimg(matrix(NA, 100, 100))
    N <- 3
    s_c <- 0.1
    s_bad1 <- -1
    s_bad2 <- 1000
    s_bad3 <- 60
    s_bad4 <- NULL
    s_bad5 <- NA
    s_bad6 <- "Hello, World"
    range_bad1 <- c(1,1,1)
    range_bad2 <- c(-1,1)
    range_bad3 <- c(NA, 255)
    range_badorder <- c(255, 0)
    
    expect_error(SPE(notim, s_c))
    expect_error(SPE(im, s_c))
    expect_error(SPE(gim2, s_c))
    expect_error(SPE(notim, s_c))
    expect_error(SPE(im_NA, s_c))
    expect_error(SPE(gim, s_bad1))
    expect_error(SPE(gim, s_bad4))
    expect_error(SPE(gim, s_bad5))
    expect_error(SPE(gim, s_bad6))
    expect_error(SPE(gim, s_c, s_bad1))
    expect_error(SPE(gim, s_c, s_bad2))
    expect_error(SPE(gim, s_c, s_bad3))
    expect_error(SPE(gim, s_c, s_bad4))
    expect_error(SPE(gim, s_c, s_bad5))
    expect_error(SPE(gim, s_c, s_bad6))
    expect_error(SPE(gim, s_c, range = range_bad1))
    expect_error(SPE(gim, s_c, range = range_bad2))
    expect_error(SPE(gim, s_c, range = range_bad3))
    expect_warning(SPE(gim, s_c, range = range_badorder))
    expect_equal(SPE(gim, s_c, range = range_badorder), SPE(gim, s_c))
})