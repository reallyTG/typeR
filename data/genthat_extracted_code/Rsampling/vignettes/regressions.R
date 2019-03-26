## ----setup, echo = FALSE-------------------------------------------------
knitr::opts_chunk$set(
    collapse=TRUE,
    comment = NA,
    prompt = TRUE
    )
set.seed(42)

## ----installation CRAN, eval=FALSE---------------------------------------
#  install.packages("Rsampling")

## ----installation GitHub, eval=FALSE-------------------------------------
#  library(devtools)
#  install_github(repo = 'lageIBUSP/Rsampling')

## ----load library--------------------------------------------------------
library(Rsampling)

## ----inspecting object rhyzophora----------------------------------------
head(rhyzophora)
summary(rhyzophora)

## ----plot rhyzophora, fig.cap = "Relation between number of supporting roots and the ratio canopy area / trunk area for mangrove trees at two sites that differ in the soil instability (medium and high instability)."----
plot(n.roots ~ canopy.trunk, data=rhyzophora, type="n",
     xlab="canopy area / trunk area", ylab="root number")
points(n.roots ~ canopy.trunk, data=rhyzophora,
       subset=soil.instability=="medium")
points(n.roots ~ canopy.trunk, data=rhyzophora,
       subset=soil.instability=="high", pch=19)
legend("topright", c("Medium","High"), title="Soil instability", pch=c(1,19))

## ----rhyzophora statistics of interest-----------------------------------
rhyz.si <- function(dataframe){
    m1 <- lm(n.roots ~ canopy.trunk, data=dataframe,
             subset=soil.instability=="medium")
    m2 <- lm(n.roots ~ canopy.trunk, data=dataframe,
             subset=soil.instability=="high")
    c(med = coef(m1)[[2]],
      high = coef(m2)[[2]])
}
## Observed values
rhyz.si(rhyzophora)

## ----rhyzophora resampling, results="hide"-------------------------------
rhyz.r <- Rsampling(type = "normal_rand", dataframe = rhyzophora,
                    statistics = rhyz.si, stratum = rhyzophora$soil.instability,
                        cols = 2, ntrials = 1000)

## ----rhyzophora resampling results---------------------------------------
rhyz.r[,1:3]

## ----rhyzophora null distributions, fig.cap="Frequency distributions of the slope of linear regressions of number of supporting roots to torque in mangrove trees, under the null hypothesis that there is not a relationship. The trees were measured at two sites, and the null hypothesis was simulated shuffling y-values (n of roots) among trees at each site. Red lines show the observed values of the slopes, and the acceptance region of the null hypothesis at 5% is in grey. Absolute values large than the observed are depicted in orange. Results from 1000 simulations. ", fig.width=7.5----
par(mfrow=c(1,2))
dplot(rhyz.r[1,], svalue=rhyz.si(rhyzophora)[1], pside="Greater",
      main="Less unstable soil", xlab="Regression slope")
dplot(rhyz.r[2,], svalue=rhyz.si(rhyzophora)[2], pside="Greater",
      main="More unstable soil", xlab="Regression slope")
par(mfrow=c(1,1))

## ----rhyzophora test-----------------------------------------------------
sum(rhyz.r[1,] >= rhyz.si(rhyzophora)[1])/1000 < 0.05
sum(rhyz.r[2,] >= rhyz.si(rhyzophora)[2])/1000 < 0.05

## ----rhyzophora diff between slopes--------------------------------------
rhyz.si2 <- function(dataframe){
    m1 <- lm(n.roots ~ canopy.trunk, data=dataframe,
             subset=soil.instability=="medium")
    m2 <- lm(n.roots ~ canopy.trunk, data=dataframe,
             subset=soil.instability=="high")
    coef(m1)[[2]] - coef(m2)[[2]]
}

## Observed values
rhyz.si2(rhyzophora)

## ----rhyzophora resampling slopes, results="hide"------------------------
rhyz.r2 <- Rsampling(type = "normal_rand", dataframe = rhyzophora,
                    statistics = rhyz.si2,
                        cols = 1, ntrials = 1000)

## ----rhyzophora 2nd test-------------------------------------------------
sum(rhyz.r2 > rhyz.si2(rhyzophora))/1000 < 0.05

## ----rhyzophora common slope---------------------------------------------
lm(n.roots ~ canopy.trunk, data=rhyzophora)

## ----plot rhyzophora single regression, fig.cap = "Relation between the number of supporting roots and the ratio canopy area / trunk area for mangrove trees at two sites that differ in the soil instability (medium and high instability). Also shown the line of the linear regression fitted to the whole data set."----
plot(n.roots ~ canopy.trunk, data=rhyzophora, type="n",
     xlab="canopy area / trunk area", ylab="number of roots")
points(n.roots ~ canopy.trunk, data=rhyzophora,
       subset=soil.instability=="medium")
points(n.roots ~ canopy.trunk, data=rhyzophora,
       subset=soil.instability=="high", pch=19)
abline(lm(n.roots ~ canopy.trunk, data=rhyzophora))
legend("topright", c("Medium","High"), title="Soil instability", pch=c(1,19))

## ----statistics of interest 3 rhyzophora---------------------------------
rhyz.si3 <- function(dataframe){
    m1 <- lm(n.roots ~ canopy.trunk, data=dataframe)
    res.media <- tapply(resid(m1), dataframe$soil.instability, mean)
    res.media[[1]] - res.media[[2]]
}
## Observed values
rhyz.si3(rhyzophora)

## ----rhyzophora resampling intercept, results="hide"---------------------
rhyz.r3 <- Rsampling(type = "normal_rand", dataframe = rhyzophora,
                    statistics = rhyz.si3,
                        cols = 1, ntrials = 1000)

## ----rhyzophora 3rd test-------------------------------------------------
sum(rhyz.r3 > rhyz.si3(rhyzophora))/1000 < 0.05

## ----rhyzophora ancova---------------------------------------------------
(rhyz.ancova <- lm(n.roots ~ soil.instability + canopy.trunk  -1,
                   data=rhyzophora))

## ----plot rhyzophora ancova, fig.cap = "Relation between number of supporting roots and the ratio canopy area / trunk area for mangrove trees at two sites that differ in the soil instability (medium and high instability). Also shown the line of the regressions fitted to each site, but with a common slope."----
cfs <- coef(rhyz.ancova)
plot(n.roots ~ canopy.trunk, data=rhyzophora, type="n",
     xlab="canopy area / trunk area", ylab="number of roots")
points(n.roots ~ canopy.trunk, data=rhyzophora,
       subset=soil.instability=="medium", col="blue")
points(n.roots ~ canopy.trunk, data=rhyzophora,
       subset=soil.instability=="high", col="red")
abline(cfs[1],cfs[3], col="red")
abline(cfs[2],cfs[3], col="blue")
legend("topright", c("Medium","High"), title="Soil instability", col=c("blue", "red"))

