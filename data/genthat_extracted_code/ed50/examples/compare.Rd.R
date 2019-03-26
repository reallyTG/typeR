library(ed50)


### Name: compare
### Title: Compare ED50 Estimation of Independent Two-sample Case
### Aliases: compare

### ** Examples

library(ed50)
ans1 <- estimate(groupS$doseSequence, groupS$responseSequence, method = 'ModTurPoint')
ans2 <- estimate(groupSN$doseSequence, groupSN$responseSequence, method = 'Dixon-Mood')
compare(ans1, ans2)



