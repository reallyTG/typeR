library(spcadjust)


### Name: SPCModelNonparCenterScale
### Title: Nonparametric Resampling with Centering and Scaling
### Aliases: SPCModelNonparCenterScale

### ** Examples

X <- rnorm(1000)

#CUSUM chart
model <- SPCModelNonparCenterScale(1)
chart <- new("SPCCUSUM",model=model)
SPCproperty(data=X,nrep=10,property="calARL",
            chart=chart,params=list(target=100))

#Shewhart chart
model <- SPCModelNonparCenterScale(0)
chart <- new("SPCCUSUM",model=model)
SPCproperty(data=X,nrep=10,property="calARL",
            chart=chart,params=list(target=100))



