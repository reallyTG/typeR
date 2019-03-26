library(copula)


### Name: rnacModel
### Title: Random nacopula Model
### Aliases: rnacModel
### Keywords: distribution multivariate

### ** Examples

## Implicitly tests the function {with validity of outer_nacopula ..}
set.seed(11)
for(i in 1:40) {
  m1 <- rnacModel("Gumbel", d=sample(20:25, 1), pr.comp = 0.3,
		  rtau0 = function() 0.25)
  m2 <- rnacModel("Joe", d=3, pr.comp = 0.1, order="each")
  mC <- rnacModel("Clayton", d=20, pr.comp = 0.3,
		  rtau0 = function() runif(1, 0.1, 0.5))
  mF <- rnacModel("Frank", d=sample(20:25, 1), pr.comp = 0.3, order="seq")
}



