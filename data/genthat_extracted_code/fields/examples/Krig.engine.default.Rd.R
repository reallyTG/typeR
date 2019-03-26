library(fields)


### Name: The Engines:
### Title: Basic linear algebra utilities and other computations supporting
###   the Krig function.
### Aliases: Krig.engine.default Krig.engine.knots Krig.engine.fixed
###   Krig.coef Krig.check.xY Krig.cor.Y Krig.transform.xY Krig.make.u
###   Krig.make.W Krig.make.Wi %d*%
### Keywords: spatial

### ** Examples


Krig( ChicagoO3$x, ChicagoO3$y, theta=100)-> out

Krig.engine.default( out)-> stuff

# compare "stuff" to components in out$matrices

look1<- Krig.coef( out)
look1$c
# compare to out$c

look2<- Krig.coef( out, yM = ChicagoO3$y)
look2$c
# better be the same even though we pass as new data!




