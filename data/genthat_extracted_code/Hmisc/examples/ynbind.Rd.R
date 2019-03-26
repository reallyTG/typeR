library(Hmisc)


### Name: ynbind
### Title: Combine Variables in a Matrix
### Aliases: ynbind [.ynbind pBlock [.pBlock
### Keywords: misc utilities

### ** Examples

x1 <- c('yEs', 'no', 'UNKNOWN', NA)
x2 <- c('y', 'n', 'no', 'present')
label(x2) <- 'X2'
X <- ynbind(x1, x2, label='x1-2')
X[1:3,]

pBlock(x1, x2, subset=2:3, label='x1-2')



