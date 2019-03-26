library(smdc)


### Name: smdc-package
### Title: Document Similarity
### Aliases: smdc-package smdc
### Keywords: package

### ** Examples


# Load text mining package 'tm' for English.
# 'RMeCab' is available for Japanese.
# install.packages('tm')
library('tm')

# Read corpus data.
crudeDir <- system.file("texts", "crude", package = "tm")
crude <- Corpus(DirSource(crudeDir))
docMatrix1 <- t(as.matrix(DocumentTermMatrix(crude)))
acqDir <- system.file("texts", "acq", package = "tm")
acq <- Corpus(DirSource(acqDir))
docMatrix2 <- t(as.matrix(DocumentTermMatrix(acq)))

# Create score dictionary.
words <- unique(c(rownames(docMatrix1),rownames(docMatrix2)))
scores <- runif(length(words),-1,1)
dict <- data.frame(word=words,score=scores)

# Calculate similarity.
sim1 <- simDoc(docMatrix1,docMatrix2,norm=TRUE)
sim2 <- simDic(docMatrix1,docMatrix2,dict,norm=TRUE)
sim <- simSyn(list(sim1,sim2),c(0.5,0.5))
simSum(sim)




