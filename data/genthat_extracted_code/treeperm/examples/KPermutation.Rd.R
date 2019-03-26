library(treeperm)


### Name: KPermutation
### Title: K Sample Exact Permutation Test
### Aliases: KPermutation print.KPermutation

### ** Examples

value<-c(0,190,0,0,10,0,0,0,0,0,0,110,0,0,52,0,8,0,50,0,0,137,965,110)
label<-as.factor(c(1,1,1,2,2,2,1,1,1,2,2,2,1,1,1,2,2,2,1,1,1,2,2,2))
print(KPermutation(value,label))
function (data, factor) 
{
    factor <- as.factor(factor)
    p <- .Call("calculate_K_pvalue", data, as.integer(factor))
    result <- list(Fstatistics = p[3], Permutations = p[2], pvalue = p[1])
    class(result) <- "KPermutation"
    result
  }



