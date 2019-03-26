library(evclust)


### Name: summary.credpart
### Title: Summary of a credal partition
### Aliases: summary.credpart

### ** Examples

## Example with Four-class data
data("fourclass")
x<-fourclass[,1:2]
y<-fourclass[,3]
c=4
## Running k-EVCLUS with singletons
clus<-kevclus(x=x,k=100,c=c,type='simple')
summary(clus)



