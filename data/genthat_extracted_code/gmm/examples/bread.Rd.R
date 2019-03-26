library(gmm)


### Name: bread
### Title: Bread for sandwiches
### Aliases: bread.gmm bread.gel bread.tsls

### ** Examples

# See \code{gmm} for more details on this example.
# With the identity matrix 
# bread is the inverse of (G'G)

n <- 1000
x <- rnorm(n, mean = 4, sd = 2)
g <- function(tet, x)
        {
        m1 <- (tet[1] - x)
        m2 <- (tet[2]^2 - (x - tet[1])^2)
        m3 <- x^3 - tet[1]*(tet[1]^2 + 3*tet[2]^2)
        f <- cbind(m1, m2, m3)
        return(f)
        }
Dg <- function(tet, x)
        {
        jacobian <- matrix(c( 1, 2*(-tet[1]+mean(x)), -3*tet[1]^2-3*tet[2]^2,0, 2*tet[2],
				-6*tet[1]*tet[2]), nrow=3,ncol=2)
        return(jacobian)
        }

res <- gmm(g, x, c(0, 0), grad = Dg,weightsMatrix=diag(3))
G <- Dg(res$coef, x)
bread(res)
solve(crossprod(G))



