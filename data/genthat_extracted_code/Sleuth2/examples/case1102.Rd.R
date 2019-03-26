library(Sleuth2)


### Name: case1102
### Title: The Blood-Brain Barrier
### Aliases: case1102
### Keywords: datasets

### ** Examples

str(case1102)

plot(Brain/Liver ~ Time, case1102, log="xy", pch=ifelse(Treat=="BD", 19,21))
legend(10,0.1, pch=c(19,21), c("Saline control", "Barrier disruption"))



