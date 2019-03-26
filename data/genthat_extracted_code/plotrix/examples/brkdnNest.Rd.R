library(plotrix)


### Name: brkdnNest
### Title: Perform a nested breakdown of numeric values
### Aliases: brkdnNest
### Keywords: misc

### ** Examples

 brkdntest<-data.frame(Age=rnorm(100,25,10),
  Sex=factor(sample(c("M","F"),100,TRUE)),
  Marital=sample(c("M","X","S","W"),100,TRUE),
  Employ=sample(c("FT","PT","NO"),100,TRUE))
 brkdnNest(formula=Age~Sex+Marital+Employ,data=brkdntest)
 # show the proportion of unemployed with binomial confidence intervals
 brkdnNest(formula=Employ~Sex+Marital,data=brkdntest,
  FUN=c("propbrk","binciWu","binciWl"),trueval="NO")



