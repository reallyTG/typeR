library(evclust)


### Name: plot.credpart
### Title: Plotting a credal partition
### Aliases: plot.credpart

### ** Examples

## Example with Four-class data
data("fourclass")
x<-fourclass[,1:2]
y<-fourclass[,3]
c=4
## Running k-EVCLUS with singletons
clus<-kevclus(x=x,k=100,c=c,type='simple')
## Plot the results
plot(clus,X=x,mfrow=c(2,2),ytrue=y)



