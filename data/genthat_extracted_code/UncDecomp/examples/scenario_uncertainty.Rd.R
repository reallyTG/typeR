library(UncDecomp)


### Name: scenario_uncertainty
### Title: Scenario uncertainty
### Aliases: scenario_uncertainty

### ** Examples

stage1 <- LETTERS[1:3]
stage2 <- LETTERS[1:2]
stage3 <- LETTERS[1:4]
y <- rnorm(3*2*4)
data <- expand.grid(stage1=stage1,
                    stage2=stage2,
                    stage3=stage3)
data <- cbind(data, y)
scenario_uncertainty(data,"y", names(data)[-4])



