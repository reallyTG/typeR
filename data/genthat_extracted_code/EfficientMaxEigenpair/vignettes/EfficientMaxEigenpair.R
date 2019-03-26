## ---- eval = TRUE, echo = FALSE------------------------------------------
source("../R/eff.ini.maxeig.general.R")
source("../R/eff.ini.maxeig.tri.R")
source("../R/eff.ini.maxeig.shift.inv.tri.R")
source("../R/eff.ini.seceig.general.R")
source("../R/eff.ini.seceig.tri.R")
source("../R/ray.quot.tri.R")
source("../R/ray.quot.seceig.tri.R")
source("../R/ray.quot.general.R")
source("../R/ray.quot.seceig.general.R")
source("../R/shift.inv.tri.R")
source("../R/tri.sol.R")
source("../R/find_deltak.R")
source("../R/tridiag.R")

## ---- eval = FALSE, echo = TRUE------------------------------------------
#  require(EfficientMaxEigenpair)

## ---- echo=TRUE, results='hold', tidy=TRUE-------------------------------
# Define the dimension of matrix to be 100.
nn = 100

# Generate the corresponding tridiagonal matrix.
a = c(1:(nn - 1))^2
b = c(1:(nn - 1))^2
c = rep(0, length(a) + 1)
c[length(a) + 1] = nn^2

# Output the corresponding convergence maximal eigenpairs of the tridiagonal matrix.
eigenpair=eff.ini.maxeig.tri(a, b, c, xi = 7/8)

## ---- echo=TRUE, results='hold', tidy=TRUE-------------------------------
# The approximating sequence z_0, z_1, z_2 of the maximal eigenvalue.
eigenpair$z

## ---- eval = FALSE, echo=FALSE, results='hold', tidy=TRUE----------------
#  plot(eigenpair$v[[1]], type = "l", col = "black", ylab = "", xlab = "")
#  lines(-eigenpair$v[[2]], col = "blue")
#  lines(eigenpair$v[[3]], col = "red")
#  text(50, 0.5, labels = "v[0], -v[1], v[2] on {1,2,...,100}")
#  text(90, 0.05, labels = "v[0]", col = "black")
#  text(20, 0.05, labels = "-v[1] and v[2]", col = "black")

## ---- eval = FALSE, echo=FALSE, results='hold', tidy=TRUE----------------
#  plot(x = c(91:100), -eigenpair$v[[2]][91:100], type = "l", col = "blue", ylab = "", xlab = "")
#  lines(x = c(91:100), eigenpair$v[[3]][91:100], col = "red")
#  text(95.5, 0.0018, labels = "-v[1], v[2] on {91,92,...,100}")
#  text(91.5, 0.0017, labels = "-v[1]", col = "blue")
#  text(96, 0.0010, labels = "v[2]", col = "red")

## ---- eval = TRUE, echo=TRUE, results='hold', tidy=TRUE------------------
# Define the dimension of each matrix.
nn = c(100, 500, 1000, 5000)

zmat = matrix(0, length(nn), 4)
zmat[ ,1] = nn

for (i in 1:length(nn)) {
    # Generate the corresponding tridiagonal matrix for different dimensions.
    a = c(1:(nn[i] - 1))^2
    b = c(1:(nn[i] - 1))^2
    c = rep(0, length(a) + 1)
    c[length(a) + 1] = nn[i]^2

    # Output the corresponding dual case results, i.e,
    # the minimal eigenvalue of the tridiagonal matrix -Q with non-posivie off-diagonal elements.
    zmat[i, -1] = -eff.ini.maxeig.tri(a, b, c, xi = 7/8)$z[1:3]
}

colnames(zmat) = c("Dimension", "-z_0", "-z_1", "-z_2")
zmat
# The approximating sequence -z_0, -z_1, -z_2 of the maximal eigenvalue.

## ---- echo=TRUE, results='hold', tidy=TRUE-------------------------------
# Generate the general matrix A
A = matrix(c(1, 3, 9, 5, 2, 14, 10, 6, 0, 11, 11, 7, 0, 0, 1, 8),
    4, 4)
A

## ---- echo=TRUE, results='hold', tidy=TRUE-------------------------------
# Calculate the corresponding eigenvalues of matrix A
eigen(A)$values

## ---- echo=TRUE, results='hold', tidy=TRUE-------------------------------
# Calulate the approximating sequence of maximal eigenvalue by the Rayleigh quotient iteration.
eff.ini.maxeig.general(A, z0 = "Auto", digit.thresh = 4)$z

## ---- echo=TRUE, results='hold', tidy=TRUE-------------------------------
# Calulate the approximating sequence of maximal eigenvalue by the Rayleigh quotient iteration.
eff.ini.maxeig.general(A, xi = 0.65, digit.thresh = 4)$z

## ---- echo = TRUE, results='hold', tidy=TRUE-----------------------------
a = c(1:7)^2
b = c(1:7)^2
c = rep(0, length(a) + 1)
c[length(a) + 1] = 8^2
-eff.ini.maxeig.tri(a, b, c, xi = 1)$z

## ---- eval = FALSE, echo=TRUE, results='hold', tidy=TRUE-----------------
#  nn = c(100, 500, 1000, 5000, 7500, 10^4)
#  for (i in 1:6) {
#      a = c(1:(nn[i] - 1))^2
#      b = c(1:(nn[i] - 1))^2
#      c = rep(0, length(a) + 1)
#      c[length(a) + 1] = nn[i]^2
#  
#      print(-eff.ini.maxeig.tri(a, b, c, xi = 1)$z)
#      print(-eff.ini.maxeig.tri(a, b, c, xi = 7/8)$z)
#  }

## ---- eval = TRUE, echo=FALSE, results='hold', tidy=TRUE-----------------
print(c(0.348549, 0.376437, 0.376383))
print(c(0.387333, 0.376393, 0.376383))
print(c(0.310195, 0.338402, 0.338329))
print(c(0.349147, 0.338342, 0.338329))
print(c(0.299089, 0.327320, 0.327240))
print(c(0.338027, 0.327254, 0.327240))
print(c(0.281156, 0.308623, 0.308529))
print(c(0.319895, 0.308550, 0.308529))
print(c(0.277865, 0.305016, 0.304918))
print(c(0.316529, 0.304942, 0.304918))
print(c(0.275762, 0.302660, 0.302561))
print(c(0.314370, 0.302586, 0.302561))

## ---- eval = FALSE, echo=TRUE, results='hold', tidy=TRUE-----------------
#  nn = c(8, 100, 500, 1000, 5000, 7500, 10^4)
#  for (i in 1:7) {
#      a = c(1:(nn[i] - 1))^2
#      b = c(1:(nn[i] - 1))^2
#      c = rep(0, length(a) + 1)
#      c[length(a) + 1] = nn[i]^2
#  
#      print(-eff.ini.maxeig.shift.inv.tri(a, b, c, xi = 1)$z)
#  }

## ---- eval = TRUE, echo=FALSE, results='hold', tidy=TRUE-----------------
print(c(0.485985, 0.524150, 0.525267, 0.525268))
print(c(0.348549, 0.374848, 0.376378, 0.376383))
print(c(0.310195, 0.336860, 0.338320, 0.338329))
print(c(0.299089, 0.325735, 0.327229, 0.327240))
print(c(0.281156, 0.306874, 0.308514, 0.308529))
print(c(0.277865, 0.303213, 0.304903, 0.304918))
print(c(0.275762, 0.300821, 0.302545, 0.302561))

## ---- echo=TRUE, results='hold', tidy=TRUE-------------------------------
a = 14/100
b = 40/100
c = c(-25/100 - 40/100, -12/100 - 14/100)
eff.ini.maxeig.tri(a, b, c, xi = 1)$z
eff.ini.maxeig.tri(a, b, c, xi = 7/8)$z

## ---- echo=TRUE, results='hold', tidy=TRUE-------------------------------
eff.ini.maxeig.shift.inv.tri(a, b, c, xi = 1)$z
eff.ini.maxeig.shift.inv.tri(a, b, c, xi = 7/8)$z

## ---- echo=TRUE, results='hold', tidy=TRUE-------------------------------
a = c(sqrt(10), sqrt(130)/11)
b = c(11/sqrt(10), 20 * sqrt(130)/143)
c = c(-1 - 11/sqrt(10), -25/11 - sqrt(10) - 20 * sqrt(130)/143, -8/11 -
    sqrt(130)/11)
eff.ini.maxeig.tri(a, b, c, xi = 1, digit.thresh = 5)$z
eff.ini.maxeig.tri(a, b, c, xi = 7/8, digit.thresh = 5)$z

## ---- echo=TRUE, results='hold', tidy=TRUE-------------------------------
eff.ini.maxeig.shift.inv.tri(a, b, c, xi = 1, digit.thresh = 5)$z
eff.ini.maxeig.shift.inv.tri(a, b, c, xi = 7/8, digit.thresh = 5)$z

## ---- echo=TRUE, results='hold', tidy=TRUE-------------------------------
a = c(0.5142, 0.2115, 0.8442, 0.2347, 0.9837)
b = c(0.9962, 0.1111, 0.1405, 0.7595, 0.0781)
c = c(-2.334-0.9962, -2.6725-0.5142-0.1111, -2.263-0.2115-0.1405, -2.8457-0.8442-0.7595, -2.2257-0.2347-0.0781, -2.1582-0.9837)
eff.ini.maxeig.tri(a, b, c, xi = 1)$z

## ---- echo=TRUE, results='hold', tidy=TRUE-------------------------------
eff.ini.maxeig.shift.inv.tri(a, b, c, xi = 1)$z

## ---- echo=TRUE, results='hold', tidy=TRUE-------------------------------
A = matrix(c(1, 1, 3, 2, 2, 2, 3, 1, 1), 3, 3)
eff.ini.maxeig.general(A, v0_tilde = rep(1, dim(A)[1]), z0 = "fixed", digit.thresh = 5)$z

## ---- echo=TRUE, results='hold', tidy=TRUE-------------------------------
A = t(matrix(seq(1, 16), 4, 4))
eff.ini.maxeig.general(A, v0_tilde = rep(1, dim(A)[1]), z0 = "fixed", digit.thresh = 4)$z

## ---- echo=TRUE, results='hold', tidy=TRUE-------------------------------
A = matrix(c(1, 3, 9, 5, 2, 14, 10, 6, 0, 11, 11, 7, 0, 0, 1, 8),
    4, 4)
eff.ini.maxeig.general(A, v0_tilde = rep(1, dim(A)[1]), z0 = "fixed", digit.thresh = 4)$z

## ---- echo=TRUE, results='hold', tidy=TRUE-------------------------------
a = c(1:7)^2
b = c(1:7)^2
c = rep(0, length(a) + 1)
c[length(a) + 1] = 8^2

N = length(a)
Q = tridiag(b, a, -c(b[1] + c[1], a[1:N - 1] + b[2:N] + c[2:N], a[N] +
    c[N + 1]))

A = 113 * diag(1, (N + 1)) + Q

113 - eff.ini.maxeig.general(A, v0_tilde = rep(1, dim(A)[1]), z0 = "fixed")$z

## ---- echo=TRUE, results='hold', tidy=TRUE-------------------------------
A = matrix(c(1, 1, 3, 2, 2, 2, 3, 1, 1), 3, 3)
eff.ini.maxeig.general(A, v0_tilde = rep(1, dim(A)[1]), z0 = "Auto", digit.thresh = 5)$z

## ---- echo=TRUE, results='hold', tidy=TRUE-------------------------------
A = t(matrix(seq(1, 16), 4, 4))
eff.ini.maxeig.general(A, v0_tilde = rep(1, dim(A)[1]), z0 = "Auto", digit.thresh = 4)$z

## ---- echo=TRUE, results='hold', tidy=TRUE-------------------------------
A = matrix(c(1, 3, 9, 5, 2, 14, 10, 6, 0, 11, 11, 7, 0, 0, 1, 8),
    4, 4)
eff.ini.maxeig.general(A, v0_tilde = rep(1, dim(A)[1]), z0 = "Auto", digit.thresh = 4)$z

## ---- echo=TRUE, results='hold', tidy=TRUE-------------------------------
A = matrix(c(1, 3, 9, 5, 2, 14, 10, 6, 0, 11, 11, 7, 0, 0, 1, 8),
    4, 4)
S = (t(A) + A)/2
N = dim(S)[1]
a = diag(S[-1, -N])
b = diag(S[-N, -1])
c = rep(NA, N)
c[1] = -diag(S)[1] - b[1]
c[2:(N - 1)] = -diag(S)[2:(N - 1)] - b[2:(N - 1)] - a[1:(N - 2)]
c[N] = -diag(S)[N] - a[N - 1]

z0ini = eff.ini.maxeig.tri(a, b, c, xi = 7/8)$z[1]
z0ini
eff.ini.maxeig.general(A, v0_tilde = rep(1, dim(A)[1]), z0 = "numeric",
    z0numeric = 28 - z0ini, digit.thresh = 4)$z

## ---- echo=TRUE, results='hold', tidy=TRUE-------------------------------
A = matrix(c(1, 3, 9, 5, 2, 14, 10, 6, 0, 11, 11, 7, 0, 0, 1, 8),
    4, 4)
S = A
N = dim(S)[1]
a = diag(S[-1, -N])
b = diag(S[-N, -1])
c[1] = -diag(S)[1] - b[1]
c[2:(N - 1)] = -diag(S)[2:(N - 1)] - b[2:(N - 1)] - a[1:(N - 2)]
c[N] = -diag(S)[N] - a[N - 1]

z0ini = eff.ini.maxeig.tri(a, b, c, xi = 7/8)$z[1]
z0ini
eff.ini.maxeig.general(A, v0_tilde = rep(1, dim(A)[1]), z0 = "numeric",
    z0numeric = 31 - z0ini, digit.thresh = 4)$z

## ---- echo=TRUE, results='hold', tidy=TRUE-------------------------------
A = matrix(c(1, 1, 3, 2, 2, 2, 3, 1, 1), 3, 3)
eff.ini.maxeig.general(A, z0 = "Auto", digit.thresh = 5)$z
eff.ini.maxeig.general(A, xi = 1, digit.thresh = 5)$z
eff.ini.maxeig.general(A, xi = 1/3, digit.thresh = 5)$z
eff.ini.maxeig.general(A, xi = 0, digit.thresh = 5)$z

## ---- echo=TRUE, results='hold', tidy=TRUE-------------------------------
A = t(matrix(seq(1, 16), 4, 4))
eff.ini.maxeig.general(A, z0 = "Auto", digit.thresh = 4)$z
eff.ini.maxeig.general(A, xi = 1, digit.thresh = 4)$z
eff.ini.maxeig.general(A, xi = 1/3, digit.thresh = 4)$z
eff.ini.maxeig.general(A, xi = 0, digit.thresh = 4)$z

## ---- echo=TRUE, results='hold', tidy=TRUE-------------------------------
A = matrix(c(1, 3, 9, 5, 2, 14, 10, 6, 0, 11, 11, 7, 0, 0, 1, 8),
    4, 4)
eff.ini.maxeig.general(A, z0 = "Auto", digit.thresh = 4)$z
eff.ini.maxeig.general(A, xi = 1, digit.thresh = 4)$z
eff.ini.maxeig.general(A, xi = 0.65, digit.thresh = 4)$z
eff.ini.maxeig.general(A, xi = 0, digit.thresh = 4)$z

## ---- echo=TRUE, results='hold', tidy=TRUE-------------------------------
b4 = c(0.01, 1, 100)
digits = c(9, 7, 6)

for (i in 1:3) {
    A = matrix(c(-3, 4, 0, 10, 0, 2, -7, 5, 0, 0, 0, 3, -5, 0, 0,
        1, 0, 0, -16, 11, 0, 0, 0, 6, -11 - b4[i]), 5, 5)
    print(-eff.ini.maxeig.general(A, z0 = "Auto", digit.thresh = digits[i])$z)
}

## ---- echo=TRUE, results='hold', tidy=TRUE-------------------------------
b4 = c(0.01, 1, 100)
digits = c(9, 7, 6)

for (i in 1:3) {
    A = matrix(c(-5, 3, 0, 0, 0, 5, -7, 2, 0, 0, 0, 4, -3, 10, 0,
        0, 0, 1, -16, 11, 0, 0, 0, 6, -11 - b4[i]), 5, 5)
    print(-eff.ini.maxeig.general(A, z0 = "Auto", digit.thresh = digits[i])$z)
}

## ---- echo=TRUE, results='hold', tidy=TRUE-------------------------------
b4 = c(0.01, 1, 100)
a = c(3, 2, 10, 11)
b = c(5, 4, 1, 6)
b4 = c(0.01, 1, 100, 10^6)
digits = c(9, 7, 6, 6)

for (i in 1:4) {
    c = c(rep(0, 4), b4[i])
    print(-eff.ini.maxeig.tri(a, b, c, xi = 1, digit.thresh = digits[i])$z)
}

## ---- echo=TRUE, results='hold', tidy=TRUE-------------------------------
a = c(0.5142, 0.2115, 0.8442, 0.2347, 0.9837)
b = c(0.9962, 0.1111, 0.1405, 0.7595, 0.0781)
c = c(-2.334-0.9962, -2.6725-0.5142-0.1111, -2.263-0.2115-0.1405, -2.8457-0.8442-0.7595, -2.2257-0.2347-0.0781, -2.1582-0.9837)

N = length(a)
A = tridiag(b, a, -c(b[1] + c[1], a[1:N - 1] + b[2:N] + c[2:N], a[N] + c[N + 
        1]))
eff.ini.maxeig.general(A, xi = 1, digit.thresh = 5)$z
eff.ini.maxeig.general(A, xi = 0.18, digit.thresh = 5)$z
eff.ini.maxeig.general(A, xi = 0, digit.thresh = 5)$z

## ---- echo=TRUE, results='hold', tidy=TRUE-------------------------------
a = c(1:7)^2
b = c(1:7)^2

eff.ini.seceig.tri(a, b, xi = 0)$z
eff.ini.seceig.tri(a, b, xi = 1)$z
eff.ini.seceig.tri(a, b, xi = 2/5)$z

## ---- echo=TRUE, results='hold', tidy=TRUE-------------------------------
a = c(3, 2, 10, 11)
b = c(5, 4, 1, 6)

eff.ini.seceig.tri(a, b, xi = 0, digit.thresh = 5)$z
eff.ini.seceig.tri(a, b, xi = 1, digit.thresh = 5)$z
eff.ini.seceig.tri(a, b, xi = 2/5, digit.thresh = 5)$z

## ---- echo=TRUE, results='hold', tidy=TRUE-------------------------------
Q = matrix(c(-30, 1/5, 11/28, 55/3291, 30, -17, 275/42, 330/1097,
    0, 84/5, -20, 588/1097, 0, 0, 1097/84, -2809/3291), 4, 4)
eff.ini.seceig.general(Q, z0 = "Auto", digit.thresh = 5)$z
eff.ini.seceig.general(Q, z0 = "fixed", digit.thresh = 5)$z

## ---- echo=TRUE, results='hold', tidy=TRUE-------------------------------
Q = matrix(c(-57, 135/59, 243/91, 351/287, 118/27, -52, 590/91, 118/41,
    91/9, 637/59, -47, 195/41, 1148/27, 2296/59, 492/13, -62/7),
    4, 4)
eff.ini.seceig.general(Q, z0 = "Auto", digit.thresh = 4)$z
eff.ini.seceig.general(Q, z0 = "fixed", digit.thresh = 4)$z

