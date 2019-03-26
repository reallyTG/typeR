library(dMod)


### Name: combine
### Title: Combine several data.frames by rowbind
### Aliases: combine

### ** Examples

data1 <- data.frame(Description = "reaction 1", Rate = "k1*A", A = -1, B = 1)
data2 <- data.frame(Description = "reaction 2", Rate = "k2*B", B = -1, C = 1)
combine(data1, data2)



