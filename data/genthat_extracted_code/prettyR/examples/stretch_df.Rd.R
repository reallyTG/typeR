library(prettyR)


### Name: stretch_df
### Title: Reshape a data frame from "long" to "wide" format
### Aliases: stretch_df
### Keywords: misc

### ** Examples

 # create a data frame with two repeated variables
 longdf<-data.frame(ID=c(rep(111,3),rep(222,4),rep(333,6),rep(444,3)),
  name=c(rep("Joe",3),rep("Bob",4),rep("Sue",6),rep("Bea",3)),
  score1=sample(1:10,16,TRUE),score2=sample(0:100,16),
  scoreorder=c(1,2,3,4,3,2,1,4,6,3,5,1,2,1,2,3))
 stretch_df(longdf,"ID",c("score1","score2"),"scoreorder")



