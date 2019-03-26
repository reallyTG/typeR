library(DCGL)


### Name: DCp
### Title: Identify DCGs (Differential Coexpressed Genes) based on the
###   'Differential Coexpression Profile'
### Aliases: DCp
### Keywords: DCGs DCLs

### ** Examples

data(exprs)

## calculate differential coexpressed genes by DCp without permutation
DCp(exprs[1:50,1:16],exprs[1:50,17:63],
	link.method='qth',cutoff=0.25,
	N=0)

## calculate differential coexpressed genes by DCp with 100 times permutation
DCp(exprs[1:50,1:16],exprs[1:50,17:63],
	link.method='qth',cutoff=0.25,
	N=100)



