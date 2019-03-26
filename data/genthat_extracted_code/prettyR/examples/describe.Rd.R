library(prettyR)


### Name: describe
### Title: Description of variables
### Aliases: describe
### Keywords: misc

### ** Examples

 sample.df<-data.frame(sex=sample(c("MALE","FEMALE"),100,TRUE),
  income=(rnorm(100)+2.5)*20000,suburb=factor(sample(1:4,100,TRUE)))
 # include the maximum values
 describe(sample.df,num.desc=c("mean","median","max","var","sd","valid.n"))
 # make up a function
 roughness<-function(x,na.rm=TRUE) {
  if(na.rm) x<-x[!is.na(x)]
  xspan<-diff(range(x))
  return(mean(abs(diff(x))/xspan,na.rm=TRUE))
 }
 # now use it
 describe(sample.df$income,num.desc="roughness",xname="income")



