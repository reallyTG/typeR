library(tatest)


### Name: ttest
### Title: A modified t-test
### Aliases: ttest
### Keywords: t.test ttest

### ** Examples

# The following example is log10 transformed data	
YA<-c(4.1455383,	4.7186418,4.6483316)
YB<-c(6.9184465,	5.609667,6.5920944)
t.test(x=YA, y=YB)
ttest(YA,YB,alternative = "two.sided", LG = "NULL")
ttest(YA,YB,alternative = "two.sided", LG = "LOG2")
ttest(YA,YB,alternative = "two.sided", LG = "LOG10")



