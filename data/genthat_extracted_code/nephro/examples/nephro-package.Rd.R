library(nephro)


### Name: nephro-package
### Title: Biostatistics utilities for nephrology
### Aliases: nephro-package nephro
### Keywords: GFR, renal function, kidney, MDRD, CKD-EPI, creatinine,
###   cystatin

### ** Examples

# Comparison between different equations

creat <- c(0.8, 0.9, 1.0, 1.1, 1.2, 1.3)
cyst  <- c(1.1, 0.95, 1.1, 1.0, 1.3, 1.2)
sex <- c(1, 1, 1, 0, 0, 0)
age <- c(60, 65, 43, 82, 71, 55)
ethn <- round(runif(6))
wt <- c(70, 80, 60, 55, 87, 71)

eGFR <- data.frame(creat, cyst)
eGFR$MDRD4 <- MDRD4(creat, sex, age, ethn, 'IDMS') 
eGFR$CKDEpi.creat <- CKDEpi.creat(creat, sex, age, ethn) 
eGFR$CKDEpi.cys <- CKDEpi.cys(cyst, sex, age)
eGFR$CKDEpi.creat.cys <- CKDEpi.creat.cys(creat, cyst, sex, age, ethn)
eGFR$Stevens.cys1 <- Stevens.cys1(cyst)
eGFR$Stevens.cys2 <- Stevens.cys2(cyst, sex, age, ethn)
eGFR$Stevens.creat.cys <- Stevens.creat.cys(creat, cyst, sex, age, ethn)
eGFR$cg <- CG(creat, sex, age, wt)
eGFR$virga <- Virga(creat, sex, age, wt)

pairs(eGFR[,3:11])


# For use with non-IDMS calibrated creatinine 
# several authors (see references) suggested
# a 5% creatinine adjustment

creat <- c(0.8, 0.9, 1.0, 1.1, 1.2, 1.3)
sex <- c(1, 1, 1, 0, 0, 0)
age <- c(60, 65, 43, 82, 71, 55)
ethn <- round(runif(6))
gfr <- CKDEpi.creat(0.95*creat, sex, age, ethn) 



