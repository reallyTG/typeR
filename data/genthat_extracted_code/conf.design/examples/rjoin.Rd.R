library(conf.design)


### Name: rjoin
### Title: Concatenate designs by rows.
### Aliases: rjoin
### Keywords: design

### ** Examples

### A two replicate partially confounded factorial design.
d1 <- conf.design(c(A = 1, B = 1, C = 1), 2)
d2 <- conf.design(c(A = 0, B = 1, C = 1), 2)
dsn <- within(rjoin(d1, d2), {
   Blocks <- join(Part, Blocks)
   Part <- NULL
})
as.matrix(replications(~ .^2, dsn))
###          [,1]
### Blocks      4
### A           8
### B           8
### C           8
### Blocks:A    2
### Blocks:B    2
### Blocks:C    2
### A:B         4
### A:C         4
### B:C         4



