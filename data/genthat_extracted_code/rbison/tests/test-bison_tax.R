context("bison_tax")

test_that("bison_tax returns the correct ...", {
  vcr::use_cassette("bison_tax", {
    out1 <- bison_tax(query="*bear")
    out3 <- bison_tax(query="black bear", exact=TRUE)
    out4 <- bison_tax(query="helianthus", method="scientificName")
    
    # values
    expect_gt(out1$numFound, 0)
    expect_null(out1$facets)
    expect_true("black bear" %in% out3$names$vernacularName)
    expect_null(out4$facets)
    
    # class
    expect_is(out1, "list")
    expect_is(out3, "list")
    expect_is(out3$names, "data.frame")
    expect_is(out4, "list")
  })
})
