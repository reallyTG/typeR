library(entropart)


### Name: rCommunity
### Title: Random Communities
### Aliases: rCommunity

### ** Examples

# Generate communities made of 100000 individuals among 300 species and fit them
par(mfrow = c(2,2))
for (d in c("lnorm", "lseries", "geom", "bstick")) {  
rCommunity(n = 1, size = 1E5, S = 300, Distribution = d) -> AbdVec
plot(AbdVec, Distribution = d, main = d)
}



