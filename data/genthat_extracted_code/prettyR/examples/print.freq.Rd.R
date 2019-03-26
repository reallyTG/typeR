library(prettyR)


### Name: print.freq
### Title: Display frequency table(s)
### Aliases: print.freq
### Keywords: misc

### ** Examples

 test.df<-data.frame(A=c(sample(1:10,99,TRUE),NA),C=sample(LETTERS,100,TRUE))
 test.freq<-freq(test.df)
 print(test.freq,show.total=TRUE)



