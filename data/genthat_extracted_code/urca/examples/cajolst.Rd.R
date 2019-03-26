library(urca)


### Name: cajolst
### Title: Testing Cointegrating Rank with Level Shift at Unknown time
### Aliases: cajolst
### Keywords: regression

### ** Examples

data(denmark)
sjd <- denmark[, c("LRM", "LRY", "IBO", "IDE")]
sjd.lst <- cajolst(sjd, trend=TRUE, K=2, season=4)
summary(sjd.lst)



