library(MapGAM)


### Name: optspan
### Title: Determine the Optimal Span Size for 'modgam'
### Aliases: optspan
### Keywords: misc smooth optimize

### ** Examples

## No test: 
data(MAdata)
optspan(data=MAdata, m="crude")

data(CAdata)
optspan(Surv(time,event)~AGE+factor(INS)+lo(X,Y), data=CAdata,
        spans=c(0.1,0.2,0.3),family="survival")
## End(No test)



