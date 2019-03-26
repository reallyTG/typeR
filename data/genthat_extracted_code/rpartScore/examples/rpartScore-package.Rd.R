library(rpartScore)


### Name: rpartScore-package
### Title: Classification trees for ordinal responses
### Aliases: rpartScore-package
### Keywords: tree

### ** Examples

data("birthwt",package="MASS")

birthwt$Category.s <- ifelse(birthwt$bwt <= 2500, 3,
 	ifelse(birthwt$bwt <= 3000, 2,
 	ifelse(birthwt$bwt <= 3500, 1, 0)))

T.abs.mc <- rpartScore(Category.s ~ age + lwt + race + smoke +
 	ptl + ht + ui + ftv, data = birthwt)

plotcp(T.abs.mc)

T.abs.mc.pruned<-prune(T.abs.mc,cp=0.02)

plot(T.abs.mc.pruned)

text(T.abs.mc.pruned)
 
T.abs.mr <- rpartScore(Category.s ~ age + lwt + race + smoke +
 	ptl + ht + ui + ftv, data = birthwt, prune = "mr")

T.quad.mc <- rpartScore(Category.s ~ age + lwt + race + smoke + 
 	ptl + ht + ui + ftv, split = "quad", data = birthwt)

T.quad.mr <- rpartScore(Category.s ~ age + lwt + race + smoke + ptl + ht + 
 	ui + ftv, split = "quad", prune = "mr", data = birthwt)





