library(gnm)


### Name: anova.gnm
### Title: Analysis of Deviance for Generalized Nonlinear Models
### Aliases: anova.gnm
### Keywords: models

### ** Examples

set.seed(1)

##  Fit a uniform association model separating diagonal effects
Rscore <- scale(as.numeric(row(occupationalStatus)), scale = FALSE)
Cscore <- scale(as.numeric(col(occupationalStatus)), scale = FALSE)
Uniform <- glm(Freq ~ origin + destination + Diag(origin, destination) + 
               Rscore:Cscore, family = poisson, data = occupationalStatus)

##  Fit an association model with homogeneous row-column effects
RChomog <- gnm(Freq ~ origin + destination + Diag(origin, destination) +
               MultHomog(origin, destination), family = poisson,
               data = occupationalStatus)

##  Fit an association model with separate row and column effects
RC <- gnm(Freq ~ origin + destination + Diag(origin, destination) +
          Mult(origin, destination), family = poisson,
          data = occupationalStatus)

anova(RC, test = "Chisq")

anova(Uniform, RChomog, RC, test = "Chisq")



