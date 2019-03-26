## ------------------------------------------------------------------------
library(MANOVA.RM)
data(o2cons)

## ------------------------------------------------------------------------
head(o2cons)

## ------------------------------------------------------------------------
model1 <- RM(O2 ~ Group * Staphylococci * Time, data = o2cons, 
             subject = "Subject", no.subf = 2, iter = 1000, 
             resampling = "Perm", CPU = 1, seed = 1234)
summary(model1)

## ------------------------------------------------------------------------
data(EEG)
EEG_model <- RM(resp ~ sex * diagnosis * feature * region, 
                     data = EEG, subject = "id", no.subf = 2, resampling = "WildBS",
                     iter = 1000,  alpha = 0.01, CPU = 1, seed = 987)
summary(EEG_model)

## ------------------------------------------------------------------------
plot(EEG_model, factor = "sex", main = "Effect of sex on EEG values")
plot(EEG_model, factor = "sex:diagnosis", legendpos = "topleft", col = c(4, 2))
plot(EEG_model, factor = "sex:diagnosis:feature", legendpos = "center", gap = 0.05)

## ------------------------------------------------------------------------
data(EEG)
EEG_MANOVA <- MANOVA(resp ~ sex * diagnosis, 
                     data = EEG, subject = "id", resampling = "paramBS", 
                     iter = 1000,  alpha = 0.01, CPU = 1, seed = 987)
summary(EEG_MANOVA)

## ------------------------------------------------------------------------
tear <- c(6.5, 6.2, 5.8, 6.5, 6.5, 6.9, 7.2, 6.9, 6.1, 6.3,
          6.7, 6.6, 7.2, 7.1, 6.8, 7.1, 7.0, 7.2, 7.5, 7.6)
gloss <- c(9.5, 9.9, 9.6, 9.6, 9.2, 9.1, 10.0, 9.9, 9.5, 9.4,
           9.1, 9.3, 8.3, 8.4, 8.5, 9.2, 8.8, 9.7, 10.1, 9.2)
opacity <- c(4.4, 6.4, 3.0, 4.1, 0.8, 5.7, 2.0, 3.9, 1.9, 5.7,
             2.8, 4.1, 3.8, 1.6, 3.4, 8.4, 5.2, 6.9, 2.7, 1.9)
rate     <- gl(2,10, labels = c("Low", "High"))
additive <- gl(2, 5, length = 20, labels = c("Low", "High"))

example <- data.frame(tear, gloss, opacity, rate, additive)
fit <- MANOVA.wide(cbind(tear, gloss, opacity) ~ rate * additive, data = example, iter = 1000, CPU = 1)
summary(fit)

## ------------------------------------------------------------------------
if (requireNamespace("HSAUR", quietly = TRUE)) {
library(HSAUR)
data(water)
test <- MANOVA.wide(cbind(mortality, hardness) ~ location, data = water, iter = 1000, resampling = "paramBS", CPU = 1, seed = 123)
summary(test)
cr <- conf.reg(test)
cr
}

## ------------------------------------------------------------------------
plot(cr, col = 2, lty = 2, xlab = "Difference in mortality", ylab ="Difference in water hardness")

## ------------------------------------------------------------------------
# pairwise comparison using Tukey contrasts
simCI(EEG_MANOVA, contrast = "pairwise", type = "Tukey")
# the same but with Dunnett contrasts using group 2 as baseline
simCI(EEG_MANOVA, contrast = "pairwise", type = "Dunnett", base = 2)
# a one-way layout using MANOVA.wide():
oneway <- MANOVA.wide(cbind(brainrate_temporal, brainrate_central) ~ diagnosis, data = EEGwide,
                      iter = 1000, CPU = 1)
# and a user-defined contrast matrix
H <- as.matrix(cbind(rep(1, 5), -1*Matrix::Diagonal(5)))
# user-specified comparison
simCI(oneway, contrast = "user-defined", contmat = H)

## ------------------------------------------------------------------------
model_sex <- MANOVA.wide(cbind(brainrate_temporal, brainrate_central, brainrate_frontal,
                            complexity_temporal, complexity_central, complexity_frontal) ~ sex,
                      data = EEGwide,
                      iter = 1000, seed = 987, CPU = 1)
summary(model_sex)

## ------------------------------------------------------------------------
EEG1 <- MANOVA.wide(brainrate_temporal ~ sex, data = EEGwide, iter = 1000, seed = 987, CPU = 1)
EEG2 <- MANOVA.wide(brainrate_central ~ sex, data = EEGwide, iter = 1000, seed = 987, CPU = 1)
EEG3 <- MANOVA.wide(brainrate_frontal ~ sex, data = EEGwide, iter = 1000, seed = 987, CPU = 1)
EEG4 <- MANOVA.wide(complexity_temporal ~ sex, data = EEGwide, iter = 1000, seed = 987, CPU = 1)
EEG5 <- MANOVA.wide(complexity_central ~ sex, data = EEGwide, iter = 1000, seed = 987, CPU = 1)
EEG6 <- MANOVA.wide(complexity_frontal ~ sex, data = EEGwide, iter = 1000, seed = 987, CPU = 1)

## ------------------------------------------------------------------------
p.adjust(c(EEG1$resampling[, 2], EEG2$resampling[, 2], EEG3$resampling[, 2],
           EEG4$resampling[, 2], EEG5$resampling[, 2], EEG6$resampling[, 2]),
         method = "bonferroni")

## ------------------------------------------------------------------------
if (requireNamespace("GFD", quietly = TRUE)) {
library(GFD)
data(curdies)
set.seed(123)
curdies$dug2 <- curdies$dugesia + rnorm(36)

# first possibility: MANOVA.wide
fit1 <- MANOVA.wide(cbind(dugesia, dug2) ~ season + season:site, data = curdies, iter = 1000, nested.levels.unique = TRUE, seed = 123, CPU = 1)

# second possibility: MANOVA (long format)
dug <- c(curdies$dugesia, curdies$dug2)
season <- rep(curdies$season, 2)
site <- rep(curdies$site, 2)
curd <- data.frame(dug, season, site, subject = rep(1:36, 2))

fit2 <- MANOVA(dug ~ season + season:site, data = curd, subject = "subject", nested.levels.unique = TRUE, seed = 123, iter = 1000,
               CPU = 1)

# comparison of results
summary(fit1)
summary(fit2)
}

## ------------------------------------------------------------------------
if (requireNamespace("RGtk2", quietly = TRUE)) {
GUI.MANOVA()
}

