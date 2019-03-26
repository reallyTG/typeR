library(DStree)


### Name: summary.DStree
### Title: Summarize a Fitted DStree Object
### Aliases: summary.DStree
### Keywords: tree

### ** Examples

data(UnempDur)
tree <- DStree(spell~ui+age+tenure+logwage,status="censor1",data=UnempDur)
summary(tree)




