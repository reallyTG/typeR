library(PlackettLuce)


### Name: itempar.PlackettLuce
### Title: Extract Item Parameters of Plackett-Luce Models
### Aliases: itempar.PlackettLuce

### ** Examples

R <- matrix(c(1, 2, 0, 0,
              4, 1, 2, 3,
              2, 1, 1, 1,
              1, 2, 3, 0,
              2, 1, 1, 0,
              1, 0, 3, 2), nrow = 6, byrow = TRUE)
colnames(R) <- c("apple", "banana", "orange", "pear")

mod <- PlackettLuce(R)
coef(mod)

# equivalent to default coefficients, i.e. log abilities
itempar(mod, ref= 1, log = TRUE)

# abilities, normalized so abilities for apple and pear sum to 1
itempar(mod, ref = 1:2)




