library(netmeta)


### Name: netconnection
### Title: Get information on network connectivity (number of subnetworks,
###   distance matrix)
### Aliases: netconnection print.netconnection

### ** Examples

data(Senn2013)

nc1 <- netconnection(treat1, treat2, studlab, data = Senn2013)
nc1

# Extract number of (sub)networks
nc1$n.subnets

# Extract distance matrix
nc1$D.matrix

# Conduct network meta-analysis (results not shown)
net1 <- netmeta(TE, seTE, treat1, treat2, studlab, data = Senn2013)


#
# Artificial example with two subnetworks
#
t1 <- c("G", "B", "B", "D", "A", "F")
t2 <- c("B", "C", "E", "E", "H", "A")
#
nc2 <- netconnection(t1, t2)
nc2

# Number of subnetworks
nc2$n.subnets

# Extract distance matrix
nc2$D.matrix

# Conduct network meta-analysis
# (results in an error message due to unconnected network)
try(net2 <- netmeta(1:6, 1:6, t1, t2, 1:6))

# Conduct network meta-analysis on first subnetwork
net2.1 <- netmeta(1:6, 1:6, t1, t2, 1:6,
                  subset = (t1 %in% c("A", "F", "H") & t2 %in% c("A", "F", "H")))

# Conduct network meta-analysis on first subnetwork
net2.2 <- netmeta(1:6, 1:6, t1, t2, 1:6,
                  subset = !(t1 %in% c("A", "F", "H") & t2 %in% c("A", "F", "H")))

summary(net2.1)
summary(net2.2)



