library(netmeta)


### Name: print.decomp.design
### Title: Print method for objects of class decomp.design
### Aliases: print.decomp.design
### Keywords: print

### ** Examples

data(Senn2013)

net1 <- netmeta(TE, seTE, treat1, treat2, studlab,
                data=Senn2013, sm="MD")
print(decomp.design(net1))



