library(OIdata)


### Name: ipo
### Title: Facebook, Google, and LinkedIn IPO filings
### Aliases: ipo
### Keywords: datasets ipo corpus text mining

### ** Examples

data(ipo)
## Not run: 
##D # install.packages("tm")
##D # install.packages("wordcloud")
##D library(tm)
##D library(wordcloud)
##D 
##D # pre-process data
##D corp <- Corpus(VectorSource(ipo), readerControl=list(language="en"))
##D corp <- tm_map(corp, removePunctuation)
##D corp <- tm_map(corp, tolower)
##D corp <- tm_map(corp, removeNumbers)
##D corp <- tm_map(corp, function(x)removeWords(x,stopwords()))
##D f    <- corp[1] # facebook
##D g    <- corp[2] # google
##D l    <- corp[3] # linkedin
##D 
##D tmat      <- TermDocumentMatrix(f)
##D m         <- as.matrix(tmat)
##D freq      <- rowSums(m)
##D words     <- rownames(m)
##D words.ord <- sort.int(freq, decreasing = T, index.return = F)
##D barplot(words.ord[1:15], las = 2)
##D 
##D wordcloud(words, freq, min.freq = 100, col='blue')
##D 
##D tmat <- TermDocumentMatrix(c(f, g))
##D m    <- as.matrix(tmat)
##D comparison.cloud(m, max.words = 100)
## End(Not run)



