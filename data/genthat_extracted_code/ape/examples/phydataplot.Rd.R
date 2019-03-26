library(ape)


### Name: phydataplot
### Title: Tree Annotation
### Aliases: phydataplot ring
### Keywords: aplot

### ** Examples

## demonstrates matching with names:
tr <- rcoal(n <- 10)
x <- 1:n
names(x) <- tr$tip.label
plot(tr, x.lim = 11)
phydataplot(x, tr)
## shuffle x but matching names with tip labels reorders them:
phydataplot(sample(x), tr, "s", lwd = 3, lty = 3)

## adapts to the tree:
plot(tr, "f", x.l = c(-11, 11), y.l = c(-11, 11))
phydataplot(x, tr, "s")

## leave more space with x.lim to show a barplot and a dotchart:
plot(tr, x.lim = 22)
phydataplot(x, tr, col = "yellow")
phydataplot(x, tr, "d", offset = 13)

ts <- rcoal(N <- 100)
X <- rTraitCont(ts) # names are set
dd <- dist(X)
op <- par(mar = rep(0, 4))
plot(ts, x.lim = 10, cex = 0.4, font = 1)
phydataplot(as.matrix(dd), ts, "i", offset = 0.2)

par(xpd = TRUE, mar = op$mar)
co <- c("blue", "red"); l <- c(-2, 2)
X <- X + abs(min(X)) # move scale so X >= 0
plot(ts, "f", show.tip.label = FALSE, x.lim = l, y.lim = l, open.angle = 30)
phydataplot(X, ts, "s", col = co, offset = 0.05)
ring(X, ts, "ring", col = co, offset = max(X) + 0.1) # the same info as a ring

## as many rings as you want...
co <- c("blue", "yellow")
plot(ts, "r", show.tip.label = FALSE, x.l = c(-1, 1), y.l = c(-1, 1))
for (o in seq(0, 0.4, 0.2)) {
    co <- rev(co)
    ring(0.2, ts, "r", col = rep(co, each = 5), offset = o)
}

lim <- c(-5, 5)
co <- rgb(0, 0.4, 1, alpha = 0.1)
y <- seq(0.01, 1, 0.01)
plot(ts, "f", x.lim = lim, y.lim = lim, show.tip.label = FALSE)
ring(y, ts, offset = 0, col = co, lwd = 0.1)
for (i in 1:3) {
    y <- y + 1
    ring(y, ts, offset = 0, col = co, lwd = 0.1)
}

## rings can be in the background
plot(ts, "r", plot = FALSE)
ring(1, ts, "r", col = rainbow(100), offset = -1)
par(new = TRUE)
plot(ts, "r", font = 1, edge.color = "white")

## might be more useful:
co <- c("lightblue", "yellow")
plot(ts, "r", plot = FALSE)
ring(0.1, ts, "r", col = sample(co, size = N, rep = TRUE), offset = -.1)
par(new = TRUE)
plot(ts, "r", font = 1)

## if x is matrix:
tx <- rcoal(m <- 20)
X <- runif(m, 0, 0.5); Y <- runif(m, 0, 0.5)
X <- cbind(X, Y, 1 - X - Y)
rownames(X) <- tx$tip.label
plot(tx, x.lim = 6)
co <- rgb(diag(3))
phydataplot(X, tx, col = co)
## a variation:
plot(tx, show.tip.label = FALSE, x.lim = 5)
phydataplot(X, tx, col = co, offset = 0.05, border = NA)

plot(tx, "f", show.tip.label = FALSE, open.angle = 180)
ring(X, tx, col = co, offset = 0.05)

Z <- matrix(rnorm(m * 5), m)
rownames(Z) <- rownames(X)
plot(tx, x.lim = 5)
phydataplot(Z, tx, "bo", scaling = .5, offset = 0.5,
            boxfill = c("gold", "skyblue"))

## plot an alignment with a NJ tree:
data(woodmouse)
trw <- nj(dist.dna(woodmouse))
plot(trw, x.lim = 0.1, align.tip = TRUE, font = 1)
phydataplot(woodmouse[, 1:50], trw, "m", 0.02, border = NA)

## use type = "mosaic" on a 30x5 matrix:
tr <- rtree(n <- 30)
p <- 5
x <- matrix(sample(3, size = n*p, replace = TRUE), n, p)
dimnames(x) <- list(paste0("t", 1:n), LETTERS[1:p])
plot(tr, x.lim = 35, align.tip = TRUE, adj = 1)
phydataplot(x, tr, "m", 2)
## change the aspect:
plot(tr, x.lim = 35, align.tip = TRUE, adj = 1)
phydataplot(x, tr, "m", 2, width = 2, border = "white", lwd = 3, legend = "side")
## user-defined colour:
f <- function(n) c("yellow", "blue", "red")
phydataplot(x, tr, "m", 18, width = 2, border = "white", lwd = 3,
            legend = "side", funcol = f)

## alternative colour function...:
## fb <- function(n) c("3" = "red", "2" = "blue", "1" = "yellow")
## ... but since the values are sorted alphabetically,
## both f and fb will produce the same plot.

## use continuous = TRUE with two different scales:
x[] <- 1:(n*p)
plot(tr, x.lim = 35, align.tip = TRUE, adj = 1)
phydataplot(x, tr, "m", 2, width = 1.5, continuous = TRUE, legend = "side",
            funcol = colorRampPalette(c("white", "darkgreen")))
phydataplot(x, tr, "m", 18, width = 1.5, continuous = 5, legend = "side",
            funcol = topo.colors)



