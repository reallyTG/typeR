library(ggRandomForests)


### Name: shift
### Title: lead function to shift by one (or more).
### Aliases: shift

### ** Examples

d<-data.frame(x=1:15) 
#generate lead variable
d$df_lead2<-ggRandomForests:::shift(d$x,2)
#generate lag variable
d$df_lag2<-ggRandomForests:::shift(d$x,-2)



