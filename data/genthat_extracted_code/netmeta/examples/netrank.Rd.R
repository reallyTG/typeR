library(netmeta)


### Name: netrank
### Title: Frequentist method to rank treatments in network
### Aliases: netrank print.netrank
### Keywords: print

### ** Examples

data(Senn2013)

net1 <- netmeta(TE, seTE, treat1, treat2, studlab,
                data=Senn2013, sm="MD",
                comb.random=FALSE)
net2 <- netmeta(TE, seTE, treat1, treat2, studlab,
                data=Senn2013, sm="MD",
		comb.fixed=FALSE)
net3 <- netmeta(TE, seTE, treat1, treat2, studlab,
                data=Senn2013, sm="MD")

nr1 <- netrank(net1)
nr1
print(nr1, sort=FALSE)

nr2 <- netrank(net2)
nr2
print(nr2, sort=FALSE)

nr3 <- netrank(net3)
nr3
print(nr3, sort="fixed")
print(nr3, sort=FALSE)



