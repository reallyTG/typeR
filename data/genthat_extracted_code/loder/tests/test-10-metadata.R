context("Retrieving metadata from PNG images")

test_that("we can retrieve image metadata from PNG files", {
    path <- system.file("extdata", "pngsuite", package="loder")
    image <- readPng(file.path(path, "basn6a08.png"))
    
    expect_is(image, "loder")
    expect_equal(dim(image), c(32L,32L,4L))
    expect_equal(attr(image,"range"), c(0L,255L))
    
    # The inspectPng function and associated print method
    metadata <- inspectPng(file.path(path, "basn6a08.png"))
    expect_is(metadata, "lodermeta")
    expect_identical(attr(metadata,"bitdepth"), 8L)
    expect_equal(attr(metadata,"filesize"), 184)
    expect_false(attr(metadata,"interlaced"))
    expect_output(print(metadata), "file size is 184 B")
    expect_identical(attr(inspectPng(file.path(path,"basn3p04.png")),"palette"), 15L)
    
    expect_equal(attr(readPng(file.path(path,"bgwn6a08.png")),"background"), "#FFFFFF")
    expect_equal(attr(readPng(file.path(path,"cdfn2c08.png")),"asp"), 4)
    
    image <- readPng(file.path(path, "cdun2c08.png"))
    expect_equal(attr(image,"dpi"), c(25.4,25.4))
    expect_equal(attr(image,"pixdim"), c(1,1))
    expect_equal(attr(image,"pixunits"), "mm")
    
    # Reading text chunks
    image <- readPng(file.path(path, "ct1n0g04.png"))
    expect_equal(attr(image,"text")["Title"], c(Title="PngSuite"))
    image <- readPng(file.path(path, "ctzn0g04.png"))
    expect_equal(attr(image,"text")["Title"], c(Title="PngSuite"))
    image <- readPng(file.path(path, "ctgn0g04.png"))
    expect_true(any(Encoding(attr(image,"text")) == "UTF-8"))
})
