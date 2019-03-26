library(control)


### Name: TF
### Title: Evaluate Transfer function Expressions
### Aliases: TF

### ** Examples


# Example taken from the GitHub page of Julia Control - an electric motor example
J <- 2.0
b <- 0.04
K <- 1.0
R <- 0.08
L <- 1e-4
P <- TF("K/(s*((J*s + b)*(L*s + R) + K^2))")
Cls <- TF("P/(1 + P)") # closed-loop connection

# More examples
TF("s+1")
sys1 <- tf(1, c(1, 2, 5))
sys2 <- tf(2, c(1, 2, 5))
TF("sys1 + sys2") # parallel system interconnection
TF("sys1 * sys2") # series system interconnection
TF("sys1 - sys2")
TF("sys1 - 1")
TF("sys1 + 1")
TF("sys1 - sys2 + sys2")
TF("sys1 / sys2 / sys2")




