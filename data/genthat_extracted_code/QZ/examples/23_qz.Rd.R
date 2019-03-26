library(QZ)


### Name: QZ Decomposition
### Title: QZ Decomposition
### Aliases: qz
### Keywords: programming

### ** Examples

library(QZ, quiet = TRUE)

### http://www.nag.com/lapack-ex/node124.html
(ret <- qz(exAB1$A, exAB1$B))

### http://www.nag.com/lapack-ex/node119.html
(ret <- qz(exAB2$A, exAB2$B))

### http://www.nag.com/lapack-ex/node94.html
(ret <- qz(exA1$A))

### http://www.nag.com/lapack-ex/node89.html
(ret <- qz(exA2$A))

# Reordering eigenvalues
select1 <- c(TRUE, FALSE, FALSE, TRUE)
select2 <- c(FALSE, TRUE, TRUE, FALSE)
(ret <- qz(exAB1$A, exAB1$B, select = select1))
(ret <- qz(exAB2$A, exAB2$B, select = select2))
(ret <- qz(exA1$A, select = select1))
(ret <- qz(exA2$A, select = select1))



