library(pmml)


### Name: pmml.glm
### Title: Generate PMML for glm objects
### Aliases: pmml.glm

### ** Examples

data(iris)
mod <- glm(Sepal.Length ~ ., data=iris, family = "gaussian")
mod_pmml <- pmml(mod)
rm(mod,mod_pmml)

data(audit)
mod <- glm(Adjusted ~ Age + Employment + Education + Income, data=audit,family=binomial(logit))
mod_pmml <- pmml(mod)
rm(mod,mod_pmml)

##  creating a new 2-class target from a 3-class variable
data(iris)
dat <- iris[,1:4]
# add a new 2-class target "Species_setosa" before passing it to glm()
dat$Species_setosa <- iris$Species=="setosa"
mod <- glm(Species_setosa ~ ., data=dat, family=binomial(logit))
mod_pmml <- pmml(mod)
rm(dat,mod,mod_pmml)



