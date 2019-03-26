library(marima)


### Name: short.form
### Title: short.form
### Aliases: short.form

### ** Examples

Model<-define.model(kvar=4, ar=c(1, 2, 4), ma=c(1), reg.var=4)
short.form(Model$ar.pattern)
short.form(Model$ma.pattern)
short.form(Model$ar.pattern, leading=FALSE)
short.form(Model$ar.pattern, leading=FALSE)
#
M<-define.model(kvar=4, ma=c(1))
short.form(M$ar.pattern)
short.form(M$ar.pattern, tail=TRUE)
short.form(M$ar.pattern, leading=FALSE, tail=TRUE)




