library(imagerExtra)

test_that("piecewise_equalization", 
{
    notim <- 1
    im <- boats
    gim <- grayscale(im)
    gim2 <- imrep(gim, 2) %>% imappend(., "z")
    N <- 3
    range_bad1 <- c(1,1,1)
    range_bad2 <- c(-1,1)
    range_bad3 <- c(NA, 255)
    range_badorder <- c(255, 0)
    expect_error(EqualizePiecewise(notim, N))
    expect_error(EqualizePiecewise(gim2, N))
    expect_error(EqualizePiecewise(im, N))
    expect_error(EqualizePiecewise(gim, N, range = range_bad1))
    expect_error(EqualizePiecewise(gim, N, range = range_bad2))
    expect_error(EqualizePiecewise(gim, N, range = range_bad3))
    expect_warning(EqualizePiecewise(gim, N, range = range_badorder))
    expect_equal(EqualizePiecewise(gim, N), EqualizePiecewise(gim, N, range = range_badorder))
})