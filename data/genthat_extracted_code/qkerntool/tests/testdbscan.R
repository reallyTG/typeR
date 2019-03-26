set.seed(665544)
n <- 600
x <- cbind(runif(10, 0, 10)+rnorm(n, sd=0.2), runif(10, 0, 10)+rnorm(n, sd=0.2))

ds <- qkdbscan(x,kernel = "rbfbase", qpar = list(sigma = 0.64, q=0.8), eps = 0.15, MinPts = 5, hybrid = FALSE)
plot(ds, x)

ds = qkdbscan(x, kernel = "nonlbase", qpar = list(alpha=0.097,q=0.8),eps = 0.14, MinPts=5,hybrid = FALSE)
plot(ds, x)

ds = qkdbscan(x, kernel = "laplbase", qpar = list(sigma=2.15,q=0.8),eps = 0.14, MinPts=5,hybrid = FALSE)
plot(ds, x)

ds = qkdbscan(x, kernel = "ratibase", qpar = list(c=0.54,q=0.8),eps = 0.15, MinPts=5,hybrid = FALSE)
plot(ds, x)

ds = qkdbscan(x, kernel = "multbase", qpar = list(c=0.231,q=0.8),eps = 0.15, MinPts=5,hybrid = FALSE)
plot(ds, x)

ds = qkdbscan(x, kernel = "invbase", qpar = list(c=0.73,q=0.8),eps = 0.15, MinPts=5,hybrid = FALSE)
plot(ds, x)

ds = qkdbscan(x, kernel = "wavbase", qpar = list(theta=0.355,q=0.8),eps = 0.15, MinPts=5,hybrid = FALSE)
plot(ds, x)

ds = qkdbscan(x, kernel = "powbase", qpar = list(d=1.35,q=0.9),eps = 0.2, MinPts=5,hybrid = FALSE)
plot(ds, x)

ds = qkdbscan(x, kernel = "logbase", qpar = list(d=1.57,q=0.8),eps = 0.15, MinPts=5,hybrid = FALSE)
plot(ds, x)

ds = qkdbscan(x, kernel = "caubase", qpar = list(sigma=0.54,q=0.8),eps = 0.15, MinPts=5,hybrid = FALSE)
plot(ds, x)

ds = qkdbscan(x, kernel = "chibase", qpar = list(gamma=9.5,q=0.8),eps = 0.15, MinPts=10,hybrid = FALSE)
plot(ds, x)

ds = qkdbscan(x, kernel = "studbase", qpar = list(d=1.28,q=0.9),eps = 0.2, MinPts=5,hybrid = FALSE)

ds = qkdbscan(x, kernel = "nonlcnd", qpar = list(alpha=0.03),eps = 0.15, MinPts=5,hybrid = FALSE)
plot(ds, x)

ds = qkdbscan(x, kernel = "polycnd", qpar = list(d = 2, alpha = 0.1529, c = 1),eps = 0.2, MinPts=5,hybrid = FALSE)
plot(ds, x)

ds = qkdbscan(x, kernel = "rbfcnd", qpar = list(gamma = 0.47),eps = 0.15, MinPts=6,hybrid = FALSE)
plot(ds, x)

ds = qkdbscan(x, kernel = "laplcnd", qpar = list(gamma = 1.8),eps = 0.15, MinPts=7,hybrid = FALSE)
plot(ds, x)

ds = qkdbscan(x, kernel = "anocnd", qpar = list(d = 1.9, sigma = 10.5),eps = 0.2, MinPts=4,hybrid = FALSE)
plot(ds, x)

ds = qkdbscan(x, kernel = "raticnd", qpar = list(c = 0.6),eps = 0.15, MinPts=10,hybrid = FALSE)
plot(ds, x)

ds = qkdbscan(x, kernel = "multcnd", qpar = list(c = 0.21),eps = 0.15, MinPts=5,hybrid = FALSE)
plot(ds, x)

ds = qkdbscan(x, kernel = "invcnd", qpar = list(c = 0.63),eps = 0.15, MinPts=5,hybrid = FALSE)
plot(ds, x)

ds = qkdbscan(x, kernel = "wavcnd", qpar = list(theta = 0.339),eps = 0.12, MinPts=6,hybrid = FALSE)
plot(ds, x)

ds = qkdbscan(x, kernel = "powcnd", qpar = list(d = 1.4),eps = 0.18, MinPts=5,hybrid = FALSE)
plot(ds, x)

ds = qkdbscan(x, kernel = "logcnd", qpar = list(d = 1.33),eps = 0.18, MinPts=5,hybrid = FALSE)
plot(ds, x)

ds = qkdbscan(x, kernel = "caucnd", qpar = list(gamma = 0.49),eps = 0.15, MinPts=5,hybrid = FALSE)
plot(ds, x)

ds = qkdbscan(x, kernel = "chicnd", qpar = list(),eps = 0.022, MinPts=6,hybrid = FALSE)
plot(ds, x)

ds = qkdbscan(x, kernel = "studcnd", qpar = list(d = 1.233),eps = 0.18, MinPts=7,hybrid = FALSE)
plot(ds, x)


qkfun1 <- rbfbase(sigma = 0.64, q=0.8)
Ktrain1 <- qkernmatrix(qkfun1, x)
View(Ktrain1@.Data)

predict(ds)
predict(ds,matrix(c(1.5,9.3),nrow = 1))


###########################################################################################
qkfunc <- rbfbase(sigma = 0.64, q=0.8)
Ktrain1 <- qkernmatrix(qkfunc, x)
ds3 <- qkdbscan(Ktrain1,eps = 0.15, MinPts = 5, hybrid = FALSE)
plot(ds3, x)



qkfunc <- nonlbase(alpha=0.097,q=0.8)
Ktrain1 <- qkernmatrix(qkfunc, x)
ds3 <- qkdbscan(Ktrain1,eps = 0.14, MinPts = 5, hybrid = FALSE)
plot(ds3, x)



qkfunc <- laplbase(sigma=2.15,q=0.8)
Ktrain1 <- qkernmatrix(qkfunc, x)
ds3 <- qkdbscan(Ktrain1,eps = 0.15, MinPts = 5, hybrid = FALSE)
plot(ds3, x)



qkfunc <- ratibase(c=0.54,q=0.8)
Ktrain1 <- qkernmatrix(qkfunc, x)
ds3 <- qkdbscan(Ktrain1,eps = 0.15, MinPts = 5, hybrid = FALSE)
plot(ds3, x)



qkfunc <- multbase(c=0.231,q=0.8)
Ktrain1 <- qkernmatrix(qkfunc, x)
ds3 <- qkdbscan(Ktrain1,eps = 0.15, MinPts = 5, hybrid = FALSE)
plot(ds3, x)



qkfunc <- invbase(c=0.73,q=0.8)
Ktrain1 <- qkernmatrix(qkfunc, x)
ds3 <- qkdbscan(Ktrain1,eps = 0.15, MinPts = 5, hybrid = FALSE)
plot(ds3, x)



qkfunc <- wavbase(theta=0.355,q=0.8)
Ktrain1 <- qkernmatrix(qkfunc, x)
ds3 <- qkdbscan(Ktrain1,eps = 0.15, MinPts = 5, hybrid = FALSE)
plot(ds3, x)



qkfunc <- powbase(d=1.35,q=0.9)
Ktrain1 <- qkernmatrix(qkfunc, x)
ds3 <- qkdbscan(Ktrain1,eps = 0.2, MinPts = 5, hybrid = FALSE)
plot(ds3, x)



qkfunc <- logbase(d=1.57,q=0.8)
Ktrain1 <- qkernmatrix(qkfunc, x)
ds3 <- qkdbscan(Ktrain1,eps = 0.15, MinPts = 5, hybrid = FALSE)
plot(ds3, x)



qkfunc <- caubase(sigma=0.54,q=0.8)
Ktrain1 <- qkernmatrix(qkfunc, x)
ds3 <- qkdbscan(Ktrain1,eps = 0.15, MinPts = 5, hybrid = FALSE)
plot(ds3, x)



qkfunc <- chibase(gamma=9.5,q=0.8)
Ktrain1 <- qkernmatrix(qkfunc, x)
ds3 <- qkdbscan(Ktrain1,eps = 0.15, MinPts = 10, hybrid = FALSE)
plot(ds3, x)



qkfunc <- studbase(d=1.28,q=0.9)
Ktrain1 <- qkernmatrix(qkfunc, x)
ds3 <- qkdbscan(Ktrain1,eps = 0.2, MinPts = 5, hybrid = FALSE)
plot(ds3, x)




cndkfunc <- nonlcnd(alpha=0.03)
Ktrain2 <- cndkernmatrix(cndkfunc, x)
ds3 <- qkdbscan(Ktrain2,eps = 0.15, MinPts = 5, hybrid = FALSE)
plot(ds3, x)



cndkfunc <- polycnd(d = 2, alpha = 0.1529, c = 1)
Ktrain2 <- cndkernmatrix(cndkfunc, x)
ds3 <- qkdbscan(Ktrain2,eps = 0.2, MinPts = 5, hybrid = FALSE)
plot(ds3, x)



cndkfunc <- rbfcnd(gamma = 0.47)
Ktrain2 <- cndkernmatrix(cndkfunc, x)
ds3 <- qkdbscan(Ktrain2,eps = 0.15, MinPts = 6, hybrid = FALSE)
plot(ds3, x)



cndkfunc <- laplcnd(gamma = 1.8)
Ktrain2 <- cndkernmatrix(cndkfunc, x)
ds3 <- qkdbscan(Ktrain2,eps = 0.15, MinPts = 7, hybrid = FALSE)
plot(ds3, x)



cndkfunc <- anocnd(d = 1.9, sigma = 10.5)
Ktrain2 <- cndkernmatrix(cndkfunc, x)
ds3 <- qkdbscan(Ktrain2,eps = 0.2, MinPts = 4, hybrid = FALSE)
plot(ds3, x)



cndkfunc <- raticnd(c = 0.6)
Ktrain2 <- cndkernmatrix(cndkfunc, x)
ds3 <- qkdbscan(Ktrain2,eps = 0.15, MinPts = 10, hybrid = FALSE)
plot(ds3, x)



cndkfunc <- multcnd(c = 0.21)
Ktrain2 <- cndkernmatrix(cndkfunc, x)
ds3 <- qkdbscan(Ktrain2,eps = 0.15, MinPts = 5, hybrid = FALSE)
plot(ds3, x)



cndkfunc <- invcnd(c = 0.63)
Ktrain2 <- cndkernmatrix(cndkfunc, x)
ds3 <- qkdbscan(Ktrain2,eps = 0.15, MinPts = 5, hybrid = FALSE)
plot(ds3, x)



cndkfunc <- wavcnd(theta = 0.339)
Ktrain2 <- cndkernmatrix(cndkfunc, x)
ds3 <- qkdbscan(Ktrain2,eps = 0.12, MinPts = 6, hybrid = FALSE)
plot(ds3, x)



cndkfunc <- powcnd(d = 1.4)
Ktrain2 <- cndkernmatrix(cndkfunc, x)
ds3 <- qkdbscan(Ktrain2,eps = 0.18, MinPts = 5, hybrid = FALSE)
plot(ds3, x)



cndkfunc <- logcnd(d = 1.33)
Ktrain2 <- cndkernmatrix(cndkfunc, x)
ds3 <- qkdbscan(Ktrain2,eps = 0.18, MinPts = 5, hybrid = FALSE)
plot(ds3, x)



cndkfunc <- caucnd(gamma = 0.49)
Ktrain2 <- cndkernmatrix(cndkfunc, x)
ds3 <- qkdbscan(Ktrain2,eps = 0.15, MinPts = 5, hybrid = FALSE)
plot(ds3, x)



cndkfunc <- chicnd()
Ktrain2 <- cndkernmatrix(cndkfunc, x)
ds3 <- qkdbscan(Ktrain2,eps = 0.022, MinPts = 6, hybrid = FALSE)
plot(ds3, x)



cndkfunc <- studcnd(d = 1.233)
Ktrain2 <- cndkernmatrix(cndkfunc, x)
ds3 <- qkdbscan(Ktrain2,eps = 0.18, MinPts = 7, hybrid = FALSE)
plot(ds3, x)
