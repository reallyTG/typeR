library(pracma)


### Name: normest
### Title: Estimated Matrix Norm
### Aliases: normest normest2
### Keywords: array

### ** Examples

normest(magic(5)) == max(svd(magic(5))$d)  # TRUE
normest(magic(100))                        # 500050



