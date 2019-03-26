library(epade)


### Name: correlogram.ade
### Title: Correlogram plot
### Aliases: correlogram.ade
### Keywords: correlation

### ** Examples

data<-rnorm(1000)
data<-as.data.frame(data)
for(i in 1:9){
eval(parse(text=paste("data$var_", i, "<- rnorm(1000)", sep='')))
eval(parse(text=paste("data$var_", i,
"[round(runif(round(runif(1, 1, 100)), 1, 1000))]<-NA", sep='')))
}
correlogram.ade(vars1=c('var_1', 'var_2', 'var_3', 'var_4', 'var_5'),
                vars2=c('var_6', 'var_7', 'var_8', 'var_9', 'var_3'),
                data=data)



