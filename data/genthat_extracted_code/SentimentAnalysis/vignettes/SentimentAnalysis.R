## ------------------------------------------------------------------------
# install.packages("SentimentAnalysis")
library(SentimentAnalysis)

## ------------------------------------------------------------------------
# Analyze a single string to obtain a binary response (positive / negative)
sentiment <- analyzeSentiment("Yeah, this was a great soccer game for the German team!")
convertToBinaryResponse(sentiment)$SentimentQDAP

## ------------------------------------------------------------------------
# Create a vector of strings
documents <- c("Wow, I really like the new light sabers!",
               "That book was excellent.",
               "R is a fantastic language.",
               "The service in this restaurant was miserable.",
               "This is neither positive or negative.",
               "The waiter forget about my dessert -- what poor service!")

# Analyze sentiment
sentiment <- analyzeSentiment(documents)

# Extract dictionary-based sentiment according to the QDAP dictionary
sentiment$SentimentQDAP

# View sentiment direction (i.e. positive, neutral and negative)
convertToDirection(sentiment$SentimentQDAP)

response <- c(+1, +1, +1, -1, 0, -1)

compareToResponse(sentiment, response)

compareToResponse(sentiment, convertToBinaryResponse(response))

plotSentimentResponse(sentiment$SentimentQDAP, response)

## ------------------------------------------------------------------------
documents <- c("This is good",
               "This is bad",
               "This is inbetween")
convertToDirection(analyzeSentiment(documents)$SentimentQDAP)

## ------------------------------------------------------------------------
library(tm)
corpus <- VCorpus(VectorSource(documents))
convertToDirection(analyzeSentiment(corpus)$SentimentQDAP)

## ------------------------------------------------------------------------
dtm <- preprocessCorpus(corpus)
convertToDirection(analyzeSentiment(dtm)$SentimentQDAP)

## ------------------------------------------------------------------------
# Make dictionary available in the current R environment
data(DictionarHE)
# Display the internal structure 
str(DictionaryHE)
# Access dictionary as an object of type SentimentDictionary
dict.HE <- loadDictionaryHE()
# Print summary statistics of dictionary
summary(dict.HE)

data(DictionaryLM)
str(DictionaryLM)

## ------------------------------------------------------------------------
d <- SentimentDictionaryWordlist(c("uncertain", "possible", "likely"))
summary(d)

# Alternative call
d <- SentimentDictionary(c("uncertain", "possible", "likely"))
summary(d)

## ------------------------------------------------------------------------
d <- SentimentDictionaryBinary(c("increase", "rise", "more"),
                               c("fall", "drop"))
summary(d)

# Alternative call
d <- SentimentDictionary(c("increase", "rise", "more"),
                         c("fall", "drop"))
summary(d)

## ------------------------------------------------------------------------
d <- SentimentDictionaryWeighted(c("increase", "decrease", "exit"),
                                 c(+1, -1, -10),
                                 rep(NA, 3))
summary(d)

# Alternative call
d <- SentimentDictionary(c("increase", "decrease", "exit"),
                         c(+1, -1, -10),
                         rep(NA, 3))
summary(d)                         

## ------------------------------------------------------------------------
# Create a vector of strings
documents <- c("This is a good thing!",
               "This is a very good thing!",
               "This is okay.",
               "This is a bad thing.",
               "This is a very bad thing.")
response <- c(1, 0.5, 0, -0.5, -1)

# Generate dictionary with LASSO regularization
dict <- generateDictionary(documents, response)

dict

summary(dict)

## ----eval=FALSE----------------------------------------------------------
#  write(dict, file="dictionary.dict")
#  dict <- read("dictionary.dict")

## ------------------------------------------------------------------------
compareDictionaries(dict,
                    loadDictionaryQDAP())

sentiment <- predict(dict, documents)
compareToResponse(sentiment, response)
plotSentimentResponse(sentiment, response)

## ------------------------------------------------------------------------
test_documents <- c("This is neither good nor bad",
                    "What a good idea!",
                    "Not bad")
test_response <- c(0, 1, 1)

pred <- predict(dict, test_documents)

compareToResponse(pred, test_response)
plotSentimentResponse(pred, test_response)

compareToResponse(analyzeSentiment(test_documents), test_response)

## ------------------------------------------------------------------------
corpus <- VCorpus(VectorSource(documents))
tdm <- TermDocumentMatrix(corpus, 
                          control=list(wordLengths=c(1,Inf), 
                                       tokenize=function(x) ngram_tokenize(x, char=FALSE, 
                                                                           ngmin=1, ngmax=2)))
rownames(tdm)

dict <- generateDictionary(tdm, response)
summary(dict)
dict

## ------------------------------------------------------------------------
sentiment <- analyzeSentiment(documents,
                              rules=list("SentimentLM"=list(ruleSentiment, loadDictionaryLM())))
sentiment

## ------------------------------------------------------------------------
documents <- c("Das ist ein gutes Resultat",
               "Das Ergebnis war schlecht")
dictionaryGerman <- SentimentDictionaryBinary(c("gut"), 
                                              c("schlecht"))

sentiment <- analyzeSentiment(documents,
                              language="german",
                              rules=list("GermanSentiment"=list(ruleSentiment, dictionaryGerman)))
sentiment

convertToBinaryResponse(sentiment$GermanSentiment)

## ------------------------------------------------------------------------
woorden <- c("goed","slecht")
scores <- c(0.8,-0.5)
dictionaryDutch <- SentimentDictionaryWeighted(woorden, scores)
documents <- "dit is heel slecht"
sentiment <- analyzeSentiment(documents,
                              language="dutch",
                              rules=list("DutchSentiment"=list(ruleLinearModel, dictionaryDutch)))
sentiment

## ------------------------------------------------------------------------
library(tm)
data("crude")

# Analyze sentiment
sentiment <- analyzeSentiment(crude)

# Count positive and negative news releases
table(convertToBinaryResponse(sentiment$SentimentLM))

# News releases with highest and lowest sentiment
crude[[which.max(sentiment$SentimentLM)]]$meta$heading
crude[[which.min(sentiment$SentimentLM)]]$meta$heading

# View summary statistics of sentiment variable
summary(sentiment$SentimentLM)

# Visualize distribution of standardized sentiment variable
hist(scale(sentiment$SentimentLM))

# Compute cross-correlation 
cor(sentiment[, c("SentimentLM", "SentimentHE", "SentimentQDAP")])

# crude oil news between  1987-02-26 until 1987-03-02
datetime <- do.call(c, lapply(crude, function(x) x$meta$datetimestamp))

plotSentiment(sentiment$SentimentLM)
plotSentiment(sentiment$SentimentLM, x=datetime, cumsum=TRUE)

## ------------------------------------------------------------------------
# count words (without stopwords)
countWords(documents)

# count all words (including stopwords)
countWords(documents, removeStopwords=FALSE)

