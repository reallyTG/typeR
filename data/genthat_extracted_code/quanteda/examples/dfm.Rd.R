library(quanteda)


### Name: dfm
### Title: Create a document-feature matrix
### Aliases: dfm
### Keywords: dfm

### ** Examples

## for a corpus
corpus_post80inaug <- corpus_subset(data_corpus_inaugural, Year > 1980)
dfm(corpus_post80inaug)
dfm(corpus_post80inaug, tolower = FALSE)

# grouping documents by docvars in a corpus
dfm(corpus_post80inaug, groups = "President", verbose = TRUE)

# with English stopwords and stemming
dfm(corpus_post80inaug, remove = stopwords("english"), stem = TRUE, verbose = TRUE)
# works for both words in ngrams too
dfm("Banking industry", stem = TRUE, ngrams = 2, verbose = FALSE)

# with dictionaries
corpus_post1900inaug <- corpus_subset(data_corpus_inaugural, Year > 1900)
mydict <- dictionary(list(christmas = c("Christmas", "Santa", "holiday"),
               opposition = c("Opposition", "reject", "notincorpus"),
               taxing = "taxing",
               taxation = "taxation",
               taxregex = "tax*",
               country = "states"))
dfm(corpus_post1900inaug, dictionary = mydict)


# removing stopwords
test_text <- "The quick brown fox named Seamus jumps over the lazy dog also named Seamus, with
             the newspaper from a boy named Seamus, in his mouth."
test_corpus <- corpus(test_text)
# note: "also" is not in the default stopwords("english")
featnames(dfm(test_corpus, select = stopwords("english")))
# for ngrams
featnames(dfm(test_corpus, ngrams = 2, select = stopwords("english"), remove_punct = TRUE))
featnames(dfm(test_corpus, ngrams = 1:2, select = stopwords("english"), remove_punct = TRUE))

# removing stopwords before constructing ngrams
tokens_all <- tokens(char_tolower(test_text), remove_punct = TRUE)
tokens_no_stopwords <- tokens_remove(tokens_all, stopwords("english"))
tokens_ngrams_no_stopwords <- tokens_ngrams(tokens_no_stopwords, 2)
featnames(dfm(tokens_ngrams_no_stopwords, verbose = FALSE))

# keep only certain words
dfm(test_corpus, select = "*s", verbose = FALSE)  # keep only words ending in "s"
dfm(test_corpus, select = "s$", valuetype = "regex", verbose = FALSE)

# testing Twitter functions
test_tweets <- c("My homie @justinbieber #justinbieber shopping in #LA yesterday #beliebers",
                "2all the ha8ers including my bro #justinbieber #emabiggestfansjustinbieber",
                "Justin Bieber #justinbieber #belieber #fetusjustin #EMABiggestFansJustinBieber")
dfm(test_tweets, select = "#*", remove_twitter = FALSE)  # keep only hashtags
dfm(test_tweets, select = "^#.*$", valuetype = "regex", remove_twitter = FALSE)

# for a dfm
dfm1 <- dfm(data_corpus_irishbudget2010)
dfm2 <- dfm(dfm1, 
            groups = ifelse(docvars(data_corpus_irishbudget2010, "party") %in% c("FF", "Green"),
                            "Govt", "Opposition"), 
            tolower = FALSE, verbose = TRUE)




