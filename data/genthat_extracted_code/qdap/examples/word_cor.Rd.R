library(qdap)


### Name: word_cor
### Title: Find Correlated Words
### Aliases: word_cor
### Keywords: association correlation,

### ** Examples

## Not run: 
##D x <- factor(with(rajSPLIT, paste(act, pad(TOT(tot)), sep = "|")))
##D word_cor(rajSPLIT$dialogue, x, "romeo", .45)
##D word_cor(rajSPLIT$dialogue, x, "love", .5)  
##D 
##D ## Negative correlation
##D word_cor(rajSPLIT$dialogue, x, "you", -.1)
##D with(rajSPLIT, word_cor(dialogue, list(person, act), "hate"))
##D 
##D words <- c("hate", "i", "love", "ghost")
##D with(rajSPLIT, word_cor(dialogue, x, words, r = .5))
##D with(rajSPLIT, word_cor(dialogue, x, words, r = .4))
##D 
##D ## Set `r = NULL` to get matrix between words
##D with(rajSPLIT, word_cor(dialogue, x, words, r = NULL))
##D 
##D ## Plotting 
##D library(tm)
##D data("crude")
##D oil_cor1 <- apply_as_df(crude, word_cor, word = "oil", r=.7)
##D plot(oil_cor1)
##D 
##D oil_cor2 <- apply_as_df(crude, word_cor, word = qcv(texas, oil, money), r=.7)
##D plot(oil_cor2)
##D plot(oil_cor2, ncol=2)
##D 
##D oil_cor3 <- apply_as_df(crude, word_cor, word = qcv(texas, oil, money), r=NULL)
##D plot(oil_cor3)
##D 
##D ## Run on multiple times/person/nested
##D ## Split and apply to data sets
##D ## Suggested use of stemming
##D DATA3 <- split(DATA2, DATA2$person)
##D 
##D ## Find correlations between words per turn of talk by person
##D ## Throws multiple warning because small data set
##D library(qdapTools)
##D lapply(DATA3, function(x) {
##D     word_cor(x[, "state"], qdapTools::id(x), qcv(computer, i, no, good), r = NULL)
##D })
##D 
##D ## Find words correlated per turn of talk by person
##D ## Throws multiple warning because small data set
##D lapply(DATA3, function(x) {
##D     word_cor(x[, "state"], qdapTools::id(x), qcv(computer, i, no, good))
##D })
##D 
##D 
##D ## A real example
##D dat <- pres_debates2012 
##D dat$TOT <- factor(with(dat, paste(time, pad(TOT(tot)), sep = "|")))
##D dat <- dat[dat$person %in% qcv(OBAMA, ROMNEY), ]
##D dat$person <- factor(dat$person)
##D dat.split <- with(dat, split(dat, list(person, time)))
##D 
##D wrds <- qcv(america, debt, dollar, people, tax, health)
##D lapply(dat.split, function(x) {
##D     word_cor(x[, "dialogue"], x[, "TOT"], wrds, r=NULL)
##D })
##D 
##D ## Supply a matrix (make sure to use `t` on a `wfm` matrix)
##D worlis <- list(
##D     pronouns = c("you", "it", "it's", "we", "i'm", "i"),
##D     negative = qcv(no, dumb, distrust, not, stinks),
##D     literacy = qcv(computer, talking, telling)
##D )
##D y <- wfdf(DATA$state, qdapTools::id(DATA, prefix = TRUE))
##D z <- wfm_combine(y, worlis)
##D 
##D out <- word_cor(t(z), word = c(names(worlis), "else.words"), r = NULL)
##D out
##D plot(out)
##D 
##D ## Additional plotting/viewing
##D require(tm)
##D data("crude")
##D 
##D out1 <- word_cor(t(as.wfm(crude)), word = "oil", r=.7)
##D vect2df(out1[[1]], "word", "cor")
##D 
##D plot(out1)
##D qheat(vect2df(out1[[1]], "word", "cor"), values=TRUE, high="red", 
##D     digits=2, order.by ="cor", plot=FALSE) + coord_flip()
##D 
##D 
##D out2 <- word_cor(t(as.wfm(crude)), word = c("oil", "country"), r=.7)
##D plot(out2)
## End(Not run)



