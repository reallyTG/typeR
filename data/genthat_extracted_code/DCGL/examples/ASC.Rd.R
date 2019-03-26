library(DCGL)


### Name: ASC
### Title: Identify DCGs (Differential Coexpressed Genes) based on 'Average
###   Specific Connection'
### Aliases: ASC
### Keywords: DCGs

### ** Examples

data(exprs)
ASC(exprs[1:100,1:16],exprs[1:100,17:63],
	link.method = 'qth', cutoff=0.25)



