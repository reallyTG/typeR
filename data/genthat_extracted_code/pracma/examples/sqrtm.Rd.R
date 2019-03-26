library(pracma)


### Name: sqrtm,rootm
### Title: Matrix Square and p-th Roots
### Aliases: sqrtm signm rootm
### Keywords: math

### ** Examples

A1 <- matrix(c(10,  7,  8,  7,
                7,  5,  6,  5,
                8,  6, 10,  9,
                7,  5,  9, 10), nrow = 4, ncol = 4, byrow = TRUE)

X <- sqrtm(A1)$B    # accuracy: 2.352583e-13
X 

A2 <- matrix(c(90.81, 8.33, 0.68, 0.06, 0.08, 0.02, 0.01, 0.01,
                0.70, 90.65, 7.79, 0.64, 0.06, 0.13, 0.02, 0.01,
                0.09, 2.27, 91.05, 5.52, 0.74, 0.26, 0.01, 0.06,
                0.02, 0.33, 5.95, 85.93, 5.30, 1.17, 1.12, 0.18,
                0.03, 0.14, 0.67, 7.73, 80.53, 8.84, 1.00, 1.06,
                0.01, 0.11, 0.24, 0.43, 6.48, 83.46, 4.07, 5.20,
                0.21, 0, 0.22, 1.30, 2.38, 11.24, 64.86, 19.79,
                0, 0, 0, 0, 0, 0, 0, 100
              ) / 100, nrow = 8, ncol = 8, byrow = TRUE)

X <- rootm(A2, 12)  # k = 6, accuracy: 2.208596e-14

##  Matrix sign function
signm(A1)                               # 4x4 identity matrix
B <- rbind(cbind(zeros(4,4), A1),
           cbind(eye(4), zeros(4,4)))
signm(B)                                # [0, signm(A1)$B; signm(A1)$Binv 0]



