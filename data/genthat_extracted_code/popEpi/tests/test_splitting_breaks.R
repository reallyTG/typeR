context("breaks attributes resulting from splitting")


test_that("splitMulti produces intended breaks list", {
  skip_on_cran()
  x <- data.table(popEpi::sibr)
  x <- x[dg_date < ex_date & bi_date < dg_date]
  
  x <- Lexis(
    data = x, 
    entry = list(
      per = get.yrs(dg_date), fot = 0.0, 
      age = get.yrs(dg_date)-get.yrs(bi_date)
    ),
    exit = list(
      per = get.yrs(ex_date)
    ), entry.status = 0L, exit.status = 1L
  )
  forceLexisDT(x, breaks = get_breaks(x), allScales = timeScales(x))
  
  BL <- list(fot = 2:8, per = 1990:2000, age = seq(0,100, 10))
  xx <- splitMulti(x, breaks = BL, drop = TRUE)
  
  BL2 <- list(fot = 4:7, per = 1991:1999, age = seq(50,70, 10))
  xxx <- splitMulti(xx, breaks = BL, drop = TRUE)
  
  expect_equal(breaks(xx, "fot"), BL$fot)
  expect_equal(breaks(xx, "per"), BL$per)
  expect_equal(breaks(xx, "age"), BL$age)
  
  expect_equal(breaks(xxx, "fot"), BL$fot)
  expect_equal(breaks(xxx, "per"), BL$per)
  expect_equal(breaks(xxx, "age"), BL$age)
})



test_that("splitLexisDT produces intended breaks list", {
  skip_on_cran()
  x <- data.table(popEpi::sibr)[dg_date < ex_date, ]
  
  x <- Lexis(
    data = x, 
    entry = list(
      per = get.yrs(dg_date), fot = 0.0, 
      age = get.yrs(dg_date)-get.yrs(bi_date)
    ),
    exit = list(
      per = get.yrs(ex_date)
    ), entry.status = 0L, exit.status = 1L
  )
  forceLexisDT(x, breaks = get_breaks(x), allScales = timeScales(x))
  
  br <- 2:10
  xx <- splitLexisDT(x, breaks = br, timeScale = "fot", drop = TRUE)
  
  br2 <- 2:12
  xxx <- splitLexisDT(xx, breaks = br, timeScale = "fot", drop = TRUE)
  
  expect_equal(breaks(xx, "fot"), br)
  expect_equal(breaks(xxx, "fot"), unique(br, br2))
  
  
  br <- 0:8
  xx <- splitLexisDT(x, breaks = br, timeScale = "fot", drop = FALSE)
  
  br2 <- 2:10
  xxx <- splitLexisDT(xx, breaks = br2, timeScale = "fot", drop = FALSE)
  
  br3 <- seq(9, 12, 0.5)
  xxxx <- splitLexisDT(xxx, breaks = br3, timeScale = "fot", drop = FALSE)
  
  expect_equal(breaks(xx, "fot"), br)
  expect_equal(breaks(xxx, "fot"), unique(c(br, br2)))
  expect_equal(breaks(xxxx, "fot"), sort(unique(c(br, br3))))
})




