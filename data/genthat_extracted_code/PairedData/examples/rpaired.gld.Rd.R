library(PairedData)


### Name: rpaired.gld
### Title: Simulate paired samples
### Aliases: rpaired.gld

### ** Examples

rpaired.gld(n=30,r=0.5)

data(lambda.table)
p<-rpaired.gld(n=30,d1=lambda.table[7,],d2=lambda.table[7,],r=0.5)
plot(p)



