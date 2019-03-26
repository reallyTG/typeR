library(pairwiseCI)


### Name: Prop.test
### Title: Wrapper to prop.test(stats)
### Aliases: Prop.test
### Keywords: htest

### ** Examples



# If input is a data.frame:

set.seed(1234)

trials=rep(20,8)
success <- rbinom(n=8, size=trials,
 prob=c(0.2,0.2,0.2,0.2, 0.3,0.3,0.3,0.3))
failure <- trials-success

f<-as.factor(rep(c("group1", "group2"), each=4))

data<-data.frame(success=success, failure=failure, f=f)

g1<-subset(data, f=="group1")[,c("success","failure")]
g2<-subset(data, f=="group2")[,c("success","failure")]

g1
g2

# Prop.test calculates the columnwise sums and calls prop.test stats:

Prop.test(x=g1, y=g2)

# should be the same as:

CS1<-colSums(g1)
CS2<-colSums(g2)

CS1
CS2

prop.test(x=c(CS1[1], CS2[1]), n=c(sum(CS1), sum(CS2)))




