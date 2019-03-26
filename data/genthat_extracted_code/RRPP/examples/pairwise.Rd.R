library(RRPP)


### Name: pairwise
### Title: Pairwise comparisons of lm.rrpp fits
### Aliases: pairwise
### Keywords: analysis

### ** Examples


# Examples use geometric morphometric data on pupfishes
# See the package, geomorph, for details about obtaining such data

# Body Shape Analysis (Multivariate)----------------------------------------------------

data("Pupfish")

# Note:

dim(Pupfish$coords) # highly multivariate!

Pupfish$logSize <- log(Pupfish$CS) # better to not have functions in formulas

# Note: one should use all dimensions of the data but with this example, there are many
# Thus, only three principal components will be used for demonstration purposes.

Pupfish$Y <- prcomp(Pupfish$coords)$x[, 1:3]

## Pairwise comparisons of LS means

fit1 <- lm.rrpp(Y ~ logSize + Sex * Pop, SS.type = "I", 
data = Pupfish, print.progress = FALSE, iter = 999) 
summary(fit1, formula = FALSE)
anova(fit1) 

pup.group <- interaction(Pupfish$Sex, Pupfish$Pop)
pup.group
PW1 <- pairwise(fit1, groups = pup.group)
PW1
summary(PW1, confidence = 0.95, test.type = "dist") # distances between means
summary(PW1, confidence = 0.95, test.type = "dist", stat.table = FALSE)
summary(PW1, confidence = 0.95, test.type = "VC", 
   angle.type = "deg") # correlation between mean vectors (angles in degrees)

# Can also compare the dispersion around means

summary(PW1, confidence = 0.95, test.type = "var")

## Pairwise comparisons of slopes

fit2 <- lm.rrpp(Y ~ logSize * Sex * Pop, SS.type = "I", 
data = Pupfish, print.progress = FALSE, iter = 999) 
summary(fit2, formula = FALSE)
anova(fit1, fit2)

# Using a null fit that excludes all factor-covariate interactions, not just the last one  

PW2 <- pairwise(fit2, fit.null = fit1, groups = pup.group, covariate = Pupfish$logSize) 
PW2
summary(PW2, confidence = 0.95, test.type = "dist") # distances between slope vector lengths
summary(PW2, confidence = 0.95, test.type = "dist", stat.table = FALSE)
summary(PW2, confidence = 0.95, test.type = "VC",
   angle.type = "deg") # correlation between slope vectors (and angles)
   
# Can also compare the dispersion around group slopes

summary(PW2, confidence = 0.95, test.type = "var")




