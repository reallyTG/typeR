library(ouch)


### Name: anolis.ssd
### Title: Greater Antillean anolis lizard sexual size dimorphism data.
### Aliases: anolis.ssd
### Keywords: models

### ** Examples

data(anolis.ssd)
tree <- with(anolis.ssd,ouchtree(node,ancestor,time/max(time),species))
plot(tree,node.names=TRUE)
print(h1 <- brown(anolis.ssd['log.SSD'],tree))
plot(h1)
print(h2 <- hansen(anolis.ssd['log.SSD'],tree,anolis.ssd['OU.1'],sqrt.alpha=1,sigma=1))
plot(h2)
print(h3 <- hansen(anolis.ssd['log.SSD'],tree,anolis.ssd['OU.7'],sqrt.alpha=1,sigma=1))
plot(h3)



