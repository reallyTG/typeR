library(DidacticBoost)


### Name: fitBoosted
### Title: Simple Gradient Boosting
### Aliases: fitBoosted

### ** Examples

k <- kyphosis
k$Kyphosis <- factor(ifelse(k$Kyphosis == "present", 1L, -1L))
fit <- fitBoosted(Kyphosis ~ Age + Number + Start, data = k, iterations = 10)




