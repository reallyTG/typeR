library(copBasic)


### Name: convexCOP
### Title: Convex Combination of an Arbitrary Number of Copulas
### Aliases: convexCOP
### Keywords: copula composition copula composition (convex combination)

### ** Examples

# The copulas and parameters are named by sequence number appended to cop and para.
para1 <- list(cop1=GHcop, cop2=PLcop, para1=8, para2=.03, weights=c(.8,.2))
para2 <- list(cop1=GHcop, cop2=PLcop, para1=8, para2=.03, alpha=0.8)
H <- convexCOP( 0.6,0.4, para=para1)
G <- convex2COP(0.6,0.4, para=para2)
if( abs(H-G) <= 1e-6 )  message("They are equal.")

## Not run: 
##D # A convex combination of three copulas. A GHcop with strong positive association and
##D # a Plackett with strong negative association, and independence. The weights favor the
##D # GHcop but a little outlier and expansive spread is superimposed on the core trend.
##D para <- list(cop1=GHcop, cop2=PLcop, cop3=P,
##D              para1=8, para2=.03, para3=NA, weights=c(40,7,10))
##D UV <- simCOP(1000, cop=convexCOP, para=para, lwd=0.8) #
## End(Not run)



