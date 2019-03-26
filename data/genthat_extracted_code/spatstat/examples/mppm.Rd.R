library(spatstat)


### Name: mppm
### Title: Fit Point Process Model to Several Point Patterns
### Aliases: mppm
### Keywords: spatial models

### ** Examples

# Waterstriders data
 H <- hyperframe(Y = waterstriders)
 mppm(Y ~ 1,  data=H)
 mppm(Y ~ 1,  data=H, Strauss(7))
 mppm(Y ~ id, data=H)
 mppm(Y ~ x,  data=H)

# Synthetic data from known model
n <- 10
H <- hyperframe(V=1:n,
                U=runif(n, min=-1, max=1),
                M=factor(letters[1 + (1:n) %% 3]))
H$Z <- setcov(square(1))
H$U <- with(H, as.im(U, as.rectangle(Z)))
H$Y <- with(H, rpoispp(eval.im(exp(2+3*Z))))

fit <- mppm(Y ~Z + U + V, data=H)



