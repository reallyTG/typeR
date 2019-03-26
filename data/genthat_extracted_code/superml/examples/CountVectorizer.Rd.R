library(superml)


### Name: CountVectorizer
### Title: Count Vectorizer
### Aliases: CountVectorizer
### Keywords: datasets

### ** Examples

df <- data.frame(sents = c('i am alone in dark.','mother_mary a lot',
                           'alone in the dark?',
                           'many mothers in the lot....'))

# fits and transforms on the entire data in one go
bw <- CountVectorizer$new(min_df = 0.3)
tf_features <- bw$fit_transform(df$sents)

# fit on entire data and do transformation in train and test
bw <- CountVectorizer$new()
bw$fit(df$sents)
tf_features <- bw$transform(df$sents)



