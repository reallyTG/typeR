library(networktree)


### Name: workaholic
### Title: Workaholism and Psychiatric Symptoms
### Aliases: workaholic
### Keywords: datasets

### ** Examples

head(workaholic)
## No test: 

## Example networktree with OCI-R scale
data(workaholic)
nodeVars <- paste("OCIR",1:18,sep="")
splitVars <- c("Workaholism_diagnosis","Gender")
myTree<-networktree(workaholic[,nodeVars], workaholic[,splitVars])
myTree
plot(myTree)

## End(No test)




