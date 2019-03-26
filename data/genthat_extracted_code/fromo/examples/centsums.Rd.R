library(fromo)


### Name: cent_sums
### Title: Centered sums; join and unjoined.
### Aliases: cent_sums join_cent_sums unjoin_cent_sums

### ** Examples


 set.seed(1234)
 x1 <- rnorm(1e3,mean=1)
 x2 <- rnorm(1e3,mean=1)
 max_ord <- 6L
 rs1 <- cent_sums(x1,max_ord)
 rs2 <- cent_sums(x2,max_ord)
 rs3 <- cent_sums(c(x1,x2),max_ord)
 rs3alt <- join_cent_sums(rs1,rs2)
 stopifnot(max(abs(rs3 - rs3alt)) < 1e-7)
 rs1alt <- unjoin_cent_sums(rs3,rs2)
 rs2alt <- unjoin_cent_sums(rs3,rs1)
 stopifnot(max(abs(rs1 - rs1alt)) < 1e-7)
 stopifnot(max(abs(rs2 - rs2alt)) < 1e-7)




