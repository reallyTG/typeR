
library(slam)
library(scs)

cat(rep("#", 80), "\n", "# SOCP - Test\n", rep("#", 80), "\n", sep = "")
A <- simple_triplet_matrix(i = 1:4, j = c(1L, 1L, 2L, 3L), v = c(1, -1, -1, -1), nrow = 4L, ncol = 3L)
rhs <- c(1.4142135623731, 0, 0, 0)
obj <- c(1, 1, 1)
cone <- list(f = 1L, l = 0L, q = 3L)

sol <- scs(A = A, b = rhs, obj = obj, cone = cone)
max(abs(sol$x - c(sqrt(2), -1, -1)))


cat(rep("#", 80), "\n", "# PSD - Test\n", rep("#", 80), "\n", sep = "")
A <- simple_triplet_matrix(
    i = c(1L, 2L, 3L, 4L, 5L, 7L, 8L, 9L, 1L, 2L, 3L, 5L, 6L, 7L, 8L, 9L, 1L, 
          2L, 3L, 4L, 5L, 6L, 7L, 8L, 9L),     
    j = c(1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 2L, 2L, 2L, 2L, 2L, 2L, 2L, 2L, 3L, 
          3L, 3L, 3L, 3L, 3L, 3L, 3L, 3L), 
    v = c(-7, -15.556349186104, 3, -21, -15.556349186104, 10, 11.3137084989848, 
          5, 7, -25.4558441227157, 8, 14.142135623731, 22.6274169979695, 
          -10, -14.142135623731, 3, -2, -11.3137084989848, 1, -5, 2.82842712474619,
          -24.0416305603426, -6, 11.3137084989848, 6), nrow = 9L, ncol = 3L)

rhs <- c(33, -12.7279220613579, 26, 14, 12.7279220613579, 56.5685424949238, 91, 14.142135623731, 15)
obj <- c(1, -1, 1)
cone <- list(f = 0L, l = 0L, s = c(2, 3))

sol <- scs(A = A, b = rhs, obj = obj, cone = cone)
max(abs(sol$x - c(-0.367666090041563, 1.89832827158511, -0.887550426343585)))
