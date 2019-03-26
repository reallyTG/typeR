library(quanteda)


### Name: data_corpus_dailnoconf1991
### Title: Confidence debate from 1991 Irish Parliament
### Aliases: data_corpus_dailnoconf1991
### Keywords: data

### ** Examples

## Not run: 
##D data_dfm_dailnoconf1991 <- dfm(data_corpus_dailnoconf1991, removePunct = TRUE)
##D fitted <- textmodel_mixfit(data_dfm_dailnoconf1991, 
##D                            c("Govt", "Opp", "Opp", rep(NA, 55)))
##D (pred <- predict(fitted))
##D tmpdf <- 
##D     data.frame(party = as.character(docvars(data_corpus_dailnoconf1991, "party")),
##D                govt = coef(pred)[,"Govt"],
##D                position = as.character(docvars(data_corpus_dailnoconf1991, "position")),
##D                stringsAsFactors = FALSE)
##D bymedian <- with(tmpdf, reorder(paste(party, position), govt, median))
##D par(mar = c(5, 6, 4, 2)+.1)
##D boxplot(govt ~ bymedian, data = tmpdf,
##D         horizontal = TRUE, las = 1,
##D         xlab = "Degree of support for government")
##D abline(h = 7.5, col = "red", lty = "dashed")
##D text(c(0.9, 0.9), c(8.5, 6.5), c("Goverment", "Opposition"))
## End(Not run)



