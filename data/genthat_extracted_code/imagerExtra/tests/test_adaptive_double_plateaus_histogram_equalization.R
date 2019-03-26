library(imagerExtra)

test_that("adaptive_double_plateaus_histogram_equalization",
{
    notim <- 1
    im <- boats
    gim <- grayscale(im)
    gim2 <- imrep(gim, 2) %>% imappend(., "z")
    im_NA <- as.cimg(matrix(NA, 100, 100))
    gim_bad <- imfill(100,100)
    
    N_bad1 <- -1
    N_bad2 <- NULL
    N_bad3 <- NA
    N_bad4 <- "A"
    N_bad5 <- 1
    
    t_up <- 1000
    t_down <- 100
    t_bad1 <- NULL
    t_bad2 <- NA
    t_bad3 <- "T"
    t_bad4 <- c(1,1)
    
    range_bad1 <- c(1,1,1)
    range_bad2 <- c(-1,1)
    range_bad3 <- c(NA, 255)
    range_badorder <- c(255, 0)
    
    expect_error(EqualizeDP(notim, t_down, t_up))
    expect_error(EqualizeDP(gim2, t_down, t_up))
    expect_error(EqualizeDP(im, t_down, t_up))
    expect_error(EqualizeDP(gim_bad, t_down, t_up))
    expect_error(EqualizeDP(gim, t_down, t_up, range = range_bad1))
    expect_error(EqualizeDP(gim, t_down, t_up, range = range_bad2))
    expect_error(EqualizeDP(gim, t_down, t_up, range = range_bad3))
    expect_warning(EqualizeDP(gim, t_down, t_up, range = range_badorder))
    expect_equal(EqualizeDP(gim, t_down, t_up), EqualizeDP(gim, t_down, t_up, range = range_badorder))
    expect_error(EqualizeDP(gim, t_down, t_up, N_bad1))
    expect_error(EqualizeDP(gim, t_down, t_up, N_bad2))
    expect_error(EqualizeDP(gim, t_down, t_up, N_bad3))
    expect_error(EqualizeDP(gim, t_down, t_up, N_bad4))
    expect_error(EqualizeDP(gim, t_down, t_up, N_bad5))
    expect_error(EqualizeDP(gim, t_down, t_bad1))
    expect_error(EqualizeDP(gim, t_down, t_bad2))
    expect_error(EqualizeDP(gim, t_down, t_bad3))
    expect_error(EqualizeDP(gim, t_down, t_bad4))
    expect_error(EqualizeDP(gim, t_bad1, t_up))
    expect_error(EqualizeDP(gim, t_bad2, t_up))
    expect_error(EqualizeDP(gim, t_bad3, t_up))
    expect_error(EqualizeDP(gim, t_bad4, t_up))
    expect_warning(EqualizeDP(gim, t_up, t_down))
    expect_equal(EqualizeDP(gim, t_up, t_down), EqualizeDP(gim, t_down, t_up))
    
    n_bad <- 0
    n_bad1 <- -1
    n_bad2 <- NULL
    n_bad3 <- NA
    n_bad4 <- "A"
    n_bad5 <- 2
    
    return_bad1 <- "A"
    return_bad2 <- -1
    return_bad3 <- c(0.1,0.1,0.1)
    return_bad4 <- NA
    return_bad5 <- NULL
    
    param_boats <- EqualizeADP(gim, returnparam = TRUE)
    
    expect_error(EqualizeADP(notim))
    expect_error(EqualizeADP(gim2))
    expect_error(EqualizeADP(im))
    expect_error(EqualizeADP(gim_bad))
    expect_error(EqualizeADP(gim, n_bad))
    expect_error(EqualizeADP(gim, n_bad1))
    expect_error(EqualizeADP(gim, n_bad2))
    expect_error(EqualizeADP(gim, n_bad3))
    expect_error(EqualizeADP(gim, n_bad4))
    expect_error(EqualizeADP(gim, n_bad5))
    expect_error(EqualizeADP(gim, N = N_bad1))
    expect_error(EqualizeADP(gim, N = N_bad2))
    expect_error(EqualizeADP(gim, N = N_bad3))
    expect_error(EqualizeADP(gim, N = N_bad4))
    expect_error(EqualizeADP(gim, N = N_bad5))
    expect_error(EqualizeADP(gim, range = range_bad1))
    expect_error(EqualizeADP(gim, range = range_bad2))
    expect_error(EqualizeADP(gim, range = range_bad3))
    expect_warning(EqualizeADP(gim, range = range_badorder))
    expect_equal(EqualizeADP(gim), EqualizeADP(gim, range = range_badorder))
    expect_error(EqualizeADP(gim, return_bad1))
    expect_error(EqualizeADP(gim, return_bad2))
    expect_error(EqualizeADP(gim, return_bad3))
    expect_error(EqualizeADP(gim, return_bad4))
    expect_error(EqualizeADP(gim, return_bad5))
    expect_equal(EqualizeDP(gim, param_boats[1], param_boats[2]), EqualizeADP(gim))
})