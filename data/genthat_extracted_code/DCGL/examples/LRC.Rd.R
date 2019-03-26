library(DCGL)


### Name: LRC
### Title: Identify DCGs (Differential Coexpressed genes) based on 'Log
###   Ratio Connections'
### Aliases: LRC
### Keywords: DCGs

### ** Examples

data(exprs)
LRC(exprs[1:100,1:16],exprs[1:100,17:63],link.method = 'qth', cutoff=0.25)



