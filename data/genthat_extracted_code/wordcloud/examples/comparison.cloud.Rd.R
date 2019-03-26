library(wordcloud)


### Name: comparison.cloud
### Title: Plot a comparison cloud
### Aliases: comparison.cloud

### ** Examples


if(require(tm)){
	data(SOTU)
	corp <- SOTU
	corp <- tm_map(corp, removePunctuation)
	corp <- tm_map(corp, content_transformer(tolower))
	corp <- tm_map(corp, removeNumbers)
	corp <- tm_map(corp, function(x)removeWords(x,stopwords()))

	term.matrix <- TermDocumentMatrix(corp)
	term.matrix <- as.matrix(term.matrix)
	colnames(term.matrix) <- c("SOTU 2010","SOTU 2011")
	comparison.cloud(term.matrix,max.words=40,random.order=FALSE)
	comparison.cloud(term.matrix,max.words=40,random.order=FALSE,
		title.colors=c("red","blue"),title.bg.colors=c("grey40","grey70"))
	comparison.cloud(term.matrix,max.words=40,random.order=FALSE,
		match.colors=TRUE)

}




