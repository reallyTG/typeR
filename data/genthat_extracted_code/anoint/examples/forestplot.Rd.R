library(anoint)


### Name: forest
### Title: Construct a forestplot from a 'anoint' object
### Aliases: forest

### ** Examples

data(simsolvd)

obj <- anoint(Surv(ttodthorchfhosp, censor==0)~(nyha+cardratio+current)*trt,data=simsolvd,
       		       family="coxph")

forest(obj)

grid.newpage()

forest(obj,x.axis=seq(0.7,1.5,by=.2))





