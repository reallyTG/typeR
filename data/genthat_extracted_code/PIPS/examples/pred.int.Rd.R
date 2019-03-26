library(PIPS)


### Name: pred.int
### Title: Generates predicted intervals for predicted interval plots
### Aliases: pred.int

### ** Examples

# Make some fake data
myY<-c(rep(1,times=20),rep(0,times=80),rep(1,times=25),rep(0,times=25))
myGroup<-c(rep('A',100),rep('B',50))

# Run the programs
pips <- pred.int(y=myY, group=myGroup, N=c(200,100), 
                 data.type="binary", iters=100)
print(pips)
plot(pips)



