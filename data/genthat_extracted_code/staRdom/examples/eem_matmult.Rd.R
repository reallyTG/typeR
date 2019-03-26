library(staRdom)


### Name: eem_matmult
### Title: Multiply all EEMs with a matrix
### Aliases: eem_matmult

### ** Examples

## No test: 
data(eem_list)
eem <- eem_list[1:9]
class(eem) <- "eemlist"

ggeem(eem)

eem_list_cut <- eem_matmult(eem,matrix=c("l"), value= NA)
ggeem(eem_list_cut)
## End(No test)



