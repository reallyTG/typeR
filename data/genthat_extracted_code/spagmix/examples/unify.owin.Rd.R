library(spagmix)


### Name: unify.owin
### Title: Spatial window unit rescaler
### Aliases: unify.owin

### ** Examples

W <- Window(chorley)
U <- unify.owin(W)

par(mfrow=c(1,2))
plot(W,axes=TRUE)
plot(U,axes=TRUE)



