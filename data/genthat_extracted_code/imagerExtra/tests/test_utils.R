library(imagerExtra)

test_that("utils", 
{
    expect_error(ConvertPercentile(1))
    expect_error(ConvertPercentile(NULL))
    expect_equal(ConvertPercentile("1%"), 1)
    expect_equal(ConvertPercentile("50%"), 50)
    expect_error(ConvertPercentile("A%"))
    expect_error(ConvertPercentile("%"))

    notim <- 1
    im <- boats
    im2 <- imrep(im, 2) %>% imappend(., "z")
    gim <- grayscale(im)
    gim2 <- imrep(gim, 2) %>% imappend(., "z")
    N <- 3
    im_NA <- as.cimg(matrix(NA, 100, 100))
    im_char <- as.cimg(matrix("A", 100, 100))
  
    expect_error(CheckSanityim(notim))
    expect_error(CheckSanityim(gim2))
    expect_error(CheckSanityim(im))
    expect_error(CheckSanityim(im_NA))
    expect_error(CheckSanityim(im_char))
    expect_equal(CheckSanityim(gim), TRUE)

    expect_error(CheckSanityimcol(notim))
    expect_error(CheckSanityimcol(im2))
    expect_error(CheckSanityimcol(gim))
    expect_error(CheckSanityimcol(im_NA))
    expect_error(CheckSanityimcol(im_char))
    expect_equal(CheckSanityimcol(im), TRUE)

    range_bad1 <- c(1,1,1)
    range_bad2 <- c(-1,1)
    range_bad3 <- c(0, NA)
    range_bad4 <- c("A", 255)
    range_badorder <- c(255, 0)
    range_good <- c(0, 255)
    expect_error(CheckSanityrange(range_bad1))
    expect_error(CheckSanityrange(range_bad2))
    expect_error(CheckSanityrange(range_bad3))
    expect_error(CheckSanityrange(range_bad4))
    expect_equal(CheckSanityrange(range_badorder), TRUE)
    expect_warning(CheckSanityrange(range_badorder))
    expect_equal(CheckSanityrange(range_good), TRUE)

    numeric_bad1 <- c(1,2)
    numeric_bad2 <- NA
    numeric_bad3 <- NaN
    numeric_bad4 <- "A"
    numeric_bad5 <- -1
    numeric_good <- 1
    numeric_zero <- 0
    numeric_mi1 <- -1
    expect_error(CheckSanitypositivenumeric(numeric_bad1))
    expect_error(CheckSanitypositivenumeric(numeric_bad2))	
    expect_error(CheckSanitypositivenumeric(numeric_bad3))
    expect_error(CheckSanitypositivenumeric(numeric_bad4))
    expect_error(CheckSanitypositivenumeric(numeric_bad5))
    expect_error(CheckSanitypositivenumeric(numeric_zero))
    expect_equal(CheckSanitypositivenumeric(numeric_good), TRUE)

    expect_error(CheckSanitypositive0numeric(numeric_bad1))
    expect_error(CheckSanitypositive0numeric(numeric_bad2))	
    expect_error(CheckSanitypositive0numeric(numeric_bad3))
    expect_error(CheckSanitypositive0numeric(numeric_bad4))
    expect_error(CheckSanitypositive0numeric(numeric_bad5))
    expect_equal(CheckSanitypositive0numeric(numeric_zero), TRUE)
    expect_equal(CheckSanitypositive0numeric(numeric_good), TRUE)
    
    expect_error(CheckSanitynumeric(numeric_bad1))
    expect_error(CheckSanitynumeric(numeric_bad2))
    expect_error(CheckSanitynumeric(numeric_bad3))
    expect_error(CheckSanitynumeric(numeric_bad4))
    expect_equal(CheckSanitynumeric(numeric_zero), TRUE)
    expect_equal(CheckSanitynumeric(numeric_good), TRUE)
    expect_equal(CheckSanitynumeric(numeric_mi1), TRUE)

    logical_bad1 <- c(TRUE, FALSE)
    logical_bad2 <- NA
    logical_bad3 <- 1
    logical_good <- TRUE
    expect_error(CheckSanitylogical(logical_bad1))
    expect_error(CheckSanitylogical(logical_bad2))
    expect_error(CheckSanitylogical(logical_bad3))
    expect_equal(CheckSanitylogical(logical_good), TRUE)
    
    mat_bad1 <- 1
    mat_bad2 <- NULL
    mat_bad3 <- matrix(NA,100,100)
    mat_bad4 <- matrix("A", 200,300)
    mat_c <- matrix(1, 100, 100)
    expect_error(CheckSanityimormat(notim))
    expect_error(CheckSanityimormat(gim2))
    expect_error(CheckSanityimormat(im))
    expect_error(CheckSanityimormat(im_NA))
    expect_error(CheckSanityimormat(im_char))
    expect_equal(CheckSanityimormat(gim), TRUE)
    expect_error(CheckSanityimormat(mat_bad1))
    expect_error(CheckSanityimormat(mat_bad2))
    expect_error(CheckSanityimormat(mat_bad3))
    expect_error(CheckSanityimormat(mat_bad4))
    expect_equal(CheckSanityimormat(mat_c), TRUE)

    impix <- boats %>% as.pixset
    gimpix <- gim %>% as.pixset
    gim2pix <- gim2 %>% as.pixset
    impix_NA <- im_NA %>% as.pixset
    expect_error(CheckSanityimorpx(notim))
    expect_error(CheckSanityimorpx(gim2))
    expect_error(CheckSanityimorpx(im))
    expect_error(CheckSanityimorpx(im_NA))
    expect_error(CheckSanityimorpx(im_char))
    expect_equal(CheckSanityimorpx(gim), TRUE)
    expect_error(CheckSanityimorpx(gim2pix))
    expect_error(CheckSanityimorpx(impix))
    expect_error(CheckSanityimorpx(impix_NA))
    expect_equal(CheckSanityimorpx(gimpix), TRUE)   

    numericvec_good <- c(1,2)
    numericvec_bad1 <- NA
    numericvec_bad2 <- NaN
    numericvec_bad3 <- "A"
    expect_error(CheckSanitynumericvec(numericvec_bad1))
    expect_error(CheckSanitynumericvec(numericvec_bad2))
    expect_error(CheckSanitynumericvec(numericvec_bad3))
    expect_equal(CheckSanitynumericvec(numericvec_good), TRUE)

    char_good <- "GOOD"
    char_bad1 <- 1
    char_bad2 <- NULL
    char_bad3 <- NA
    char_bad4 <- character(0)
    expect_error(CheckSanitychar(char_bad1))
    expect_error(CheckSanitychar(char_bad2))	
    expect_error(CheckSanitychar(char_bad3))
    expect_error(CheckSanitychar(char_bad4))
    expect_equal(CheckSanitychar(char_good), TRUE) 
})