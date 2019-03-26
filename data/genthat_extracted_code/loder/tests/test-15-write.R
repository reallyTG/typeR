context("Writing image data and metadata to PNG format")

test_that("we can write data and metadata to PNG format", {
    path <- system.file("extdata", "pngsuite", package="loder")
    images <- lapply(c("basn6a08.png","bgwn6a08.png","cdfn2c08.png","cdun2c08.png","ct1n0g04.png","ctgn0g04.png"), function(file) readPng(file.path(path,file)))
    temp <- tempfile()
    
    image <- readPng(writePng(images[[1]],temp))
    expect_equal(image[16,16,], c(32L,255L,4L,123L))
    image <- readPng(writePng(images[[1]],temp,interlace=TRUE))
    expect_equal(image[16,16,], c(32L,255L,4L,123L))
    image <- readPng(writePng(images[[1]],temp,range=c(0,127)))
    expect_equal(image[16,16,], c(64L,255L,8L,247L))
    image <- readPng(writePng(images[[1]]==255L,temp))
    expect_equal(image[16,16,], c(0L,1L,0L,0L))
    image <- readPng(writePng(structure(images[[1]],range=NULL),temp))
    expect_equal(image[16,16,], c(32L,255L,4L,123L))
    
    image <- readPng(writePng(images[[2]],temp))
    expect_equal(attr(image,"background"), "#FFFFFF")
    
    image <- readPng(writePng(images[[3]],temp))
    expect_equal(attr(image,"asp"), 4)
    
    image <- readPng(writePng(images[[4]],temp))
    expect_equal(attr(image,"dpi"), c(25.4,25.4))
    
    image <- readPng(writePng(images[[5]],temp))
    expect_equal(attr(image,"text"), attr(images[[5]],"text"))
    image <- readPng(writePng(images[[6]],temp))
    expect_equal(sort(attr(image,"text")), sort(attr(images[[6]],"text")))
})

test_that("we can write images with various compression schemes", {
    path <- system.file("extdata", "pngsuite", package="loder")
    image <- readPng(file.path(path, "z00n2c08.png"))
    temp <- tempfile()
    
    meta0 <- inspectPng(writePng(image, temp, compression=0L))
    meta1 <- inspectPng(writePng(image, temp, compression=1L))
    meta4 <- inspectPng(writePng(image, temp, compression=4L))
    meta6 <- inspectPng(writePng(image, temp, compression=6L))
    
    expect_gte(attr(meta0,"filesize"), attr(meta1,"filesize"))
    expect_gte(attr(meta1,"filesize"), attr(meta4,"filesize"))
    expect_gte(attr(meta4,"filesize"), attr(meta6,"filesize"))
})
