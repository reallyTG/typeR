library(nat)


### Name: reglist
### Title: A simple wrapper class for multiple transformations
### Aliases: reglist invert_reglist c.reglist

### ** Examples

I=diag(4)
S=I
diag(S)=c(1, 2, 3, 1)
rl=reglist(S, I)
rli=invert_reglist(rl)

## We can check the inversion by simplifying
m=simplify_reglist(rl)[[1]]
mi=simplify_reglist(rli)[[1]]
# NB solve will invert a homogeneous affine matrix
all.equal(m, solve(mi))
I=diag(4)
S=I
diag(S)=c(1, 2, 3, 1)
rl=reglist(S, I)
rl2=c(rl, 'path/to/my/reg.list')
rl3=c(reglist('path/to/my/reg.list'), rl)



