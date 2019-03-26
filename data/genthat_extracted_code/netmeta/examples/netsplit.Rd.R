library(netmeta)


### Name: netsplit
### Title: Split direct and indirect evidence in network meta-analysis
### Aliases: netsplit print.netsplit
### Keywords: Inconsistency

### ** Examples

data(Woods2010)
#
p1 <- pairwise(treatment, event=r, n=N,
               studlab=author, data=Woods2010, sm="OR")
#
net1 <- netmeta(p1)
#
print(netsplit(net1), digits=2)
print(netsplit(net1), digits=2,
      backtransf=FALSE, comb.fixed=FALSE)

data(Senn2013)
#
net2 <- netmeta(TE, seTE, treat1.long, treat2.long,
                studlab, data=Senn2013)
#
print(netsplit(net2), digits=2)
# Layout of Puhan et al. (2014), Table 1
print(netsplit(net2), digits=2, ci=TRUE, test=FALSE)

## Not run: 
##D data(Dong2013)
##D p3 <- pairwise(treatment, death, randomized, studlab = id,
##D                data = Dong2013, sm = "OR")
##D net3  <- netmetabin(p3)
##D netsplit(net3)
## End(Not run)



