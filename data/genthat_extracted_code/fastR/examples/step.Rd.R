library(fastR)


### Name: step
### Title: Stepping experiment
### Aliases: step
### Keywords: datasets

### ** Examples


data(step)
xyplot(HR-restHR ~ freq, data=step, groups=height, type='a')
xyplot(HR-restHR ~ height, data=step, groups=freq, type='a')




