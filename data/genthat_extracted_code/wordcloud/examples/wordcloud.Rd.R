library(wordcloud)


### Name: wordcloud
### Title: Plot a word cloud
### Aliases: wordcloud

### ** Examples


wordcloud(c(letters, LETTERS, 0:9), seq(1, 1000, len = 62))

if(require(tm)){

	##### 			from character 		#####
	wordcloud(
"Many years ago the great British explorer George Mallory, who 
was to die on Mount Everest, was asked why did he want to climb 
it. He said, \"Because it is there.\"

Well, space is there, and we're going to climb it, and the 
moon and the planets are there, and new hopes for knowledge 
and peace are there. And, therefore, as we set sail we ask 
God's blessing on the most hazardous and dangerous and greatest 
adventure on which man has ever embarked.",
	,random.order=FALSE)

## Not run: 
##D 	data(crude)
##D 	crude <- tm_map(crude, removePunctuation)
##D 	crude <- tm_map(crude, function(x)removeWords(x,stopwords()))
##D 	
##D 	##### 			from corpus 		#####
##D 	wordcloud(crude)
##D 	
##D 	
##D 	##### 		from frequency counts 	#####
##D 	tdm <- TermDocumentMatrix(crude)
##D 	m <- as.matrix(tdm)
##D 	v <- sort(rowSums(m),decreasing=TRUE)
##D 	d <- data.frame(word = names(v),freq=v)
##D 	
##D 	wordcloud(d$word,d$freq)
##D 
##D 	#A bigger cloud with a minimum frequency of 2
##D 	wordcloud(d$word,d$freq,c(8,.3),2)
##D 
##D 	#Now lets try it with frequent words plotted first
##D 	wordcloud(d$word,d$freq,c(8,.5),2,,FALSE,.1)
##D 
##D 	##### 			with colors 		#####
##D 	if(require(RColorBrewer)){
##D 
##D 		pal <- brewer.pal(9,"BuGn")
##D 		pal <- pal[-(1:4)]
##D 		wordcloud(d$word,d$freq,c(8,.3),2,,FALSE,,.15,pal)
##D 
##D 
##D 		pal <- brewer.pal(6,"Dark2")
##D 		pal <- pal[-(1)]
##D 		wordcloud(d$word,d$freq,c(8,.3),2,,TRUE,,.15,pal)
##D 		
##D 		#random colors
##D 		wordcloud(d$word,d$freq,c(8,.3),2,,TRUE,TRUE,.15,pal)
##D 	}
##D 	##### 			with font 			#####
##D 
##D 	wordcloud(d$word,d$freq,c(8,.3),2,,TRUE,,.15,pal,
##D 		vfont=c("gothic english","plain"))
##D 
##D 	wordcloud(d$word,d$freq,c(8,.3),2,100,TRUE,,.15,pal,vfont=c("script","plain"))
##D 	
##D 	wordcloud(d$word,d$freq,c(8,.3),2,100,TRUE,,.15,pal,vfont=c("serif","plain"))
## End(Not run)
}





