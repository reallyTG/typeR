library(TOSTER)


### Name: dataTOSTone
### Title: TOST One Sample T-Test
### Aliases: dataTOSTone

### ** Examples

library("TOSTER")

dataTOSTone(data=iris, vars="Sepal.Width", mu=3, low_eqbound=-0.3, high_eqbound=0.3,
            alpha=0.05, desc=TRUE, plots=TRUE)

TOSTone(m=3.05733, mu=3, sd=0.4358663, n=150, low_eqbound_d=-0.3, high_eqbound_d=0.3, alpha=0.05)




