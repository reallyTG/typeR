library(qdap)


### Name: kullback_leibler
### Title: Kullback Leibler Statistic
### Aliases: kullback_leibler
### Keywords: Kullback-Leibler

### ** Examples

## Not run: 
##D p.df <- wfdf(DATA$state, DATA$person)
##D p.mat <- wfm(text.var = DATA$state, grouping.var = DATA$person)
##D kullback_leibler(p.mat)
##D (x <- kullback_leibler(p.df))
##D print(x, digits = 5)
##D kullback_leibler(p.df$greg, p.df$sam)
##D 
##D ## p.df2 <- wfdf(raj$dialogue, raj$person)
##D ## x <- kullback_leibler(p.df2)
## End(Not run)



