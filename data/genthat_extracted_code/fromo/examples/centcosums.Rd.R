library(fromo)


### Name: cent_cosums
### Title: Multivariate centered sums; join and unjoined.
### Aliases: cent_cosums cent_comoments join_cent_cosums unjoin_cent_cosums

### ** Examples


 set.seed(1234)
 x1 <- matrix(rnorm(1e3*5,mean=1),ncol=5)
 x2 <- matrix(rnorm(1e3*5,mean=1),ncol=5)
 max_ord <- 2L
 rs1 <- cent_cosums(x1,max_ord)
 rs2 <- cent_cosums(x2,max_ord)
 rs3 <- cent_cosums(rbind(x1,x2),max_ord)
 rs3alt <- join_cent_cosums(rs1,rs2)
 stopifnot(max(abs(rs3 - rs3alt)) < 1e-7)
 rs1alt <- unjoin_cent_cosums(rs3,rs2)
 rs2alt <- unjoin_cent_cosums(rs3,rs1)
 stopifnot(max(abs(rs1 - rs1alt)) < 1e-7)
 stopifnot(max(abs(rs2 - rs2alt)) < 1e-7)




