library(meta)


### Name: metainc
### Title: Meta-analysis of incidence rates
### Aliases: metainc
### Keywords: htest

### ** Examples

data(smoking)

m1 <- metainc(d.smokers, py.smokers,
              d.nonsmokers, py.nonsmokers,
              data=smoking, studlab=study)
print(m1, digits=2)

m2 <- metainc(d.smokers, py.smokers,
              d.nonsmokers, py.nonsmokers,
              data=smoking, studlab=study,
              method="Cochran")
print(m2, digits=2)

data(lungcancer)

m3 <- metainc(d.smokers, py.smokers,
              d.nonsmokers, py.nonsmokers,
              data=lungcancer, studlab=study)
print(m3, digits=2)


# Redo Cochran meta-analysis with inflated standard errors
#
# All cause mortality
#
TEa <- log( (smoking$d.smokers/smoking$py.smokers) /
            (smoking$d.nonsmokers/smoking$py.nonsmokers)
          )
seTEa <- sqrt(1/smoking$d.smokers +
              1/smoking$d.nonsmokers + 2.5/smoking$d.nonsmokers)
#
metagen(TEa, seTEa, sm="IRR", studlab=smoking$study)

# Lung cancer mortality
#
TEl <- log( (lungcancer$d.smokers/lungcancer$py.smokers) /
            (lungcancer$d.nonsmokers/lungcancer$py.nonsmokers)
          )
seTEl <- sqrt(1/lungcancer$d.smokers +
              1/lungcancer$d.nonsmokers + 2.25/lungcancer$d.nonsmokers)
#
metagen(TEl, seTEl, sm="IRR", studlab=lungcancer$study)


## Not run: 
##D #
##D # Meta-analysis using generalised linear mixed models
##D # (only if R packages 'metafor' and 'lme4' are available)
##D #
##D 
##D #
##D # Poisson regression model (fixed study effects)
##D #
##D m4 <- metainc(d.smokers, py.smokers, d.nonsmokers, py.nonsmokers,
##D               data = smoking, studlab = study, method = "GLMM")
##D m4
##D #
##D # Mixed-effects Poisson regression model (random study effects)
##D #
##D update(m4, model.glmm = "UM.RS", nAGQ = 1)
##D #
##D # Generalised linear mixed model (conditional Poisson-Normal)
##D #
##D update(m4, model.glmm = "CM.EL")
## End(Not run)




