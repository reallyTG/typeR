library(depmix)


### Name: markovdata
### Title: Specifying Markov data objects
### Aliases: markovdata summary.md plot.md print.md plot.ts2 dname ntimes
###   itemtypes replicates ncov inames nitems ind
### Keywords: data

### ** Examples


x=rnorm(100,10,2)
y=ifelse(runif(100)<0.5,0,1)
z=matrix(c(x,y),100,2)
md=markovdata(z,itemtypes=c("cont","cat"))
summary(md)

data(speed)
summary(speed)
plot(speed,nind=2)

# split the data into three data sets 
# (to perform multi group analysis) 
r1=markovdata(dat=speed[1:168,],item=itemtypes(speed))
r2=markovdata(dat=speed[169:302,],item=itemtypes(speed))
r3=markovdata(dat=speed[303:439,],item=itemtypes(speed))
summary(r2)




