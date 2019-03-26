library(textmineR)


### Name: FitLsaModel
### Title: Fit a topic model using Latent Semantic Analysis
### Aliases: FitLsaModel

### ** Examples

# Load a pre-formatted dtm 
data(nih_sample_dtm) 

# Convert raw word counts to TF-IDF frequency weights
idf <- log(nrow(nih_sample_dtm) / Matrix::colSums(nih_sample_dtm > 0))

dtm_tfidf <- Matrix::t(nih_sample_dtm) * idf

dtm_tfidf <- Matrix::t(dtm_tfidf)

# Fit an LSA model
model <- FitLsaModel(dtm = dtm_tfidf, k = 5)

str(model)




