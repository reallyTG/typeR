library(corpus)


### Name: stem_snowball
### Title: Snowball Stemmer
### Aliases: stem_snowball

### ** Examples

# apply english stemming algorithm; don't stem non-letter terms
stem_snowball(c("win", "winning", "winner", "#winning"))

# compare with SnowballC, which stems all kinds, not just letter
## Not run: SnowballC::wordStem(c("win", "winning", "winner", "#winning"), "en")



