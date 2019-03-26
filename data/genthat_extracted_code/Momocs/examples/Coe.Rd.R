library(Momocs)


### Name: Coe
### Title: Coe "super" class
### Aliases: Coe

### ** Examples

# to see all methods for Coe objects.
methods(class='Coe')
# to see all methods for OutCoe objects.
methods(class='OutCoe') # same for OpnCoe, LdkCoe, TraCoe

bot.f<- efourier(bot, 12)
bot.f
class(bot.f)
inherits(bot.f, "Coe")

# if you want to work directly on the matrix of coefficients
bot.f$coe

#getters
bot.f[1]
bot.f[1:5]

#setters
bot.f[1] <- 1:48
bot.f[1]

bot.f[1:5] <- matrix(1:48, nrow=5, ncol=48, byrow=TRUE)
bot.f[1:5]

# An illustration of Momocs desing. See also browseVignettes("Momocs")
op <- opoly(olea, 5)
op
class(op)
op$coe # same thing

wp <- fgProcrustes(wings, tol=1e-4)
wp
class(wp) # for Ldk methods, LdkCoe objects can also be considered as Coo objects
# so you can apply all Ldk methods available.
wp$coe # Procrustes aligned coordinates




