context("test character processing functions")

test_that("trim with bad inputs fails", {
  expect_error(trim())
  expect_error(trim(data.frame(a = c("jack", "hayley"), b = c(1, 2))))
})

test_that("trim with empty inputs", {
  expect_equal(trim(character(0)), character(0))
  expect_equal(trim(""), "")
})

test_that("trim with acceptable inputs", {
  expect_equal(trim(NA_character_), NA_character_)
  # not necesarily desirable, but this states the expectation.
  expect_equal(trim(NA_integer_), NA_character_)
  expect_equal(trim("jack"), "jack")
  expect_equal(trim("jack "), "jack")
  expect_equal(trim(" jack "), "jack")
  expect_equal(trim(" jack"), "jack")
  expect_equal(trim("jack\t"), "jack")
  expect_equal(trim("\tjack\t"), "jack")
  expect_equal(trim("\tjack"), "jack")
  expect_equal(trim("ja ck"), "ja ck")
  expect_equal(trim("ja ck "), "ja ck")
  expect_equal(trim(" ja ck "), "ja ck")
  expect_equal(trim(" ja ck"), "ja ck")

  expect_equal(trim(c(" jack", "hayley ")), c("jack", "hayley"))

})

test_that("strip whitespace", {
  expect_error(strip(x = "jack", pattern = c(1, 2)))
  expect_error(strip(x = "jack", pattern = c("1", "2")))
  expect_error(strip(x = "jack", useBytes = "yes"))
  expect_error(strip(x = "jack", useBytes = c(TRUE, FALSE)))

  expect_equal(strip(NA_integer_), NA_character_)

  expect_equal(strip("jack"), "jack")
  expect_equal(strip("jack "), "jack")
  expect_equal(strip(" jack "), "jack")
  expect_equal(strip(" jack"), "jack")
  expect_equal(strip("ja ck"), "jack")
  expect_equal(strip("ja ck "), "jack")
  expect_equal(strip(" ja ck "), "jack")
  expect_equal(strip(" ja ck"), "jack")
  # two spaces
  expect_equal(strip(pattern = "  ", "jack  "),  "jack")
  expect_equal(strip(pattern = "  ", "  jack  "),  "jack")
  expect_equal(strip(pattern = "  ", "  jack"),  "jack")
  expect_equal(strip(pattern = "  ", "ja  ck"),  "jack")
  expect_equal(strip(pattern = "  ", "ja  ck  "),  "jack")
  expect_equal(strip(pattern = "  ", "  ja  ck  "),  "jack")
  expect_equal(strip(pattern = "  ", "  ja  ck"),  "jack")

  expect_equal(strip("jack\t", pattern = "\t"), "jack")
  expect_equal(strip("\tjack\t", pattern = "\t"), "jack")
  expect_equal(strip("\tjack", pattern = "\t"), "jack")
  expect_equal(strip("\tjac\tk", pattern = "\t"), "jack")

  expect_equal(strip(c(" jac k", "h ayley ")), c("jack", "hayley"))
})

test_that("strip characters so they can work in a formula", {
  expect_error(stripForFormula())
  # if we introduce a duplicate, we should stop
  expect_error(stripForFormula(c("jack", "jack")))
  expect_error(stripForFormula(c("jack", "ja~ck")))
  expect_error(stripForFormula(c("ja~ck", "jack")))

  expect_equal(stripForFormula(NA_integer_), NA_character_)

  expect_equal(stripForFormula("jack"), "jack")
  expect_equal(stripForFormula("jack "), "jack")
  expect_equal(stripForFormula(" jack "), "jack")
  expect_equal(stripForFormula(" jack"), "jack")
  expect_equal(stripForFormula("ja ck"), "jack")
  expect_equal(stripForFormula("ja ck "), "jack")
  expect_equal(stripForFormula(" ja ck "), "jack")
  expect_equal(stripForFormula(" ja ck"), "jack")
  # two spaces
  expect_equal(stripForFormula("jack  "),  "jack")
  expect_equal(stripForFormula("  jack  "),  "jack")
  expect_equal(stripForFormula("  jack"),  "jack")
  expect_equal(stripForFormula("ja  ck"),  "jack")
  expect_equal(stripForFormula("ja  ck  "),  "jack")
  expect_equal(stripForFormula("  ja  ck  "),  "jack")
  expect_equal(stripForFormula("  ja  ck"),  "jack")

  expect_equal(stripForFormula("jack\t"), "jack")
  expect_equal(stripForFormula("\tjack\t"), "jack")
  expect_equal(stripForFormula("\tjack"), "jack")
  expect_equal(stripForFormula("\tjac\tk"), "jack")

  expect_equal(stripForFormula("\t+j-a#^&!*#(%!^$&#%!c\\&!(#)^*&^!~\t|||||k"),
               "jack")

  expect_equal(stripForFormula(c(" jac k", "h ayley ")), c("jack", "hayley"))
})

test_that("string pair match extraction", {
  expect_error(strPairMatch())
  expect_error(strPairMatch(pattern = "(abc)def(ghi)"))
  expect_error(strPairMatch(text = "bougie"))
  expect_error(strPairMatch(pattern = c("(a)b(c)", "(d)e(f)"),
                            text = "abc"))
  expect_error(strPairMatch(pattern = c("(a)b(c)", "(d)e(f)"),
                            text = c("abc", "def")))

  expect_error(strPairMatch(pattern = "[", text = "abc")) # invalid regex
  # only one parenthesis
  expect_error(strPairMatch(pattern = "(a).*", text = "abc"))
  expect_error(strPairMatch(pattern = ".*(j)", text = "abc"))
  expect_equal(strPairMatch(pattern = "(a*)b(c*)", text = "abc"), c(a = "c"))
  expect_equal(strPairMatch(pattern = "([^mackarel]*)(spain)",
                            text = "togospain"),
               c(togo = "spain"))
  expect_equal(strPairMatch(pattern = "([^mackarel]*)(spain)",
                            text = c("togospain", "djiboutispain")),
               c(togo = "spain", djibouti = "spain"))
  expect_equal(strPairMatch(pattern = "(a*)b(c*)", text = c("abc", "aabcc")),
               c(a = "c", aa = "cc"))
})

test_that("string multimatch", {
  skip("todo")
})
