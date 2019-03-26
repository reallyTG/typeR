library(wfg)


### Name: wfg
### Title: Weighted Fast Greedy Algorithm
### Aliases: wfg

### ** Examples


##### implementation of wfg on a computer generated network with
##### structually relevant continuous attribute and irrelevant categorical attribute
set.seed(7)
##### set network properties
## four groups, each with 32 vertices
nv <- c(32,32,32,32)
l <- length(nv)
## obtain p.in and p.out from z.out
z.out <- 6
z.in <- 16-z.out
p.out <- z.out/96
p.in <- rep(z.in/31, l)

##### simulate network
net.simu <- network.simu(nv=nv, p.in=p.in, p.out=p.out, p.del=0)
net <- net.simu$net
group <- net.simu$group

##### simulate attributes
## separation of continuous attribute
delta <- 1
## p's for the multinomial distribution of categorical attributes
p1 <- 0.25
p2 <- (1-p1)/3
attr1 <- c(rnorm(nv[1],0), rnorm(nv[2],1*delta), rnorm(nv[3],2*delta), rnorm(nv[4],3*delta))
attr2 <- c(sample(c(1,2,3,4), size=nv[1], prob=c(p1, p2, p2, p2), replace=TRUE),
           sample(c(1,2,3,4), size=nv[2], prob=c(p2, p1, p2, p2), replace=TRUE),
           sample(c(1,2,3,4), size=nv[3], prob=c(p2, p2, p1, p2), replace=TRUE),
           sample(c(1,2,3,4), size=nv[4], prob=c(p2, p2, p2, p1), replace=TRUE))
attributes <- data.frame(attr1, attr2)

##### implementation of wfg
wfg.result <- wfg(net=net, attr=attributes, under.sample = FALSE, prioritize = TRUE)

##### plot network colored by wfg result
V(net)$size <- 7
V(net)$color <- wfg.result$memb
plot(net, vertex.label='')




