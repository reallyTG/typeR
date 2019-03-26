library(Hmisc)


### Name: dataRep
### Title: Representativeness of Observations in a Data Set
### Aliases: dataRep print.dataRep predict.dataRep print.predict.dataRep
###   roundN [.roundN
### Keywords: datasets category cluster manip models

### ** Examples

set.seed(13)
num.symptoms <- sample(1:4, 1000,TRUE)
sex <- factor(sample(c('female','male'), 1000,TRUE))
x    <- runif(1000)
x[1] <- NA
table(num.symptoms, sex, .25*round(x/.25))


d <- dataRep(~ num.symptoms + sex + roundN(x,.25))
print(d, long=TRUE)


predict(d, data.frame(num.symptoms=1:3, sex=c('male','male','female'),
                      x=c(.03,.5,1.5)))



