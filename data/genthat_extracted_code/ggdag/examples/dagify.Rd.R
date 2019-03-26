library(ggdag)


### Name: dagify
### Title: Create a dagitty DAG using R-like syntax
### Aliases: dagify

### ** Examples


dagify(y ~ x + z, x~ z)

coords <- list(
    x = c(A = 1, B = 2, D = 3, C = 3, F = 3, E = 4, G = 5, H = 5, I = 5),
    y = c(A = 0, B = 0, D = 1, C = 0, F = -1, E = 0, G = 1, H = 0, I = -1)
    )

dag <- dagify(G ~~ H,
       G ~~ I,
       I ~~ G,
       H ~~ I,
       D ~ B,
       C ~ B,
       I ~ C + F,
       F ~ B,
       B ~ A,
       H ~ E,
       C ~ E + G,
       G ~ D, coords = coords)

dagitty::is.dagitty(dag)

ggdag(dag)

dag2 <- dagify(y ~ x + z2 + w2 + w1,
             x ~ z1 + w1,
             z1 ~ w1 + v,
             z2 ~ w2 + v,
             w1 ~~ w2,
             exposure = "x",
             outcome = "y")

ggdag(dag2)




