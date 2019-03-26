library(phylosim)


### Name: summary.GeneralInDel
### Title: Summarize the properties of an object
### Aliases: summary.GeneralInDel GeneralInDel.summary
###   summary,GeneralInDel-method

### ** Examples


      # create an object
      a<-GeneralInDel(rate=1,propose.by=function(process){sample(c(1,2,3),1)})
      # get a summary
      summary(a)



