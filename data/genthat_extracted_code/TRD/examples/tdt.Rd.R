library(TRD)


### Name: tdt
### Title: Compute TDT and adjusted TDT on case- and/or control-trios
### Aliases: tdt

### ** Examples

trios=rtrios(100000,500,0.1,0.2,0.3,1,0.5,0.5,0.1)
tdt(trios$case)
tdt(trios$ctrl)
tdt(rbind(trios$case,trios$ctrl))



