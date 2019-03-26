library(GWRM)


### Name: partvar
### Title: Partition of the variance in a GWRM model
### Aliases: partvar

### ** Examples

data(goals)
fit <- gw(goals ~ position, data = goals)
pos <- factor(c("Defender", "Midfielder"), levels = c("Defender", "Midfielder", "Forward"))
lev <- data.frame(position = pos, played = c(17, 21))

partvar(fit, newdata = lev)



