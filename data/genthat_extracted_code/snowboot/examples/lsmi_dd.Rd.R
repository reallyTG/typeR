library(snowboot)


### Name: lsmi_dd
### Title: Network Degree Distribution Estimated from Labeled Snowball
###   Sample with Multiple Inclusion (LSMI)
### Aliases: lsmi_dd

### ** Examples

net <- artificial_networks[[1]]

#Obtain an LSMI sample and, at the next step,
#use it to estimate the degree distribution:
lsmiSample <- lsmi(net, n.seed = 5, n.wave = 3)
fkEstimate1 <- lsmi_dd(lsmiSample, net)$fk

#Obtain an LSMI sample and estimate the degree
#distribution in a single step:
fkEstimate2 <- lsmi_dd(net = net, n.seed = 5, n.wave = 3)$fk

#Use the output of lsmi_union to get the estimate:
lsmiUnionSample <- lsmi_union(net, n.seeds = c(5, 10), n.wave = 3)
fkEstimate3 <- lsmi_dd(lsmiUnionSample$lsmi_big, net)$fk




