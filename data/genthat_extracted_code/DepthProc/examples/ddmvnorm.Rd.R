library(DepthProc)


### Name: ddmvnorm
### Title: Normal depth versus depth plot
### Aliases: ddmvnorm ddMvnorm

### ** Examples

# EXAMPLE 1
norm <- mvrnorm(1000, c(0, 0, 0), diag(3))
con <- mvrnorm(100, c(1, 2, 5), 3 * diag(3))
sample <- rbind(norm, con)
ddMvnorm(sample, robust = TRUE)

# EXAMPLE 2
data(under5.mort, inf.mort, maesles.imm)
data1990 <- na.omit(cbind(under5.mort[, 1], inf.mort[, 1], maesles.imm[, 1]))
ddMvnorm(data1990, robust = FALSE)




