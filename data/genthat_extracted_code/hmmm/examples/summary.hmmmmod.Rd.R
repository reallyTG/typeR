library(hmmm)


### Name: summary.hmmmmod
### Title: summary and print for the class hmmmmod
### Aliases: summary.hmmmmod print.hmmmmod
### Keywords: package

### ** Examples

marginals<-marg.list(c("g-m","m-l","g-l"),mflag="m")
model<-hmmm.model(marg=marginals,lev=c(3,7),names=c("A","B"))
summary(model) # or print(model)


