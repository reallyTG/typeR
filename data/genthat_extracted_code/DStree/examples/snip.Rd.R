library(DStree)


### Name: snip
### Title: Cost-complexity Pruning of a DStree Object
### Aliases: snip

### ** Examples

data(cost)
d.cost <- dis.cost(cost)

fit <- DStree(time~prevStroke+age+sex+alcohol+smoke,status="status",data=d.cost)

sfit<-snip(fit,cp=0.02)
plot(sfit) #plot smaller DStree object



