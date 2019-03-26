library(lavaSearch2)


### Name: glht2
### Title: General Linear Hypothesis
### Aliases: glht2 glht2.lvmfit glht2.mmm

### ** Examples

library(multcomp)

## Simulate data
mSim <- lvm(c(Y1,Y2,Y3)~ beta * eta, Z1 ~ E, Z2 ~ E, Age[40:5]~1)
latent(mSim) <- "eta"
set.seed(10)
n <- 1e2

df.data <- lava::sim(mSim, n, latent = FALSE, p = c(beta = 1))

#### Inference on a single model ####
e.lvm <- estimate(lvm(Y1~E), data = df.data)
summary(glht2(e.lvm, linfct = c("Y1~E + Y1","Y1")))

#### Inference on separate models ####
## fit separate models
lmX <- lm(Z1 ~ E, data = df.data)
lvmY <- estimate(lvm(Z2 ~ E + Age), data = df.data)
lvmZ <- estimate(lvm(c(Y1,Y2,Y3) ~ eta, eta ~ E), 
                 data = df.data)

#### create mmm object #### 
e.mmm <- mmm(X = lmX, Y = lvmY, Z = lvmZ)

#### create contrast matrix ####
resC <- createContrast(e.mmm, var.test = "E", add.variance = TRUE)

#### adjust for multiple comparisons ####
e.glht2 <- glht2(e.mmm, linfct = resC$contrast)
summary(e.glht2)




