library(spanel)


### Name: hausman
### Title: Hausman test
### Aliases: hausman

### ** Examples

data(Produc)
data("usaww")
#fit the fixed function
fx<-span(log(gsp) ~ log(pcap) + log(pc) + log(emp) + unemp,Produc,usaww,n=48,t=17,model="fe")
# fit the random function
 ran<-span(log(gsp) ~ log(pcap) + log(pc) + log(emp) + unemp,Produc,usaww,n=48,t=17,model="re")
# the Hausman test
hausman(fx,ran)



