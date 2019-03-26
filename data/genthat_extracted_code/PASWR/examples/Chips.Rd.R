library(PASWR)


### Name: Chips
### Title: Silicon Chips
### Aliases: Chips
### Keywords: datasets

### ** Examples

par(mfrow=c(1,2))
with(data = Chips, qqnorm(techniqueI))
with(data = Chips, qqline(techniqueI))
with(data = Chips, qqnorm(techniqueII))
with(data = Chips, qqline(techniqueII))
par(mfrow=c(1,1))
# Trellis Approach
graph1 <- qqmath(~techniqueI, data = Chips, type=c("p","r"))
graph2 <- qqmath(~techniqueII, data = Chips, type=c("p","r"))
print(graph1, split=c(1, 1, 2, 1), more = TRUE)
print(graph2, split=c(2, 1, 2, 1), more = FALSE)
rm(graph1, graph2)



