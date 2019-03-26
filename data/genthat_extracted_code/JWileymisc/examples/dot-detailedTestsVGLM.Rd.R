library(JWileymisc)


### Name: .detailedTestsVGLM
### Title: Calculates all pairwise contrasts and omnibus tests for
###   multinomial regression
### Aliases: .detailedTestsVGLM

### ** Examples


mtcars$cyl <- factor(mtcars$cyl)
m <- VGAM::vglm(cyl ~ qsec,
  family = VGAM::multinomial(), data = mtcars)
.detailedTestsVGLM(m)

rm(m, mtcars)

## Not run: 
##D mtcars$cyl <- factor(mtcars$cyl)
##D mtcars$am <- factor(mtcars$am)
##D m <- VGAM::vglm(cyl ~ qsec,
##D   family = VGAM::multinomial(), data = mtcars)
##D .detailedTestsVGLM(m)
##D 
##D .detailedTestsVGLM(m, digits = 4)$Table
##D .detailedTestsVGLM(m, OR = FALSE)
##D .detailedTestsVGLM(m, digits = 4, OR = FALSE)$Table
##D 
##D m <- VGAM::vglm(cyl ~ scale(qsec),
##D   family = VGAM::multinomial(), data = mtcars)
##D .detailedTestsVGLM(m)
##D 
##D m2 <- VGAM::vglm(cyl ~ factor(vs) * scale(qsec),
##D   family = VGAM::multinomial(), data = mtcars)
##D .detailedTestsVGLM(m2)
##D 
##D m <- VGAM::vglm(Species ~ Sepal.Length,
##D   family = VGAM::multinomial(), data = iris)
##D .detailedTestsVGLM(m)
## End(Not run)



