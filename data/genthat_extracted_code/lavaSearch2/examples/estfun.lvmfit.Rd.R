library(lavaSearch2)


### Name: estfun.lvmfit
### Title: Extract Empirical Estimating Functions (lvmfit Object)
### Aliases: estfun.lvmfit

### ** Examples

library(multcomp)

#### generative model ####
mSim <- lvm(X ~ Age + 0.5*Treatment,
            Y ~ Gender + 0.25*Treatment,
            c(Z1,Z2,Z3) ~ eta, eta ~ 0.75*treatment,
            Age[40:5]~1)
latent(mSim) <- ~eta
categorical(mSim, labels = c("placebo","SSRI")) <- ~Treatment
categorical(mSim, labels = c("male","female")) <- ~Gender

#### simulate data ####
n <- 5e1
set.seed(10)
df.data <- lava::sim(mSim, n = n, latent = FALSE)

#### fit separate models ####
lmX <- lm(X ~ Age + Treatment, data = df.data)
lvmY <- estimate(lvm(Y ~ Gender + Treatment), data = df.data)
lvmZ <- estimate(lvm(c(Z1,Z2,Z3) ~ eta, eta ~ Treatment), 
                 data = df.data)

#### create mmm object #### 
e.mmm <- mmm(X = lmX, Y = lvmY, Z = lvmZ)

#### create contrast matrix ####
resC <- createContrast(e.mmm, var.test = "Treatment", add.variance = FALSE)

#### adjust for multiple comparisons ####
e.glht <- glht(e.mmm, linfct = resC$mlf)
summary(e.glht)




