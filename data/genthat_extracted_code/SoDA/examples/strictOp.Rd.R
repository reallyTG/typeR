library(SoDA)


### Name: strictOp
### Title: Apply strict conditions to R operators
### Aliases: strictOp withStrictOps
### Keywords: programming

### ** Examples

sum(rnorm(3) ==  as.raw(1:3))# succeeds but comparison is ambiguous
muststop(withStrictOps(sum(rnorm(3) ==  as.raw(1:3))),
          silent = FALSE)  # signals an error




