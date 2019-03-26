library(rtrim)


### Name: summary.trim
### Title: Summary information for a TRIM job
### Aliases: summary.trim

### ** Examples


data(skylark)
z <- trim(count ~ site + time, data=skylark, model=2, overdisp=TRUE)

summary(z)



