library(qdap)


### Name: pos
### Title: Parts of Speech Tagging
### Aliases: pos pos_by pos_tags
### Keywords: parts-of-speech

### ** Examples

## Not run: 
##D posdat <- pos(DATA$state)
##D ltruncdf(posdat, 7, 4)
##D ## str(posdat)
##D names(posdat)
##D posdat$text           #original text
##D 
##D ## Methods
##D preprocessed(posdat)  #words replaced with parts of speech
##D counts(posdat)        #frequency of parts of speech by row
##D proportions(posdat)   #proportion of parts of speech by row
##D 
##D ## Methods Plotting
##D plot(preprocessed(posdat))
##D plot(counts(posdat))
##D plot(proportions(posdat))
##D plot(posdat)
##D 
##D out1 <- pos(DATA$state, parallel = TRUE) # not always useful
##D ltruncdf(out1, 7, 4)
##D 
##D #use pos_tags to interpret part of speech tags used by pos & pos_by
##D pos_tags()[1:10, ]
##D pos_tags("matrix")[1:10, ]
##D pos_tags("dataframe")[1:10, ]
##D pos_tags("df")[1:10, ]
##D ltruncdf(pos_tags("all"), 3)
##D 
##D posbydat <- with(DATA, pos_by(state, sex))
##D names(posbydat)
##D 
##D ## Methods
##D scores(posbydat)   
##D preprocessed(posbydat)
##D counts(posbydat)     
##D proportions(posbydat)   
##D 
##D ## Methods Plotting
##D plot(preprocessed(posbydat))
##D plot(counts(posbydat))
##D plot(proportions(posbydat))
##D plot(posbydat)
##D 
##D ltruncdf(posbydat, 7, 4)
##D truncdf(posbydat$pos.by.prop, 4)
##D 
##D POSby <- with(DATA, pos_by(state, list(adult, sex)))
##D plot(POSby, values = TRUE, digits = 2)
##D #or more quickly - reuse the output from before
##D out2 <- with(DATA, pos_by(posbydat, list(adult, sex)))
##D 
##D ## Definite/Indefinite Noun 
##D ## 2 approached compared...
##D ## The later is more efficient but less accurate
##D 
##D ## ------------------------##
##D ## Part off speech tagging ##
##D ## ------------------------##
##D pos_after <- function(text.var, words, pos){
##D 
##D     posses <- strsplit(as.character(text.var[["POStagged"]][["POStagged"]]), "\\s+")
##D     namespos <- lapply(posses, function(x) {
##D         y <- unlist(strsplit(x, "/"))
##D         setNames(y[c(TRUE, FALSE)], y[c(FALSE, TRUE)])
##D     })
##D 
##D     lapply(namespos, function(x, thewords = words, thepos = pos){
##D         locs <- which(x %in% thewords)
##D         locs <- locs[!is.na(locs)]
##D 
##D         if (identical(unclass(locs), integer(0))) return(NA_character_)
##D 
##D         nounlocs <- which(names(x) %in% thepos)
##D 
##D         unname(x[unique(sapply(locs, function(x){ 
##D             min(nounlocs[nounlocs - x > 0])
##D         }))])
##D     })  
##D }
##D 
##D out2 <- setNames(lapply(list(a=c("a", "an"), the="the"), function(x) {
##D     o <- pos_after(rajPOS, x, c("NN", "NNS", "NNP", "NNPS"))
##D     m <- stats::setNames(data.frame(sort(table(unlist(o))), 
##D         stringsAsFactors = FALSE), c("word", "freq"))
##D     m[m$freq> 3, ]
##D }), c("a", "the"))
##D 
##D 
##D dat2 <- setNames(Reduce(function(x, y) {
##D     merge(x, y, by = "word", all = TRUE)}, out2), c("Word", "A", "THE"))
##D 
##D dat2 <- reshape2::melt(dat2, id="Word", variable.name="Article", value.name="freq")
##D 
##D dat2 <- dat2[order(dat2$freq, dat2$Word), ]
##D 
##D ord2 <- aggregate(freq ~ Word, dat2, sum)
##D 
##D dat2$Word <- factor(dat2$Word, levels=ord2[order(ord2[[2]]), 1])
##D rownames(dat2) <- NULL
##D ggplot(dat2, aes(x=freq, y=Word)) +
##D     geom_point()+ facet_grid(~Article) +
##D     ggtitle("Part Of Speech Parsing Approach")
##D 
##D dev.new()
##D 
##D ## --------------------##
##D ## Regular Expressions ##
##D ## --------------------##
##D 
##D library(qdapRegex);library(ggplot2);library(reshape2)
##D 
##D out <- setNames(lapply(c("@after_a", "@after_the"), function(x) {
##D     o <- rm_default(stringi:::stri_trans_tolower(raj$dialogue),
##D         pattern = x, extract=TRUE)
##D     m <- stats::setNames(data.frame(sort(table(unlist(o))), 
##D         stringsAsFactors = FALSE), c("word", "freq"))
##D     m[m$freq> 3, ]
##D }), c("a", "the"))
##D 
##D dat <- setNames(Reduce(function(x, y) {
##D     merge(x, y, by = "word", all = TRUE)}, out), c("Word", "A", "THE"))
##D 
##D dat <- reshape2::melt(dat, id="Word", variable.name="Article", value.name="freq")
##D 
##D dat <- dat[order(dat$freq, dat$Word), ]
##D 
##D ord <- aggregate(freq ~ Word, dat, sum)
##D 
##D dat$Word <- factor(dat$Word, levels=ord[order(ord[[2]]), 1])
##D rownames(dat) <- NULL
##D ggplot(dat, aes(x=freq, y=Word)) + 
##D     geom_point()+ facet_grid(~Article) + 
##D     ggtitle("Regex Approach")
## End(Not run)



