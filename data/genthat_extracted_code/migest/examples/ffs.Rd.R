library(migest)


### Name: ffs
### Title: Estimation of Bilateral Migrant Flows from Bilteral Migrant
###   Stocks
### Aliases: ffs

### ** Examples

## create P1 and P2 stock tables
dn <- LETTERS[1:4]
P1 <- matrix(data = c(1000, 100, 10, 0, 55, 555, 50, 5, 80, 40, 800, 40, 20, 25, 20, 200), 
             nrow = 4, ncol = 4, dimnames = list(pob = dn, por = dn), byrow = TRUE)
P2 <- matrix(data = c(950, 100, 60, 0, 80, 505, 75, 5, 90, 30, 800, 40, 40, 45, 0, 180),
             nrow = 4, ncol = 4, dimnames = list(pob = dn, por = dn), byrow = TRUE)
# display with row and col totals
addmargins(A = P1)
addmargins(A = P2)

# no births and deaths
b <- rep(x = 0, 4)
d <- rep(x = 0, 4)

y <- ffs(P1 = P1, P2 = P2, d = d, b = b)
# display with row, col and table totals
round(x = addmargins(A = y$mu), digits = 1)
# display with row and col totals
round(x = od_sum(y = y$mu), digits = 1)

## alternative offset term
dis <- matrix(data = c(1, 2, 3, 4, 2, 1, 5, 6, 3, 4, 1, 7, 4, 6, 7, 1), nrow = 4, ncol = 4)
y <- ffs(P1 = P1, P2 = P2, d = d, b = b, m = dis)
# display with row, col and table totals
round(x = addmargins(A = y$mu), digits = 1)
# display with row and col totals
round(x = od_sum(y = y$mu), digits = 1)

## alternative P2 and changes in population from natural increase
P2 <- matrix(data = c(1060, 60, 10, 10, 45, 540, 40, 0, 70, 75, 770, 70, 30, 30, 20, 230), 
             nrow = 4, ncol = 4, dimnames = list(pob = dn, por = dn), byrow = TRUE)
# display with row and col totals
addmargins(A = P2)
b <- c(80, 20, 40, 60)
d <- c(70, 30, 50, 10)

y <- ffs(P1 = P1, P2 = P2, d = d, b = b, method = "outside")
# display with row, col and table totals
round(x = addmargins(A = y$mu), digits = 1)
# display with row and col totals
round(x = od_sum(y = y$mu), digits = 1)



