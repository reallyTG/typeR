library(plotrix)


### Name: makeDendrite
### Title: Build a list of the mutually exclusive attributes of objects
### Aliases: makeDendrite
### Keywords: misc

### ** Examples

 sex<-sample(c("M","F"),100,TRUE)
 hair<-sample(c("Blond","Black","Brown","Red"),100,TRUE)
 eye<-sample(c("Blue","Black","Brown","Green"),100,TRUE)
 charac<-data.frame(sex=sex,hair=hair,eye=eye)
 characlist<-makeDendrite(charac)
 characlist



