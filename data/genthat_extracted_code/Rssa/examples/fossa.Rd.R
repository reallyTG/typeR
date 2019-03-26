library(Rssa)


### Name: fossa
### Title: Nested Filter-adjusted O-SSA decomposition
### Aliases: fossa fossa.ssa

### ** Examples

# Separation of two mixed sine-waves with equal amplitudes
N <- 150
L <- 70
omega1 <- 1/15
omega2 <- 1/10

v <- sin(2*pi*omega1 * (1:N)) + sin(2*pi*omega2 * (1:N))
s <- ssa(v, L)
fs <- fossa(s, nested.groups = 1:4, gamma = 100)

# Rssa does most of the plots via lattice
ws <- plot(wcor(s, groups = 1:4))
wfs <- plot(wcor(fs, groups = 1:4))
plot(ws, split = c(1, 1, 2, 1), more = TRUE)
plot(wfs, split = c(2, 1, 2, 1), more = FALSE)

opar <- par(mfrow = c(2, 1))
plot(reconstruct(s, groups = list(1:2, 3:4)))
plot(reconstruct(fs, groups = list(1:2, 3:4)))
par(opar)

# Real-life example: Australian Wine Sales
## No test: 
data(AustralianWine)
s <- ssa(AustralianWine[1:120, "Fortified"], L = 60)
fs <- fossa(s, nested.groups = list(6:7, 8:9, 10:11), gamma = 10)

plot(reconstruct(fs, groups = list(6:7, 8:9, 10:11)))
plot(wcor(s, groups = 6:11))
plot(wcor(fs, groups = 6:11))

# Real life example: improving of strong separability
data(USUnemployment)
unempl.male <- USUnemployment[, "MALE"]
s <- ssa(unempl.male)
fs <- fossa(s, nested.groups = 1:13, gamma = 1000)

# Comparison of reconstructions
rec <- reconstruct(s, groups = list(c(1:4, 7:11), c(5:6, 12:13)))
frec <- reconstruct(fs, groups <- list(5:13, 1:4))
# Trends
matplot(data.frame(frec$F1, rec$F1, unempl.male), type= 'l',
        col=c("red","blue","black"), lty=c(1,1,2))
# Seasonalities
matplot(data.frame(frec$F2, rec$F2), type = 'l', col=c("red","blue"), lty=c(1,1))

# W-cor matrices before and after FOSSA
ws <- plot(wcor(s, groups = 1:30), grid = 14)
wfs <- plot(wcor(fs, groups = 1:30), grid = 14)
plot(ws, split = c(1, 1, 2, 1), more = TRUE)
plot(wfs, split = c(2, 1, 2, 1), more = FALSE)

# Eigenvectors before and after FOSSA
plot(s, type = "vectors", idx = 1:13)
plot(fs, type = "vectors", idx = 1:13)

# 2D plots of periodic eigenvectors before and after FOSSA
plot(s, type = "paired", idx = c(5, 12))
plot(fs, type = "paired", idx = c(1, 3))

# Compare FOSSA with and without normalize
N <- 150
L <- 70
omega1 <- 1/15
omega2 <- 1/10

v <- 3*sin(2*pi*omega1 * (1:N)) + 2*sin(2*pi*omega2 * (1:N))
s <- ssa(v, L)
fs <- fossa(s, nested.groups = 1:4, gamma = 100)
fs.norm <- fossa(s, nested.groups = 1:4, gamma = 100, normalize = TRUE)
opar <- par(mfrow = c(2, 1))
plot(reconstruct(fs, groups = list(1:2, 3:4)))
plot(reconstruct(fs.norm, groups = list(1:2, 3:4)))
par(opar)

# 2D example
data(Mars)
s <- ssa(Mars)
plot(s, "vectors", idx = 1:50)
plot(s, "series", idx = 1:50)
fs <- fossa(s, nested.groups = 1:50, gamma = Inf)
plot(fs, "vectors", idx = 1:14)
plot(fs, "series", groups = 1:13)

# Filters example, extracting horizontal and vertical stripes
data(Mars)
s <- ssa(Mars)
fs.hor <- fossa(s, nested.groups = 1:50, gamma = Inf,
                filter = list(c(-1, 1), c(1)))
plot(fs.hor, "vectors", idx = 1:14)
plot(fs.hor, "series", groups = 1:13)
fs.ver <- fossa(s, nested.groups = 1:50, gamma = Inf,
                filter = list(c(1), c(-1, 1)))
plot(fs.ver, "vectors", idx = 1:14)
plot(fs.ver, "series", groups = 1:13)
## End(No test)



