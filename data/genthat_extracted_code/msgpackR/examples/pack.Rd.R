library(msgpackR)


### Name: pack
### Title: serialize data to MessagePack format
### Aliases: pack
### Keywords: ~kwd1 ~kwd2

### ** Examples

pack(c(1,2,3))
#[1] 93 01 02 03
mat <- matrix(c(1:6), nrow=2); colnames(mat) <- c("A","B","C"); pack(mat);
#[1] 92 83 a1 41 01 a1 42 03 a1 43 05 83 a1 41 02 a1 42 04 a1 43 06



