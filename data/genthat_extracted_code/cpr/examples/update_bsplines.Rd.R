library(cpr)


### Name: update_bsplines
### Title: Update bspline or btensor calls
### Aliases: update_bsplines update_btensor

### ** Examples

########################### Updating a cpr_bs object ###########################
# construct a B-spline basis
bmat <- bsplines(seq(1, 10, length = 15), df = 5, order = 3)

# look at the structure of the basis
str(bmat)

# change the order
str(update_bsplines(bmat, order = 4))

# change the order and the degrees of freedom
str(update_bsplines(bmat, df = 12, order = 4))

########################### Updating a cpr_bt object ###########################
# construct a tensor product
tpmat <- btensor(list(x1 = seq(0, 1, length = 10), x2 = seq(0, 1, length = 10)),
                 df = list(4, 5))

tpmat 

# update the degrees of freedom
update_btensor(tpmat, df = list(6, 7))

####### Updating bsplines or btensor on the right and side of a formula ########

f1 <- y ~ bsplines(x, df = 14) + var1 + var2
f2 <- y ~ btensor(x = list(x1, x2), df = list(50, 31), order = list(3, 5))  + var1 + var2

update_bsplines(f1, df = 13, order = 5) 
update_btensor(f2, df = list(13, 24), order = list(3, 8))

########################### Updating a cpr_cp object ###########################
data(spdg, package = "cpr")
init_cp <- cp(pdg ~ bsplines(day, df = 30) + age + ttm, data = spdg)
updt_cp <- update_bsplines(init_cp, df = 5)

########################### Updating a cpr_cn object ###########################
init_cn <- cn(pdg ~ btensor(list(day, age), df = list(30, 4)) + ttm, data = spdg)
updt_cn <- update_btensor(init_cn, df = list(30, 2), order = list(3, 2))




