library(Jmisc)


### Name: shift
### Title: shift a vector by 'shift_by' unit
### Aliases: shift

### ** Examples

d<-data.frame(x=1:15)
#generate lead variable
d$df_lead2<-shift(d$x,2)
#generate lag variable
d$df_lag2<-shift(d$x,-2)



