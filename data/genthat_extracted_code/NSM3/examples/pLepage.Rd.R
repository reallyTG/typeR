library(NSM3)


### Name: pLepage
### Title: Lepage
### Aliases: pLepage
### Keywords: Lepage

### ** Examples

##Hollander-Wolfe-Chicken Example 5.3 Platelet Counts of Newborn Infants
platelet.counts<-list(x = c(120000, 124000, 215000, 90000, 67000, 95000, 
190000, 180000, 135000, 399000), y = c(12000, 20000, 112000, 
32000, 60000, 40000))

pLepage(platelet.counts)

##or equivalently,

pLepage(platelet.counts$x,platelet.counts$y)




