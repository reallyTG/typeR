library(prefmod)


### Name: llbt.design
### Title: Loglinear Bradley-Terry Model (LLBT) - Design Matrix Generation
### Aliases: llbt.design
### Keywords: models regression

### ** Examples

# cems universities example
des <- llbt.design(cemspc, nitems = 6, cat.scovs = "ENG")

res0 <- gnm(y ~ o1+o2+o3+o4+o5+o6 + ENG:(o1+o2+o3+o4+o5+o6),
    eliminate = mu:ENG, data = des, family = poisson)
summary(res0)

# inclusion of g1 allows for an undecided effect
res <- gnm(y ~ o1+o2+o3+o4+o5+o6 + ENG:(o1+o2+o3+o4+o5+o6) + g1,
    eliminate = mu:ENG, data = des, family = poisson)
summary(res)

# calculating and plotting worth parameters
wmat <- llbt.worth(res)
plot(wmat)

# object specific covariates
LAT  <- c(0, 1, 1, 0, 1, 0)        # latin cities
EC   <- c(1, 0, 1, 0, 0, 1)
OBJ  <- data.frame(LAT, EC)
des2 <- llbt.design(cemspc, nitems = 6, objcovs = OBJ, cat.scovs = "ENG")
res2 <- gnm(y ~ LAT + EC + LAT:ENG + g1,
    eliminate = mu:ENG, data = des2, family = poisson)

# calculating and plotting worth parameters
wmat2 <- llbt.worth(res2)
wmat2
plot(wmat2)



