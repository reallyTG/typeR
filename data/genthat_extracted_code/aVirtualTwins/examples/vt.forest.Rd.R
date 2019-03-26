library(aVirtualTwins)


### Name: vt.forest
### Title: Create forest to compute difft
### Aliases: vt.forest

### ** Examples


data(sepsis)
vt.o <- vt.data(sepsis, "survival", "THERAPY", T)
# inside model :
vt.f <- vt.forest("one", vt.o)
# ...
# your model :
# library(randomForest)
# rf <- randomForest(y = vt.o$getY(),
#                    x = vt.o$getX(int = T),
#                    mtry = 3,
#                    nodesize = 15)
# vt.f <- vt.forest("one", vt.o, model = rf)
# ...
# Can also use ... parameters
vt.f <- vt.forest("one", vt.o, mtry = 3, nodesize = 15)
# ...
   




