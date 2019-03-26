library(caroline)


### Name: volins
### Title: Plot a Series of Vioplot Violins
### Aliases: violins

### ** Examples


n <- rnorm(130, 10, 3)
p <- rpois(110, 4)
u <- runif(300, 0, 20)
l <- rlnorm(130, log(2))
g <- rgamma(140, 3)
e <- rexp(160)

violins(list(e=e, p=p,u=u,n=n,l=l,g=g), ylim=c(0,20),
         col=c('purple','lightblue','lightgreen','red','orange','yellow'),
         stats=TRUE)



