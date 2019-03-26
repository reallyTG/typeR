library(iopsych)


### Name: fuse
### Title: Computes the correlation between two composites of items.
### Aliases: fuse

### ** Examples

Rxx <- matrix(c(1.00, 0.25,  0.50,  0.61,
                0.25, 1.00,  0.30,  0.10,
                0.50, 0.30,  1.00, -0.30,
                0.61, 0.10, -0.30,  1.00), 4, 4)
a   <- c(1, 3)
b   <- c(2, 4)

# Example using overlapping items and weights
Rxx  <- matrix(.3, 4, 4); diag(Rxx) <- 1
a    <- c(1, 2, 4)
b    <- c(2, 3)
wt_a <- c(.60, .25, .15)
wt_b <- c(2, 3)

fuse(r_mat = Rxx, a = a, b = b, wt_a = wt_a, wt_b = wt_b)




