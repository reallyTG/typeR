library(prefmod)


### Name: patt.design
### Title: Paired Comparison Patterns - Design Matrix Generation
### Aliases: patt.design
### Keywords: models regression

### ** Examples

# mini example with three Likert items and two subject covariates
dsgnmat <- patt.design(xmpl, nitems = 3, resptype = "rating",
      ia = TRUE, cov.sel = "ALL")
head(dsgnmat)


# ILLUSTRATING THE ISSP2000 EXAMPLE
# simplified version of the analysis as given in Dittrich et. al (2007).
design <- patt.design(issp2000, nitems = 6, resptype = "rating",
      cov.sel = c("SEX", "EDU"))


# - fit null multinomial model (basic model for items without subject
#     covariates) through Poisson distribution.
# - SEX:EDU parameters are nuisance parameters
# - the last item (GENE) becomes a reference item in the model and is aliased;
#     all other items are compared to this last item

# item parameters with undecided effects and no covariate effects.
summary(glm(y ~ SEX*EDU
  + CAR+IND+FARM+WATER+TEMP+GENE
  + u12+u13+u23+u14+u24+u34+u15+u25+u35+u45+u16+u26+u36+u46+u56,
  data = design, family = poisson))

# now add main effect of SEX on items
summary(glm(y ~ SEX:EDU
  + CAR+IND+FARM+WATER+TEMP+GENE
  + (CAR+IND+FARM+WATER+TEMP+GENE):SEX
  + u12+u13+u23+u14+u24+u34+u15+u25+u35+u45+u16+u26+u36+u46+u56,
  data = design, family = poisson))



