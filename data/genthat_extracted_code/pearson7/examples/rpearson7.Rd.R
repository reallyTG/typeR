library(pearson7)


### Name: rpearson7
### Title: Generate random deviates from a Pearson VII distribution with
###   shape parameter 3/2.
### Aliases: rpearson7

### ** Examples


y = rpearson7(1000)
hist(y, prob = TRUE, breaks = 100, col = "gray")
curve(dpearson7(x), lwd = 2, col = "blue", add = TRUE)




