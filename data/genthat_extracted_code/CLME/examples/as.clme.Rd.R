library(CLME)


### Name: is.clme
### Title: Constructor method for objects S3 class clme
### Aliases: is.clme as.clme

### ** Examples

data( rat.blood )

cons <- list(order = "simple", decreasing = FALSE, node = 1 )
clme.out <- clme(mcv ~ time + temp + sex + (1|id), data = rat.blood , 
                 constraints = cons, seed = 42, nsim = 0)

is.clme( clme.out )
as.clme( clme.out )



