library(FeedbackTS)


### Name: rain.feedback.stats
### Title: Statistics of rain feedback in Australia
### Aliases: rain.feedback.stats
### Keywords: datasets

### ** Examples

#### load data of feedback and change-in-feedback indices in 88 sites across Australia
data(rain.feedback.stats)

#### spatial coordinates of the 88 sites and corresponding feedback index 
#### computed from the whole data series
coord=rain.feedback.stats[,3:4]
stat1=rain.feedback.stats[["Feedback.whole.period"]]

#### map of feedback index 
map.statistic(coord,stat1,cex.circles=c(3,0.2),
   region=list(border='Australia',xlim=c(110,155)),
   legend=list(x=c(rep(114,3),rep(123,2)),y=-c(37,39.5,42,37,39.5),
      xtext=c(rep(114,3),rep(123,2))+1,ytext=-c(37,39.5,42,37,39.5),digits=2),
   main="Feedback")



