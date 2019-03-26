library(qdap)


### Name: gradient_cloud
### Title: Gradient Word Cloud
### Aliases: gradient_cloud
### Keywords: heatcloud

### ** Examples

## Not run: 
##D DATA$state <- space_fill(DATA$state, c("is fun", "too fun", "you liar"))
##D 
##D gradient_cloud(DATA$state, DATA$sex, title="fun")
##D gradient_cloud(DATA$state, DATA$sex, title="fun", rev.binary = TRUE)
##D gradient_cloud(DATA$state, DATA$sex, title="fun", max.word.size = 5,
##D     min.word.size = .025)
##D     
##D with(mraja1, gradient_cloud(dialogue, died, stopwords = Top25Words, 
##D     rot.per = .5, title="Heatcloud", title.color="orange", title.cex=1.75))    
##D x <- with(subset(mraja1, fam.aff %in% qcv(cap, mont)), 
##D     gradient_cloud(dialogue, fam.aff))
##D head(x) 
##D 
##D ## 2012 U.S. Presidential Debates
##D invisible(lapply(split(pres_debates2012, pres_debates2012$time), function(x) {
##D     x <- x[x$person %in% qcv(ROMNEY, OBAMA), ]
##D     dev.new()
##D     gradient_cloud(x$dialogue, x$person, 
##D         title = paste("Debate", char2end(x$time[1])),
##D         stopwords = BuckleySaltonSWL,
##D         X = "blue", Y = "red", 
##D         max.word.size = 2.2, 
##D         min.word.size = 0.55
##D     )
##D }))
##D         
## End(Not run)



