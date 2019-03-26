library(phylosim)


### Name: summary.ContinuousDeletor
### Title: Summarize the properties of an object
### Aliases: summary.ContinuousDeletor ContinuousDeletor.summary
###   summary,ContinuousDeletor-method

### ** Examples


      # create an object
      a<-ContinuousDeletor(rate=1,dist=expression(rnorm(1,mean=5,sd=3)), max.length=10)
      # get a summary
      summary(a)



