library(Rcsdp)


### Name: csdp
### Title: Solve semidefinite program with CSDP
### Aliases: csdp
### Keywords: optimize

### ** Examples

  C <- list(matrix(c(2,1,
                     1,2),2,2,byrow=TRUE),
            matrix(c(3,0,1,
                     0,2,0,
                     1,0,3),3,3,byrow=TRUE),
            c(0,0))
A <- list(list(matrix(c(3,1,
                        1,3),2,2,byrow=TRUE),
               matrix(0,3,3),
               c(1,0)),
          list(matrix(0,2,2),
               matrix(c(3,0,1,
                        0,4,0,
                        1,0,5),3,3,byrow=TRUE),
               c(0,1)))

  b <- c(1,2)
  K <- list(type=c("s","s","l"),size=c(2,3,2))
  csdp(C,A,b,K)

# Manifold Unrolling broken stick example
# using simple triplet symmetric matrices
X <- matrix(c(-1,-1,
              0,0,
              1,-1),nc=2,byrow=TRUE);
d <- as.vector(dist(X)^2);
d <- d[-2]

C <- list(.simple_triplet_diag_sym_matrix(1,3))
A <- list(list(simple_triplet_sym_matrix(i=c(1,2,2),j=c(1,1,2),v=c(1,-1,1),n=3)),
          list(simple_triplet_sym_matrix(i=c(2,3,3),j=c(2,2,3),v=c(1,-1,1),n=3)),
          list(matrix(1,3,3)))

K <- list(type="s",size=3)
csdp(C,A,c(d,0),K)



