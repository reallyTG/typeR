library(lavaSearch2)


### Name: createContrast
### Title: Create Contrast matrix
### Aliases: createContrast createContrast.character createContrast.lm
###   createContrast.gls createContrast.lme createContrast.lvmfit
###   createContrast.list createContrast.mmm

### ** Examples

## Simulate data
mSim <- lvm(X ~ Age + Treatment,
            Y ~ Gender + Treatment,
            c(Z1,Z2,Z3) ~ eta, eta ~ treatment,
            Age[40:5]~1)
latent(mSim) <- ~eta
categorical(mSim, labels = c("placebo","SSRI")) <- ~Treatment
categorical(mSim, labels = c("male","female")) <- ~Gender
n <- 1e2
set.seed(10)
df.data <- lava::sim(mSim,n)

## Estimate separate models
lmX <- lava::estimate(lvm(X ~ -1 + Age + Treatment), data = df.data)
lmY <- lava::estimate(lvm(Y ~ -1 + Gender + Treatment), data = df.data)
lvmZ <- lava::estimate(lvm(c(Z1,Z2,Z3) ~ -1 + 1*eta, eta ~ -1 + Treatment), 
                 data = df.data)

## Contrast matrix for a given model
createContrast(lmX, par = "X~Age")
createContrast(lmX, par = c("X~Age=0","X~Age+5*X~TreatmentSSRI=0"))
createContrast(lmX, par = character(0))

## Contrast matrix for the join model
ls.lvm <- list(X = lmX, Y = lmY, Z = lvmZ)
createContrast(ls.lvm, var.test = "Treatment", add.variance = FALSE)
createContrast(ls.lvm, par = character(0), add.variance = FALSE)

## Contrast for multigroup models
## Not run: 
##D m <- lava::lvm(Y~Age+Treatment)
##D e <- lava::estimate(list(m,m), data = split(df.data, df.data$Gender))
##D print(coef(e))
##D createContrast(e, par = "1@Y~TreatmentSSRI - 2@Y~TreatmentSSRI = 0")
##D createContrast(e, par = "2@Y~TreatmentSSRI - 1@Y~TreatmentSSRI = 0")
## End(Not run)



