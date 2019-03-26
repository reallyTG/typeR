library(pgdraw)


### Name: pgdraw.moments
### Title: Compute exact first and second moments for the Polya-Gamma
###   distribution, PG(b, c)
### Aliases: pgdraw.moments

### ** Examples

# -----------------------------------------------------------------
# Example: Simulated vs exact moments

u = matrix(1,1e6,1)
x = pgdraw(1,0.5*u)
mean(x)
var(x)
pgdraw.moments(1,0.5)

x = pgdraw(2,2*u)
mean(x)
var(x)
pgdraw.moments(2,2)





