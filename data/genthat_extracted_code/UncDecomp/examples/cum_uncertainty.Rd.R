library(UncDecomp)


### Name: cum_uncertainty
### Title: Cumulative uncertainty
### Aliases: cum_uncertainty

### ** Examples

stage1 <- LETTERS[1:3]
stage2 <- LETTERS[1:2]
stage3 <- LETTERS[1:4]
y <- rnorm(3*2*4)
data <- expand.grid(stage1=stage1,
                    stage2=stage2,
                    stage3=stage3)
data <- cbind(data, y)
cum_uncertainty(data,"y", names(data)[-4])
cum_uncertainty(data,"y", names(data)[-4],drange)



