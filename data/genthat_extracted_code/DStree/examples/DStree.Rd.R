library(DStree)


### Name: DStree
### Title: Fit a discrete-time survival tree
### Aliases: DStree

### ** Examples

##Build tree
fit<- DStree(spell~ui+age+tenure+logwage,status="censor1",data=UnempDur,control=list(cp=0))
plot(fit)



