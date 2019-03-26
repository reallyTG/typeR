library(R330)


### Name: rats.df
### Title: Rat growth data
### Aliases: rats.df
### Keywords: datasets

### ** Examples

data(rats.df)
group.vec<-as.numeric(rats.df$group)
# convert group from factor to vector
plot(growth~day,type="n",
data=rats.df,
xlab="days elapsed",
ylab="Weight (grams)",
main="Rat Growth rates")
for(i in (0:15)){
index<-(1:11) + i*11
lines(rats.df$day[index],rats.df$growth[index],
lty=group.vec[index[1]])
}
legend(45,400,paste("Group",1:3),lty=c(1,2,3))



