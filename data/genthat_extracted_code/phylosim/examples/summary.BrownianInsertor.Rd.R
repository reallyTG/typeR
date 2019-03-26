library(phylosim)


### Name: summary.BrownianInsertor
### Title: Summarize the properties of an object
### Aliases: summary.BrownianInsertor BrownianInsertor.summary
###   summary,BrownianInsertor-method

### ** Examples


       # create an object
	p<-BrownianInsertor(
                       type="discrete",
                       scale=0.05,
                       sizes=1:4,
                       probs=c(3/6,1/6,1/6,1/6),
                       rate=0.05
                       )
       # get a summary
       summary(p)
 


