library(mets)


### Name: lifetable.matrix
### Title: Life table
### Aliases: lifetable.matrix lifetable lifetable.formula

### ** Examples

library(timereg)
data(TRACE)

d <- with(TRACE,lifetable(Surv(time,status==9)~sex+vf,breaks=c(0,0.2,0.5,8.5)))
summary(glm(events ~ offset(log(atrisk))+factor(int.end)*vf + sex*vf,
            data=d,poisson))



