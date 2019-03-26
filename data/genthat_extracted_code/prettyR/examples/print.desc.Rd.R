library(prettyR)


### Name: print.desc
### Title: Display descriptive stats output
### Aliases: print.desc
### Keywords: misc

### ** Examples

 test.df<-data.frame(A=c(sample(1:10,99,TRUE),NA),C=sample(LETTERS,100,TRUE))
 test.desc<-describe(test.df)
 print(test.desc)



