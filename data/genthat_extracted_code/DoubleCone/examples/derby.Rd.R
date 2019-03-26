library(DoubleCone)


### Name: derby
### Title: Kentucky Derby Winner Speed
### Aliases: derby
### Keywords: datasets

### ** Examples

data(derby)
n=length(derby$year)
track=1:n*0+1
track[derby$cond=="good"]=2
track[derby$cond=="fast"]=3
plot(derby$year,derby$speed,col=track)



