context("Reverse forename surname")

test_that("rev forename surname works on bibtex-like entry", {
  expect_equal(rev_forename_surname_bibtex("John Daley and Brendan Coates and Ludwig van Beethoven"),
               "Daley, John and Coates, Brendan and Beethoven, Ludwig van")
  expect_equal(rev_forename_surname_bibtex("John Daley and Coates, Brendan and Ludwig van Beethoven"),
               "Daley, John and Coates, Brendan and Beethoven, Ludwig van")
  expect_equal(rev_forename_surname_bibtex("J. Daley and Coates, B and Ludwig van Beethoven"),
               "Daley, J. and Coates, B and Beethoven, Ludwig van")
  expect_equal(rev_forename_surname_bibtex("J Daley and B Coates and L van Beethoven"),
               "Daley, J and Coates, B and Beethoven, L van")
  expect_equal(rev_forename_surname_bibtex("Andrew McDonald and WA Mozart"),
               "McDonald, Andrew and Mozart, WA")
  expect_equal(rev_forename_surname_bibtex("Andrew McDonald and Li Wu"),
               "McDonald, Andrew and Wu, Li")
  expect_equal(rev_forename_surname_bibtex("John Daley and Coates, Brendan and Ludwig van Beethoven and Beethoven, Ludiwg van and WA Mozart"),
               "Daley, John and Coates, Brendan and Beethoven, Ludwig van and Beethoven, Ludiwg van and Mozart, WA")
  expect_equal(rev_forename_surname_bibtex("W A Mozart and Li Wu"),
               "Mozart, W A and Wu, Li")
})

test_that("rev forename works on multilength vectors", {
  expect_equal(rev_forename_surname_bibtex(c("John Daley and Coates, Brendan",
                                             "Ludwig van Beethoven and WA Mozart")),
               c("Daley, John and Coates, Brendan",
                 "Beethoven, Ludwig van and Mozart, WA"))
})

test_that("rev forename works with UTF8 characters", {
  lukasz <- readLines("lukasz.txt", encoding = "UTF-8", warn = FALSE)
  expect_equal(rev_forename_surname_bibtex(lukasz[1]),
               lukasz[2])
})
