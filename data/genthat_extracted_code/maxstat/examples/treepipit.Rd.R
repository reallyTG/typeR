library(maxstat)


### Name: treepipit
### Title: Tree Pipit Data
### Aliases: treepipit
### Keywords: datasets

### ** Examples


mod <- maxstat.test(counts ~ coverstorey, data = treepipit, 
                    smethod = "Data", pmethod = "HL", minprop = 0.2,
                    maxprop = 0.8)
print(mod)
plot(mod)



