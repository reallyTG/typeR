context("cutnumeric")

test_that("cutnumeric works", {
  set.seed(20150605)
  x <- rnorm(50)
  xclass <- cut(x, seq( min(x), max(x), length = 1000 ), include.lowest = TRUE )
  
  y <- unlist( lapply( xclass, function(b) {
    h <- strsplit( as.character(b), "," )[[1]]
    h <- as.numeric(gsub( "\\[", "", 
                          gsub("\\]", "", gsub("\\(", "", h ) ) ))
    mean( h )
  } ) )
  expect_equal( cutnumeric(x), y)
})