library(cobalt)


### Name: bal.tab.df.formula
### Title: Balance Statistics for Data Sets
### Aliases: bal.tab.data.frame bal.tab.formula

### ** Examples

data("lalonde", package = "cobalt")
lalonde$p.score <- glm(treat ~ age + educ + race, data = lalonde, 
            family = "binomial")$fitted.values
covariates <- subset(lalonde, 
                     select = c(age, educ, race))
                     
## Propensity score weighting using IPTW
lalonde$iptw.weights <- ifelse(lalonde$treat==1, 
                               1/lalonde$p.score, 
                               1/(1-lalonde$p.score))

# data frame interface:
bal.tab(covariates, treat = "treat", data = lalonde, 
      weights = "iptw.weights", method = "weighting", 
      s.d.denom = "pooled")

# Formula interface:
bal.tab(treat ~ age + educ + race, data = lalonde, 
      weights = "iptw.weights", method = "weighting", 
      s.d.denom = "pooled")
      
## Propensity score subclassification
lalonde$subclass <- findInterval(lalonde$p.score, 
                        quantile(lalonde$p.score, 
                        (0:6)/6), all.inside = TRUE)

# data frame interface:
bal.tab(covariates, treat = "treat", data = lalonde, 
      subclass = "subclass", method = "subclassification", 
      disp.subclass = TRUE, s.d.denom = "pooled")

# Formula interface:
bal.tab(treat ~ age + educ + race, data = lalonde, 
      subclass = "subclass", method = "subclassification", 
      disp.subclass = TRUE, s.d.denom = "pooled")



