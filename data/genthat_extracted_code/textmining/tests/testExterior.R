context("Exterior packages corpus read")
test_that("Reading corpus from other files works", {
  dir.create("tmp")
  writeLines("This is written file", "tmp/tmp1.txt")
  writeLines("This is written file 2", "tmp/tmp2.txt")
  rd <- try(tmCorpus(x = "tmp", package = "stylo"))
  unlink("tmp", recursive = TRUE)
  expect_equal(rd, tmCorpus(c("This is written file",
                              "This is written file 2")))
})

test_that("Reading corpus from other files works", {
  dir.create("tmp")
  writeLines("This is written file", "tmp/tmp1.txt")
  writeLines("This is written file 2", "tmp/tmp2.txt")
  rd <- try(tmCorpus(x = tm::DirSource("tmp"), package = "tm"))
  unlink("tmp", recursive = TRUE)
  expect_equal(rd, tmCorpus(c("This is written file",
                              "This is written file 2")))
})

test_that("Reading corpus from tm VectorSource", {
  rd <- try(tmCorpus(x = tm::VectorSource(c("This is written file",
                                        "This is written file 2")),
                     package = "tm"))
  expect_equal(rd, tmCorpus(c("This is written file",
                              "This is written file 2")))
})

context("Read and parse document")
test_that("Read and parse using stylo", {
  dir.create("tmp")
  writeLines("this is written file", "tmp/tmp1.txt")
  rd <- try(tmParsed(x = "tmp", package = "stylo"))
  unlink("tmp", recursive = TRUE)
  expect_equal(rd, tmParsed(list(c("this", "is", "written", "file"))))
})

context("Train function attached to the corpus")
test_that("Class of the model is tmTopicModel", {
  x <- tmCorpus(rep("as, a , a ,s  l k l l k k j h g f f hg j aaa", 100))
  require(rJava)
  wd <- stopwords_temp()
  model <- suppressMessages(train(x))
  setwd(wd)
  expect_equal(class(model), "tmTopicModel")
})

context("Predict function attached to the corpus")
test_that("Predict class for topic model tmTopicModel", {
  x <- tmCorpus(rep("as, a , a ,s  l k l l k k j h g f f hg j aaa", 100))
  require(rJava)
  wd <- stopwords_temp()
  model <- suppressMessages(train(x))
  y <- tmCorpus(rep("as, aa a a a a ada s a a da d as a", 100))
  pred <- predict(model, y)
  setwd(wd)
  expect_equal(class(pred), "data.frame")
})

test_that("Topic table function", {
  x <- tmCorpus(rep("as, a , a ,s  l k l l k k j h g f f hg j aaa", 100))
  require(rJava)
  wd <- stopwords_temp()
  model <- suppressMessages(train(x))
  setwd(wd)
  n1 <- topic_table(model)
  expect_equal(names(n1), c("topics", "words"))
})

test_that("Gepi graphics", {
  x <- tmCorpus(rep("as, a , a ,s  l k l l k k j h g f f hg j aaa", 100))
  require(rJava)
  wd <- stopwords_temp()
  model <- suppressMessages(train(x))
  setwd(wd)
  table_topic <- topic_table(model)
  network <- topic_network(10, model)
  expect_equal(class(network), c("forceNetwork", "htmlwidget"))
})

test_that("Content returns the list content of a tmCorpus", {
  x <- tmCorpus(c("Nothing is here", "Just list content"))
  content_x <- content(x)
  expect_equal(content_x, list("Nothing is here", "Just list content"))
})

test_that("Content settr for the list content of a tmCorpus", {
  x <- tmCorpus(c("Nothing is here", "Just list content"))
  content(x) <- list("a", "b")
  expect_equal(content(x), list("a", "b"))
})

test_that("tm_map works for tmCorpus", {
  x <- tmCorpus(c("Nothing is here", "Just list content"))
  content(x) <- list("a", "b")
  x <- tm_map(x, tm::removeWords, tm::stopwords("english"))
  expect_equal(content(x), list("", "b"))
})

test_that("Create tmCorpus from vector with as.tmCorpus", {
  x <- c("sa", "As")
  x <- as.tmCorpus(x)
  expect_equal(x, tmCorpus(c("sa", "As")))
})

test_that("Create tmCorpus from VCorpus with as.tmCorpus", {
  x <- c("sa", "As")
  V_x <- tm::VCorpus(tm::VectorSource(x))
  x<- as.tmCorpus(V_x)
  expect_equal(x, tmCorpus(c("sa", "As")))
})

test_that("Create tmCorpus from stylo.corpus with as.tmCorpus", {
  dir.create("tmp")
  writeLines("This is written file", "tmp/tmp1.txt")
  writeLines("This is written file 2", "tmp/tmp2.txt")
  x <- stylo::load.corpus(corpus.dir = "tmp")
  unlink("tmp", recursive = TRUE)
  x <- as.tmCorpus(x)
  expect_equal(x, tmCorpus(c("This is written file", "This is written file 2")))
})

test_that("Content settr for the list content of a tmCorpus", {
  x <- tmCorpus(c("Nothing is here", "Just list content"))
  meta(x, "language")
  expect_equal(meta(x, "language"), list("en", "en"))
})

test_that("TermDocumentMatrix from tmCorpus", {
  x <- tmCorpus(c("doc1", "doc2"))
  y <- TermDocumentMatrix(x)
  expect_equal(class(TermDocumentMatrix(x))[1], "TermDocumentMatrix")
})

test_that("Set meta data for tmCorpus with meta function", {
  x <- tmCorpus(c("doc1", "doc2"))
  meta(x, tag = "language") <- c("pl", "pl")
  expect_equal(getMeta(x, "language", 2), "pl")
})

test_that("tm_filter and tm_index works for tmCorpus", {
  x <- tmCorpus(c("company", "ala", "coMpany", "next"))
  x <- tm_filter(x, FUN = function(x) any(grep("co[m]?pany", content(x))))
  expect_equal(length(x), 1)
})

test_that("tm_filter and tm_index works for tmCorpus", {
  x <- tmCorpus(c("company", "ala"))
  x <- c(x, x)
  expect_equal(length(x), 4)
  expect_equal(class(x), "tmCorpus")
})

context("Usage of treetagger")
test_that("Tree tagger can be applied to tmCorpus object", {
  q <- c("MUCH ADO ABOUT NOTHING", "Persons Represented.")
  x <- tmCorpus(q)
  dir_tt <- dir("C:\\TreeTagger")
  if(length(dir_tt) !=0){
  rd <- tagtmCorpus_helper(x, treetagger = "manual",
                           lang = "en",
                           TT.options = list(path = "C:\\TreeTagger",
                                             preset = "en"))
  expect_equal(rd[[1]]$token, c("MUCH", "ADO", "ABOUT", "NOTHING"))
  }
})

context("Train function attached to the dtm for topicmodels pacakge")
test_that("Class of the model is tmTopicModel", {
  x <- tmCorpus(lapply(1:100, function(x) paste(sample(LETTERS, 11),
                                                collapse = "")))
  y <- tm::DocumentTermMatrix(x)
  rownames(y) <- meta(x, "title")
  model <- suppressMessages(train(y, package = "topicmodels"))
  expect_equal(class(model), "tmTopicModel")
})

test_that("Predict posterior probabilities for new instances for topicmodels
          model", {
  x <- tmCorpus(lapply(1:100, function(x) paste(sample(LETTERS, 11),
                                                collapse = "")))
  y <- tm::DocumentTermMatrix(x)
  rownames(y) <- meta(x, "title")
  model <- suppressMessages(train(y, package = "topicmodels"))
  pred <- predict(model, y)
  topicProbabilities <- as.data.frame(model$model@gamma)
  names(topicProbabilities) <- as.character(1:20)
  row.names(topicProbabilities) <- NULL
  row.names(pred) <- NULL
  expect_equal(pred, topicProbabilities)
})


test_that("Terms for tmTopicModal", {
  x <- tmCorpus(lapply(1:100, function(x) paste(sample(LETTERS, 11),
                                                collapse = "")))
  y <- tm::DocumentTermMatrix(x)
  rownames(y) <- meta(x, "title")
  model <- suppressMessages(train(y, package = "topicmodels"))
  expect_equal(class(terms(model,2)), "data.frame")
})

test_that("Terms for tmTopicModal", {
  x <- tmCorpus(lapply(1:100, function(x) paste(sample(LETTERS, 11),
                                                collapse = "")))
  wd <- stopwords_temp()
  model <- suppressMessages(train(x))
  setwd(wd)
  expect_equal(class(terms(model,2)), "data.frame")
  expect_equal(class(terms(model,1)), "data.frame")
})

test_that("Test topicmodels for many models", {
  k <- 30
  SEED <- 2016
  x <- tmCorpus(lapply(1:100, function(x) paste(sample(LETTERS, 11),
                                                collapse = "")))
  y <- DocumentTermMatrix(x)
  rownames(y) <- meta(x, "title")
  jss_TM <-
    list(VEM = train(y, k = k, control = list(seed = SEED)),
         VEM_fixed = train(y, k = k,
                         control = list(estimate.alpha = FALSE, seed = SEED)),
         Gibbs = train(y, k = k, method = "Gibbs",
                     control = list(seed = SEED, burnin = 1000,
                                    thin = 100, iter = 1000)))
         # CTM = CTM(JSS_dtm, k = k,
         #           control = list(seed = SEED,
         #                          var = list(tol = 10^-4),
         #                          em = list(tol = 10^-3))))
  expect_equal(class(jss_TM$VEM), "tmTopicModel")
  expect_equal(class(jss_TM$VEM_fixed), "tmTopicModel")
  expect_equal(class(jss_TM$Gibbs), "tmTopicModel")
})
