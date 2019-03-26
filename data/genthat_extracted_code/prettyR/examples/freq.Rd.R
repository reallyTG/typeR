library(prettyR)


### Name: freq
### Title: Calculate a frequency table
### Aliases: freq
### Keywords: misc

### ** Examples

 A<-sample(1:10,130,TRUE)
 A[sample(1:130,6)]<-NA
 C<-sample(LETTERS[1:14],130,TRUE)
 C[sample(1:130,7)]<-NA
 test.df<-data.frame(A,C)
 freq(test.df)



