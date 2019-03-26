context("Parse corpus")
test_that("Parse single simple article", {
  rd <- tmCorpus("Not parsed doc_1")
  rd <- parse(rd)
  expect_equal(rd, tmParsed(list(c("Not", "parsed", "doc_1"))))
})

test_that("Parse two simple articles", {
  rd <- tmCorpus(c("Not parsed doc_1", "Not parsed doc_2"))
  rd <- parse(rd)
  test <- tmParsed(list(c("Not", "parsed", "doc_1"), c("Not", "parsed", "doc_2")))
  expect_equal(getDoc(rd, 1), getDoc(test, 1))
  expect_equal(getDoc(rd, 2), getDoc(test, 2))
  expect_equal(rd, test)
})

context("Table function")
test_that("Parsed one document tabelarises", {
  rd <- tmParsed(list(c("doc_1", "parsed")))
  rd <- make_tabled(rd)
  df <- data.frame(word = c("doc_1", "parsed"), count = c(1, 1))
  expect_equal(rd, tmWordCountsTable(list(df)))
})

# context("Change to lowercase small letters corpus")
# test_that("Chenge to small letters", {
#   rd <- tmCorpus("doc")
#   rd <- transform(rd, tolower)
#   expect_equal(rd, tmCorpus("doc"))
# })
#
# test_that("Chenge to small letters different input/outcome", {
#   rd <- tmCorpus("Doc")
#   rd <- transform(rd, tolower)
#   expect_equal(rd, tmCorpus("doc"))
# })
#
# test_that("Chenge to small letters different input/outcome", {
#   rd <- tmCorpus(c("Doc", "Doc two", "THREE"))
#   rd <- transform(rd, tolower)
#   expect_equal(rd, tmCorpus(c("doc", "doc two", "three")))
# })
#
# test_that("Chenge to small letters different input/outcome", {
#   rd <- tmCorpus(c("Doc", "Doc two", "THREE"))
#   rd <- transform(rd, toupper)
#   expect_equal(rd, tmCorpus(c("DOC", "DOC TWO", "THREE")))
# })

context("ngrams")
test_that("Create ngram document from Corpus", {
  rd <- tmCorpus(c("This is document"))
  rd <- ngram(rd, 2)
  expect_equal(rd, tmParsed(list(c("This is", "is document"))))
})
