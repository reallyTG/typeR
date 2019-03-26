context("Test new corpus")
test_that("No argument in constructor", {
  expect_error(tmCorpus(), "argument \"x\" is missing")
})

test_that("One argument constructor", {
  rd <- tmCorpus("doc_1")
  expect_equal(getDoc(rd, 1), "doc_1")
})

test_that("Simple vector constructor", {
  rd <- tmCorpus(c("doc_1", "doc_2"))
  expect_equal(getDoc(rd, 2), "doc_2")
})

test_that("Complex vector constructor", {
  rd <- tmCorpus(paste("doc_", 1:100, sep = ""))
  expect_equal(getDoc(rd, 14), "doc_14")
})

test_that("Getter index out of bands", {
  rd <- tmCorpus(c("doc_1", "doc_2"))
  expect_error(getDoc(rd, 3), "index \"i\" out of bands")
})

test_that("Meta data one article", {
  rd <- tmCorpus(c("doc_1"))
  expect_equal(getMeta(rd, "language"), "en")
})

test_that("Meta data two articles", {
  rd <- tmCorpus(c("doc_1", "doc_2"))
  expect_equal(getMeta(rd, "language"), "en")
})

test_that("Meta data many articles", {
  rd <- tmCorpus(paste("doc_", 1:100, sep = ""))
  expect_equal(getMeta(rd, "language", 15), "en")
})

test_that("Getter for meta data out of bands", {
  rd <- tmCorpus(c("doc_1", "doc_2"))
  expect_error(getMeta(rd, "language", 3), "index \"i\" out of bands")
})

test_that("Getter for meta data, no metadata with a given name", {
  rd <- tmCorpus(c("doc_1", "doc_2"))
  expect_error(getMeta(rd, "randomMeta", 2), "There is no metadata: \"randomMeta\"")
})

test_that("Class value for new corpus is appropriate", {
  rd <- tmCorpus("doc_1")
  expect_equal(class(rd), "tmCorpus")
})


context("Test parsed text")
test_that("No argument in constructor of parsed text", {
  expect_error(tmParsed(), "argument \"x\" is missing")
})

test_that("One argument constructor", {
  rd <- tmParsed(list(c("parsed", "doc_1")))
  expect_equal(getDoc(rd, 1), c("parsed", "doc_1"))
})

test_that("Simple list constructor of new parsed text", {
  rd <- tmParsed(list(c("parsed", "doc_1"), c("parsed", "doc_2")))
  expect_equal(getDoc(rd, 2), c("parsed", "doc_2"))
})

test_that("Complex vector constructor", {
  doc_list <- lapply(1:100, function(y) c("parsed", paste("doc_", y, sep = "")))
  rd <- tmParsed(doc_list)
  expect_equal(getDoc(rd, 14), c("parsed", "doc_14"))
})

test_that("Getter index out of bands new parsed ", {
  rd <- tmParsed(list(c("parsed", "doc_1"), c("parsed", "doc_2")))
  expect_error(getDoc(rd, 3), "index \"i\" out of bands")
})

test_that("Meta data one article parsed text", {
  rd <- tmParsed(list(c("parsed", "doc_1")))
  expect_equal(getMeta(rd, "language"), "en")
})

test_that("Meta data two articles", {
  rd <- tmParsed(list(c("parsed", "doc_1"), c("parsed", "doc_2")))
  expect_equal(getMeta(rd, "language"), "en")
})

test_that("Meta data many articles", {
  doc_list <- lapply(1:100, function(y) c("parsed", paste("doc_", y, sep = "")))
  rd <- tmParsed(doc_list)
  expect_equal(getMeta(rd, "language", 15), "en")
})

test_that("Getter for meta data out of bands", {
  rd <- tmParsed(list(c("parsed", "doc_1"), c("parsed", "doc_2")))
  expect_error(getMeta(rd, "language", 3), "index \"i\" out of bands")
})

test_that("Getter for meta data, no metadata with a given name for new parsed", {
  rd <- tmParsed(list(c("parsed", "doc_1"), c("parsed", "doc_2")))
  expect_error(getMeta(rd, "randomMeta", 2), "There is no metadata: \"randomMeta\"")
})

test_that("Getter for meta data, no metadata with a given name for new parsed", {
  rd <- tmParsed(list(c("parsed", "doc_1"), c("parsed", "doc_2")))
  expect_error(getMeta(rd, "randomMeta", 2), "There is no metadata: \"randomMeta\"")
})


context("Test tabelarised text")
test_that("No argument in constructor of tabularised", {
  expect_error(tmWordCountsTable(), "argument \"x\" is missing")
})

test_that("Tabelarise one doc", {
  df <- data.frame(word = c("be", "am"), count = c(1, 2))
  rd <- tmWordCountsTable(list(df))
  expect_equal(getDoc(rd, 1), df)
})

test_that("Tabelarised two doc", {
  df_1 <- data.frame(word = c("be", "am"), count = c(1, 2))
  df_2 <- data.frame(word = c("have", "has"), count = c(2, 1))
  rd <- tmWordCountsTable(list(df_1, df_2))
  expect_equal(getDoc(rd, 1), df_1)
  expect_equal(getDoc(rd, 2), df_2)
})

test_that("Tabelarised many doc", {
  df <- data.frame(word = c("be", "am"), count = c(1, 2))
  list_df <- lapply(1:100, function(x) df)
  rd <- tmWordCountsTable(list_df)
  expect_equal(getDoc(rd, 1), df)
  expect_equal(getDoc(rd, 50), df)
})

test_that("Tabelarised meta data for one doc exists", {
  df <- data.frame(word = c("be", "am"), count = c(1, 2))
  rd <- tmWordCountsTable(list(df))
  expect_equal(getMeta(rd, "language"), "en")
})

test_that("Tabelarised  meta data for two doc exists", {
  df_1 <- data.frame(word = c("be", "am"), count = c(1, 2))
  df_2 <- data.frame(word = c("have", "has"), count = c(2, 1))
  rd <- tmWordCountsTable(list(df_1, df_2))
  expect_equal(getMeta(rd, "language"), "en")
  expect_equal(getMeta(rd, "language", 2), "en")
})

test_that("Tabelarised  meta data for many doc exists", {
  df <- data.frame(word = c("be", "am"), count = c(1, 2))
  list_df <- lapply(1:100, function(x) df)
  rd <- tmWordCountsTable(list_df)
  expect_equal(getMeta(rd, "language"), "en")
  expect_equal(getMeta(rd, "language", 50), "en")
})

test_that("Getter for meta data out of bands", {
  df_1 <- data.frame(word = c("be", "am"), count = c(1, 2))
  df_2 <- data.frame(word = c("have", "has"), count = c(2, 1))
  rd <- tmWordCountsTable(list(df_1, df_2))
  expect_error(getMeta(rd, "language", 3), "index \"i\" out of bands")
})

test_that("Getter for meta data, no metadata with a given name for new parsed", {
  df_1 <- data.frame(word = c("be", "am"), count = c(1, 2))
  df_2 <- data.frame(word = c("have", "has"), count = c(2, 1))
  rd <- tmWordCountsTable(list(df_1, df_2))
  expect_error(getMeta(rd, "randomMeta", 2), "There is no metadata: \"randomMeta\"")
})

test_that("Document test for class", {
  df_1 <- data.frame(word = c("be", "am"), count = c(1, 2))
  rd <- tmWordCountsTable(list(df_1))
  expect_equal(class(rd), "tmWordCountsTable")
})


context("Document class")
test_that("Document class created with single text", {
  rd <- tmTextDocument("doc_1")
  expect_equal(getDoc(rd), "doc_1")
})

test_that("Document class no argument in constructor", {
  expect_error(tmTextDocument(), "argument \"x\" is missing")
})

test_that("Document test for class", {
  rd <- tmTextDocument("doc")
  expect_equal(class(rd), "tmTextDocument")
})

test_that("Meta data for document class", {
  rd <- tmTextDocument("doc_1")
  expect_equal(getMeta(rd, "language"), "en")
})

test_that("Getter for meta data, no metadata with a given name for TextDocument",
          {
            rd <- tmTextDocument("doc_1")
            expect_error(getMeta(rd, "randomMeta"), "There is no metadata: \"randomMeta\"")
          })


context("Default metadata constructor")
test_that("Default constructor of meta data", {
  meta <- tmMetaData()
  expect_equal(getMeta(meta, "language"), "en")
  expect_equal(getMeta(meta, "author"), character(0))
  expect_equal(getMeta(meta, "title"), "Document_1")
  expect_equal(getMeta(meta, "id"), 1)
  expect_equal(getMeta(meta, "date"), Sys.Date())

})

test_that("Default constructor of meta data", {
  meta <- tmMetaData(language = "pl")
  expect_equal(getMeta(meta, "language"), "pl")
})

test_that("tmMetaData id is proper in many documents", {
  rd <- tmCorpus(c("doc_1", "doc_2"))
  expect_equal(getMeta(rd, "id", 2), 2)
  expect_equal(getMeta(rd, "id", 1), 1)
})


context("setDocument")
test_that("Document setter for one document works", {
  rd <- tmCorpus(c("doc_1", "doc_2"))
  rd <- setDoc(rd, "new_doc", 1)
  expect_equal(rd, tmCorpus(c("new_doc", "doc_2")))
})

test_that("Setter index out of bands", {
  rd <- tmCorpus(c("doc_1", "doc_2"))
  expect_error(setDoc(rd, 3, "doc"), "index \"i\" out of bands")
})

test_that("Setter for tmTextDocument", {
  rd <- tmTextDocument("doc_1")
  rd <- setDoc(rd, "not a doc_1")
  expect_equal(rd, tmTextDocument("not a doc_1"))
})

context("setMeta")
test_that("Document setter for one document works", {
  rd <- tmCorpus(c("doc_1"))
  rd <- setMeta(rd, "language", "pl", 1)
  expect_equal(getMeta(rd, "language", 1), "pl")
})

test_that("Setter index out of bands", {
  rd <- tmCorpus(c("doc_1", "doc_2"))
  expect_error(setMeta(rd, "language", "pl", 3), "index \"i\" out of bands")
})

test_that("Setter for tmTextDocument", {
  rd <- tmTextDocument("doc_1")
  rd <- setMeta(rd, "language", "pl")
  expect_equal(getMeta(rd, "language"), "pl")
})

test_that("Setter index out of bands", {
  rd <- tmCorpus(c("doc_1", "doc_2"))
  expect_error(setMeta(rd, "randomMeta", "randomValue"), "There is no metadata: \"randomMeta\"")
})

test_that("setDoc for tmMetaData", {
  rd <- tmMetaData()
  rd <- setMeta(rd, "language", "pl")
  expect_equal(getMeta(rd, "language"), "pl")
})
