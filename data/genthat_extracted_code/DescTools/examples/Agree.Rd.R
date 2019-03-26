library(DescTools)


### Name: Agree
### Title: Raw Simple And Extended Percentage Agreement
### Aliases: Agree
### Keywords: univar

### ** Examples

categ <- c("V", "N", "P")
lvls  <- factor(categ, levels=categ)
rtr1  <- rep(lvls, c(60, 30, 10))
rtr2  <- rep(rep(lvls, nlevels(lvls)), c(53,5,2, 11,14,5, 1,6,3))
rtr3  <- rep(rep(lvls, nlevels(lvls)), c(48,8,3, 15,10,7, 3,4,2))

Agree(cbind(rtr1, rtr2))       # Simple percentage Agreement
Agree(data.frame(rtr1, rtr2))  # can be a data.frame
Agree(cbind(rtr1, rtr2, rtr3)) # Simple percentage Agreement

Agree(cbind(rtr1, rtr2), 1)    # Extended percentage Agreement



