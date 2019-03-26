library(JWileymisc)


### Name: detailedTests
### Title: Detailed Comparisons and Tests on Models
### Aliases: detailedTests

### ** Examples

mtcars$cyl <- factor(mtcars$cyl)
m <- VGAM::vglm(cyl ~ qsec,
  family = VGAM::multinomial(), data = mtcars)
detailedTests(m)
rm(m, mtcars)

## Not run: 
##D mtcars$cyl <- factor(mtcars$cyl)
##D mtcars$am <- factor(mtcars$am)
##D m <- VGAM::vglm(cyl ~ qsec,
##D   family = VGAM::multinomial(), data = mtcars)
##D detailedTests(m)
##D 
##D detailedTests(m, digits = 4)$Table
##D detailedTests(m, OR = FALSE)
##D detailedTests(m, digits = 4, OR = FALSE)$Table
##D 
##D m <- VGAM::vglm(cyl ~ scale(qsec),
##D   family = VGAM::multinomial(), data = mtcars)
##D detailedTests(m)
##D 
##D m2 <- VGAM::vglm(cyl ~ factor(vs) * scale(qsec),
##D   family = VGAM::multinomial(), data = mtcars)
##D detailedTests(m2)
##D 
##D m <- VGAM::vglm(Species ~ Sepal.Length,
##D   family = VGAM::multinomial(), data = iris)
##D detailedTests(m)
##D 
##D data(aces_daily)
##D m1 <- lme4::lmer(NegAff ~ STRESS + (1 + STRESS | UserID),
##D   data = aces_daily)
##D m2 <- lme4::lmer(NegAff ~ STRESS + I(STRESS^2) + (1 + STRESS | UserID),
##D   data = aces_daily)
##D testm1 <- detailedTests(m1, method = "profile")
##D testm2 <- detailedTests(m2, method = "profile")
##D testm2b <- detailedTests(m2, method = "boot", nsim = 100)
## End(Not run)



