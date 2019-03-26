library(EloChoice)


### Name: reliability
### Title: calculate reliability-index
### Aliases: reliability

### ** Examples

# create data set and calculate ratings (with five randomizations)
xdata <- randompairs(12, 500)
x <- elochoice(xdata$winner, xdata$loser, runs=5)
# extract the reliability values
(u <- reliability(x))
# calculate average reliability index
mean(u$upset)
# and in its weighted form
mean(u$upset.wgt)



