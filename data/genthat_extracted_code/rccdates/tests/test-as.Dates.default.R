
ds <- c(1212121212, "20000101", "2014-10-15", 5806)
ds2 <- c(19121212, "20000101", "2014-10-15", 5806)


context("as.Dates.default")

suppressMessages({
  suppressWarnings({
      
    test_that("input unchanged",{
      expect_that(as.Dates.default(list("kjhg")), throws_error())
      expect_that(as.Dates.default("kjhg"), is_identical_to("kjhg"))
      expect_that(as.Dates.default(123), is_identical_to(123))
      expect_that(as.Dates.default(c(123, 234567845, "hej")), is_identical_to(c(123, 234567845, "hej")))  
      expect_that(as.Dates.default(ds), is_equivalent_to(ds))
    })
    
    test_that("simple input", {
      expect_that(as.Dates.default(19850504), shows_message())
      expect_that(as.Dates.default(19850504), is_equivalent_to(as.Dates("1985-05-04")))
      expect_that(as.Dates.default(ds2, yyww = TRUE), 
                  is_equivalent_to(as.Date(c("1912-12-12", "2000-01-01", "2014-10-15", "1958-02-08"))))
    })
    
    
    test_that("Mixed input", {
      expect_that(suppressWarnings(as.Dates.default(ds, threshold = .5)), is_equivalent_to(ds))
      expect_that(as.Dates.default(ds, threshold = .5, yyww = TRUE, force = TRUE), gives_warning())
    })
    
    test_that("name argument", {
      expect_that(as.Dates.default(ds, threshold = .5, name = "hejsan", yyww = TRUE, force = TRUE), gives_warning("hejsan"))
    })  
    
    
    test_that("force argument", {
      expect_that(as.Dates.default(ds, threshold = .5, force = TRUE, yyww = TRUE), is_equivalent_to(as.Date(c(NA, "2000-01-01", "2014-10-15", "1958-02-08"))))
      expect_that(as.Dates.default(ds, threshold = .5, force = TRUE, yyww = TRUE), gives_warning())
    })
  
  })
})