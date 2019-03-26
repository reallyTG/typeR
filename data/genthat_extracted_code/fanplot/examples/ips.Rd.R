library(fanplot)


### Name: ips
### Title: ONS International Passenger Survey Long-Term International
###   Migration 1975-2012
### Aliases: ips
### Keywords: datasets

### ** Examples

#standard plot
net<-ts(ips$net, start=1975)
plot(net, ylim=range(net-ips$net.ci, net+ips$net.ci))
lines(net+ips$net.ci, lty=2, col="red")
lines(net-ips$net.ci, lty=2, col="red")

#simulate values
ips.sim <- matrix(NA, nrow = 10000, ncol=length(net))
for (i in 1:length(net))
  ips.sim[, i] <- rnorm(10000, mean = ips$net[i], sd =ips$net.ci[i]/1.96)

#spaghetti plot
plot(net, ylim=range(net-ips$net.ci, net+ips$net.ci), type = "n")
fan(ips.sim, style="spaghetti", start=tsp(net)[1], n.spag=50)

#box plot
plot(net, ylim=range(net-ips$net.ci, net+ips$net.ci), type = "n")
fan(ips.sim, style="boxplot", start=tsp(net)[1], llab=TRUE, outline=FALSE)

#box fan
plot(net, ylim=range(net-ips$net.ci, net+ips$net.ci), type = "n")
fan(ips.sim, style="boxfan", type="interval", start=tsp(net)[1])



