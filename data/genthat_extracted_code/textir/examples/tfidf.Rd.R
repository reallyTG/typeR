library(textir)


### Name: tfidf
### Title: tf-idf
### Aliases: tfidf

### ** Examples

data(we8there)
## 20 high-variance tf-idf terms
colnames(we8thereCounts)[
	order(-sdev(tfidf(we8thereCounts)))[1:20]]
 
 


