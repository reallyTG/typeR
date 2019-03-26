library(rlfsm)


### Name: h_kr
### Title: Function h_kr
### Aliases: h_kr

### ** Examples

#### Plot h_kr ####
s<-seq(0,10, by=0.01)
h_val<-sapply(s,h_kr, k=5, r=1, H=0.3, alpha=1)
plot(s,h_val)



