library(HiCseg)


### Name: HiCseg-package
### Title: Analysis of HiC data
### Aliases: HiCseg-package HiCseg

### ** Examples

library(HiCseg)
data(matrix)
n=200
Kmax=10
res=HiCseg_linkC_R(n,Kmax,"G",matrix,"D")
print(res)



