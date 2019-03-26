library(ider)


### Name: pack
### Title: Intrinsic Dimension Estimation Using Packing Numbers.
### Aliases: pack

### ** Examples

x <- gendata(DataName='SwissRoll',n=300)
estpackG <- pack(x=x,greedy=TRUE)  ## estimate the packing number by greedy method
print(estpackG)
estpackC <- pack(x=x,greedy=FALSE) ## estimate the packing number by cluttering
print(estpackC)



