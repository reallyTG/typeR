library(imagerExtra)

test_that("treat color image", 
{
    notim <- 1
    im <- boats
    gim <- grayscale(im)
    gim2 <- imrep(gim, 2) %>% imappend(., "z")
    im2 <- imrep(im, 2) %>% imappend(., "z")
    expect_error(Grayscale(notim))
    expect_error(Grayscale(gim))
    expect_error(Grayscale(im2))

    expect_error(GetHue(notim))   
    expect_error(GetHue(gim))
    expect_error(GetHue(im2))

    expect_error(RestoreHue(notim, im))   
    expect_error(RestoreHue(im, im))
    expect_error(RestoreHue(gim2, im))
    expect_error(RestoreHue(gim, notim))
    expect_error(RestoreHue(gim, im2))	
})