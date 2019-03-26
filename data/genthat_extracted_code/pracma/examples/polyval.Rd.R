library(pracma)


### Name: polyval, polyvalm
### Title: Evaluating a Polynomial
### Aliases: polyval polyvalm
### Keywords: math

### ** Examples

  # Evaluate 3 x^2 + 2 x + 1 at x = 5, 7, and 9
  p = c(3, 2, 1);
  polyval(p, c(5, 7, 9))    # 86  162  262

  # Apply the characteristic polynomial to its matrix
  A <- pascal(4)
  p <- pracma::Poly(A)      # characteristic polynomial of A
  polyvalm(p, A)            # almost zero 4x4-matrix



