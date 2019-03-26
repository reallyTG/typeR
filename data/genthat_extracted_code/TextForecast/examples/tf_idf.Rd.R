library(TextForecast)


### Name: tf_idf
### Title: tf-idf function
### Aliases: tf_idf

### ** Examples

data("news_data")
X=as.matrix(news_data[,2:ncol(news_data)])
tf_idf_terms = tf_idf(X)



