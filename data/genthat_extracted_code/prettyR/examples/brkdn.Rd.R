library(prettyR)


### Name: brkdn
### Title: Breakdown of a numeric variable by grouping variable(s)
### Aliases: brkdn
### Keywords: misc

### ** Examples

 test.df<-data.frame(Age=rnorm(100)+3*10,Sex=sample(c("M","F"),100,TRUE),
  Employ=sample(c("FT","PT","NO"),100,TRUE))
 # add value labels for Employ in alphabetical order so they match
 attr(test.df$Employ,"value.labels")<-c("Full time","None","Part time")
 brkdn(Age~Sex+Employ,test.df)



