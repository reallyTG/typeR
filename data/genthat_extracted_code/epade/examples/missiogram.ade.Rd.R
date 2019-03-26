library(epade)


### Name: missiogram.ade
### Title: Missing Value Plot
### Aliases: missiogram.ade
### Keywords: missings

### ** Examples

data<-rnorm(1000)
data<-as.data.frame(data)
for(i in 1:20){
eval(parse(text=paste("data$var_", i, "<- rnorm(1000)", sep='')))
eval(parse(text=paste("data$var_", i,
"[round(runif(round(runif(1, 1, 100)), 1, 1000))]<-NA", sep='')))
}
missiogram.ade(data=data)



