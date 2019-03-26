## ---- include = TRUE, message=FALSE, eval = FALSE------------------------
#  devtools::install_github("DoCMA-TU/tosca")
#  library(tosca)

## ---- eval = FALSE-------------------------------------------------------
#  install.packages("tosca")
#  library(tosca)

## ---- include = FALSE, message=FALSE-------------------------------------
library(tosca)

## ---- eval = FALSE-------------------------------------------------------
#  corpus <- readWikinews()

## ---- eval = TRUE--------------------------------------------------------
data(politics)
data(economy)
corpus <- mergeTextmeta(list(politics, economy))

## ---- eval = FALSE, echo=FALSE-------------------------------------------
#  save(politics, file = "../data/politics.rda")
#  save(economy, file = "../data/economy.rda")

## ------------------------------------------------------------------------
corpus$text <- removeXML(corpus$text)
corpus$text <- removeHTML(corpus$text, dec=FALSE, hex=FALSE, entity=FALSE)

## ------------------------------------------------------------------------
corpus$meta$title <- removeXML(corpus$meta$title)
corpus$meta$title <- removeHTML(corpus$meta$title, dec=FALSE, hex=FALSE, entity=FALSE)

## ------------------------------------------------------------------------
corpus <- deleteAndRenameDuplicates(corpus)

## ------------------------------------------------------------------------
dups <- duplist(corpus)

## ------------------------------------------------------------------------
corpusClean <- cleanTexts(object = corpus)

## ------------------------------------------------------------------------
textClean2 <- cleanTexts(text = corpus$text)
corpusClean2 <- textmeta(text = textClean2, meta = corpus$meta)

## ------------------------------------------------------------------------
wordtable <- makeWordlist(corpusClean$text)

## ------------------------------------------------------------------------
print(corpus)

## ------------------------------------------------------------------------
summary(corpus)

## ---- fig.width=5, fig.height=2.8, fig.align=2---------------------------
plotScot(corpusClean, curves = "both")

## ---- fig.width=5, fig.height=2.8, fig.align=2---------------------------
plotScot(corpus, id = dups$notDuplicatedTexts, rel = TRUE)

## ---- fig.width=5, fig.height=3.5, fig.align=2, fig.show="hold"----------
wordsEconomy <- list("unemployment", "growth", "trade", 
                     c("unemployment", "growth", "trade"))
plotFreq(corpusClean, wordlist = wordsEconomy, curves = "smooth",
  ylim = c(0, 25), legend = "topright", 
  main = "Wordlist-filtered texts over time. link: and")
plotFreq(corpusClean, wordlist = wordsEconomy, link = "or", curves = "smooth",
  ylim = c(0, 25), legend = "topright", 
  main = "Wordlist-filtered texts over time. link: or")

## ---- fig.width=5, fig.height=3, fig.align=2-----------------------------
plotFreq(corpusClean, wordlist = list(c("crisis", "war", "conflict")), link = "or",
  curves = "both", both.lwd = 2, legend = "topright", 
  main = "Wordlist-filtered texts over time. link: or")

## ------------------------------------------------------------------------
set.seed(123)
ids.selected <- sample(corpus$meta$id, 6)
temp <- showTexts(corpus, id = ids.selected)
temp[, c("id", "date", "title")]

## ------------------------------------------------------------------------
temp <- showMeta(corpus$meta, id = matrix(ids.selected, nrow = 2),
  cols = c("title", "date"))
temp

## ------------------------------------------------------------------------
corpusDate <- filterDate(corpusClean, s.date = "2006-01-01", e.date = "2009-12-31")
print(corpusClean)
print(corpusDate)

## ------------------------------------------------------------------------
textCounts <- lengths(corpusDate$text)
quantile(textCounts, probs = c(0, 0.05, 0.1, 0.2, 0.5, 0.8, 0.9, 0.95, 1))

## ------------------------------------------------------------------------
mean(textCounts != filterCount(corpusDate, out = "count"))

## ------------------------------------------------------------------------
toyCorpus <- list(text1 = "dataset", text2 = "anything")
searchterm <- c("data", "as", "set", "anything")
filterWord(text = toyCorpus, search = searchterm, out = "bin")

## ------------------------------------------------------------------------
searchframe <- data.frame(pattern = searchterm, word = FALSE, count = 1)
filterWord(text = toyCorpus, search = searchframe, out = "bin")

## ------------------------------------------------------------------------
filterWord(text = toyCorpus, search = searchframe[1:3,], out = "bin")

## ------------------------------------------------------------------------
filterWord(text = list(text1 = c("i", "was", "here", "text"),
  text2 = c("some", "text", "about", "some", "text", "and", "something", "else")),
  search = c("some", "text"), out = "count")

## ------------------------------------------------------------------------
searchterm <- list(text1 = "land and and", text2 = c("and", "land", "and", "and"))
searchframe <- list(
  data.frame(pattern = "and", word = FALSE, count = 1),
  data.frame(pattern = "and", word = TRUE, count = 1))
filterWord(text = searchterm, search = searchframe, out = "count")

## ------------------------------------------------------------------------
searchterm <- list(
  data.frame(pattern = "economy", word = FALSE, count = 1),
  data.frame(pattern = c("world", "economy"), word = FALSE, count = 1),
  data.frame(pattern = "politics", word = FALSE, count = 1))
corpusFiltered <- filterWord(corpusDate, search = searchterm)
print(corpusDate)
print(corpusFiltered)

## ------------------------------------------------------------------------
wordtableFiltered <- makeWordlist(corpusFiltered$text, method = "radix")

## ------------------------------------------------------------------------
head(sort(wordtableFiltered$wordtable, decreasing = TRUE))

## ------------------------------------------------------------------------
words5 <- wordtableFiltered$words[wordtableFiltered$wordtable > 5]
pagesLDA <- LDAprep(text = corpusFiltered$text, vocab = words5)

## ---- eval = TRUE, include = FALSE---------------------------------------
result <- LDAgen(documents = pagesLDA, K = 10L, vocab = words5, seed = 123)
load("lda-result-k10i200b70s123alpha0.1eta0.1.RData")

## ---- eval = FALSE-------------------------------------------------------
#  result <- LDAgen(documents = pagesLDA, K = 10L, vocab = words5, seed = 123)
#  load(file.path(tempdir(),"lda-result-k10i200b70s123alpha0.1eta0.1.RData"))

## ---- eval = FALSE-------------------------------------------------------
#  set.seed(155)
#  intWords <- intruderWords(beta = result$topics, numIntruder = 0:1)

## ---- include = FALSE----------------------------------------------------
set.seed(155)
intWords <- intruderWords(beta = result$topics, numIntruder = 0:1,
  test = TRUE, testinput = as.character(c(1,2,5,1,4,0,0,5,1,2)))

## ---- echo = FALSE-------------------------------------------------------
set.seed(155)
toDelete <- intruderWords(beta = result$topics, numIntruder = 0:1,
  test = TRUE, testinput = "q", printSolution = TRUE)

## ------------------------------------------------------------------------
print(intWords)

## ------------------------------------------------------------------------
summary(intWords)

## ---- eval = FALSE-------------------------------------------------------
#  intWords <- intruderWords(oldResult = intWords)

## ---- eval = FALSE-------------------------------------------------------
#  intruderTopics(text = corpus$text, id = ldaID,
#    beta = result$topics, theta = result$document_sums)

## ---- fig.width=5, fig.height=3.3, fig.align=2---------------------------
clustRes <- clusterTopics(ldaresult = result, xlab = "Topic", ylab = "Distance")
names(clustRes)

## ---- fig.width=5.5, fig.height=3.5, fig.align=2-------------------------
plotTopic(object = corpusFiltered, ldaresult = result, ldaID = ldaID,
  rel = TRUE, curves = "smooth", smooth = 0.1, legend = "none", ylim = c(0, 0.7))

## ---- fig.width=5.5, fig.height=3.5, fig.align=2-------------------------
plotTopic(object = corpusClean, ldaresult = result, ldaID = ldaID,
  select = c(3:4, 6, 8), rel = TRUE, curves = "both", smooth = 0.1, legend = "topleft")

## ---- eval = FALSE-------------------------------------------------------
#  plotArea(ldaresult = result, ldaID = ldaID, meta = corpusFiltered$meta,
#    select = c(3, 6, 8), unit = "bimonth", sort = FALSE)

## ---- echo=FALSE, fig.width=5.5, fig.height=3, fig.align=2---------------
par(mar = c(3.5,3,1.5,1.5)+0.1)
plotArea(ldaresult = result, ldaID = ldaID, meta = corpusFiltered$meta,
  select = c(3, 6, 8), unit = "bimonth", sort = FALSE)

## ---- fig.width=5.5, fig.height=3.5, fig.align=2-------------------------
plotTopicWord(object = corpusFiltered, docs = pagesLDA, ldaresult = result, ldaID = ldaID,
  wordlist = "economy", select = c(3, 6, 8), rel = TRUE, legend = "topleft")

## ---- eval = FALSE-------------------------------------------------------
#  tab <- plotTopicWord(corpusFiltered, pagesLDA, result, ldaID, "economy", rel = TRUE)
#  all(round(rowSums(tab[, -1]), 10) %in% c(1, 0))

## ---- include = FALSE----------------------------------------------------
tab <- plotTopicWord(corpusFiltered, pagesLDA, result, ldaID, "economy", rel = TRUE)
all(round(rowSums(tab[, -1]), 10) %in% c(1, 0))

## ---- echo = FALSE-------------------------------------------------------
all(round(rowSums(tab[, -1]), 10) %in% c(1, 0))

## ---- fig.width=5.5, fig.height=3.5, fig.align=2-------------------------
plotWordpt(object = corpusFiltered, docs = pagesLDA, ldaresult = result, ldaID = ldaID,
  wordlist = "economy", select = c(3, 6, 8), rel = TRUE)

## ---- fig.width=5.5, fig.height=3.5, fig.align=2-------------------------
searcheco <- data.frame(pattern = "economy", word = TRUE, count = 3)
plotWordSub(object = corpusFiltered, ldaresult = result, ldaID = ldaID, limit = 1/3,
  select = c(3, 6, 8), search = searcheco, unit = "quarter", legend = "topright")

## ---- fig.height=6, fig.width=10-----------------------------------------
plotHeat(object = corpusFiltered, ldaresult = result, ldaID = ldaID, unit = "quarter")

## ------------------------------------------------------------------------
topID <- topTexts(ldaresult = result, ldaID = ldaID, select = c(8, 3, 6), limit = 4)
dim(topID)

## ------------------------------------------------------------------------
topArt <- showTexts(corpusFiltered, id = topID)
lapply(topArt, function(x) x[, 1:3])

## ---- eval = FALSE-------------------------------------------------------
#  topicsInText(text = pagesLDA, ldaresult = result, ldaID = ldaID,
#    id = topArt$T3.economy[4,1], vocab = words5, originaltext = corpus$text, wordOrder = "")

## ---- eval = FALSE-------------------------------------------------------
#  library(tosca)
#  ## load data
#  data(politics)
#  data(economy)
#  corpus <- mergeTextmeta(list(politics, economy))
#  
#  ## Remove XML-tags and HTML-entities in title and text
#  corpus$text <- removeXML(corpus$text)
#  corpus$text <- removeHTML(corpus$text, dec=FALSE, hex=FALSE, entity=FALSE)
#  corpus$meta$title <- removeXML(corpus$meta$title)
#  corpus$meta$title <- removeHTML(corpus$meta$title, dec=FALSE, hex=FALSE, entity=FALSE)
#  
#  ##looking for duplicates and first summaries
#  corpus <- deleteAndRenameDuplicates(corpus)
#  dups <- duplist(corpus)
#  plotScot(corpus, id = dups$notDuplicatedTexts, rel = TRUE)
#  print(corpus)
#  summary(corpus)
#  plotScot(corpus, curves = "both")
#  
#  ## corpus preprocessing / wordlists
#  corpusClean <- cleanTexts(object = corpus)
#  wordtable <- makeWordlist(corpusClean$text)
#  corpusDate <- filterDate(corpusClean, s.date = "2006-01-01", e.date = "2009-12-31")
#  searchterm <- list(
#    data.frame(pattern = "economy", word = FALSE, count = 1),
#    data.frame(pattern = c("world", "economy"), word = FALSE, count = 1),
#    data.frame(pattern = "politics", word = FALSE, count = 1))
#  corpusFiltered <- filterWord(corpusDate, search = searchterm)
#  
#  ## prepare for LDA
#  wordtableFiltered <- makeWordlist(corpusFiltered$text, method = "radix")
#  words5 <- wordtableFiltered$words[wordtableFiltered$wordtable > 5]
#  pagesLDA <- LDAprep(text = corpusFiltered$text, vocab = words5)
#  LDAresult <- LDAgen(documents = pagesLDA, K = 10L, vocab = words5)

## ---- include = FALSE, eval = FALSE--------------------------------------
#  library(knitr)
#  purl("Vignette.Rmd", documentation = 2, quiet = TRUE)
#  # get R-Code of the RMD

