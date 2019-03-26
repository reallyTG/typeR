library(imagerExtra)

test_that("simplest_color_balance",
{
    notim <- 1
    im <- boats
    gim <- grayscale(im)
    gim2 <- imrep(gim, 2) %>% imappend(., "z")
    N <- 3
    s_c <- 0.1
    s_bad1 <- -1
    s_bad2 <- 1000
    s_bad3_1 <- 60
    s_bad3_2 <- 70
    s_bad4 <- NULL
    s_bad5 <- NA
    s_bad6 <- "Hello, World"
    range_bad1 <- c(1,1,1)
    range_bad2 <- c(-1,1)
    range_bad3 <- c(NA, 255)
    range_badorder <- c(255, 0)
    expect_error(BalanceSimplest(notim, s_c, s_c))
    expect_error(BalanceSimplest(gim2, s_c, s_c))
    expect_error(BalanceSimplest(im, s_c, s_c))
    expect_error(BalanceSimplest(gim, s_c, s_c, range = range_bad1))
    expect_error(BalanceSimplest(gim, s_c, s_c, range = range_bad2))
    expect_error(BalanceSimplest(gim, s_c, s_c, range = range_bad3))
    expect_warning(BalanceSimplest(gim, s_c, s_c, range = range_badorder))
    expect_equal(BalanceSimplest(gim, s_c, s_c), BalanceSimplest(gim, s_c, s_c, range = range_badorder))
    expect_error(BalanceSimplest(gim, s_bad1, s_c))
    expect_error(BalanceSimplest(gim, s_c, s_bad2))
    expect_error(BalanceSimplest(gim, s_bad3_1, s_bad3_2))
    expect_error(BalanceSimplest(gim, s_c, s_bad4))
    expect_error(BalanceSimplest(notim, s_c, s_bad5))
    expect_error(BalanceSimplest(notim, s_bad6, s_c))
})