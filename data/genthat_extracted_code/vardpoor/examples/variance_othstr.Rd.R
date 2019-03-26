library(vardpoor)


### Name: variance_othstr
### Title: Variance estimation for sample surveys by the new stratification
### Aliases: variance_othstr
### Keywords: vardpoor

### ** Examples

period=NULL
dataset=NULL
Y <- data.table(matrix(runif(50) * 5, ncol = 5))

H <- data.table(H = as.integer(trunc(5 * runif(10))))
H2 <- data.table(H2 = as.integer(trunc(3 * runif(10))))

N_h <- data.table(matrix(0 : 4, 5, 1))
setnames(N_h, names(N_h), "H")
N_h[, sk:= 10]

N_h2 <- data.table(matrix(0 : 2, 3, 1))
setnames(N_h2, names(N_h2), "H2")
N_h2[, sk2:= 4]

w_final <- rep(2, 10)

vo <- variance_othstr(Y = Y, H = H, H2 = H2,
                      w_final = w_final,
                      N_h = N_h, N_h2 = N_h2,
                      period = NULL,
                      dataset = NULL)
vo



