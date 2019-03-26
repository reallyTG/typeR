library(superml)


### Name: TfIdfVectorizer
### Title: TfIDF(Term Frequency Inverse Document Frequency) Vectorizer
### Aliases: TfIdfVectorizer
### Keywords: datasets

### ** Examples

df <- data.frame(sents = c('i am alone in dark.',
                           'mother_mary a lot',
                           'alone in the dark?',
                           'many mothers in the lot....'))
tf <- TfIdfVectorizer$new(smooth_idf = TRUE, min_df = 0.3)
tf_features <- tf$fit_transform(df$sents)



