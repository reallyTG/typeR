library(psychotools)


### Name: StereotypeThreat
### Title: Stereotype Threat in Dutch Differential Aptitude Test
### Aliases: StereotypeThreat
### Keywords: datasets

### ** Examples

## Data: Load and include/order wrt group variable
data("StereotypeThreat", package = "psychotools")
StereotypeThreat <- transform(StereotypeThreat, group = interaction(ethnicity, condition))
StereotypeThreat <- StereotypeThreat[order(StereotypeThreat$group),]

## Exploratory analysis (Table 2, p. 703)
tab2 <- with(StereotypeThreat, rbind(
   "#"         = tapply(numerical, group, length),
   "Numerical" = tapply(numerical, group, mean),
   "         " = tapply(numerical, group, sd),
   "Abstract " = tapply(abstract,  group, mean),
   "         " = tapply(abstract,  group, sd),
   "Verbal   " = tapply(verbal,    group, mean),
   "         " = tapply(verbal,    group, sd)))
round(tab2, digits = 2)

## Corresponding boxplots
plot(numerical ~ group, data = StereotypeThreat)
plot(abstract  ~ group, data = StereotypeThreat)
plot(verbal    ~ group, data = StereotypeThreat)

## MANOVA (p. 703)
m <- lm(cbind(numerical, abstract, verbal) ~ ethnicity * condition, data = StereotypeThreat)
anova(m, update(m, . ~ . - ethnicity:condition))
## corresponding univariate results
printCoefmat(t(sapply(summary(m),
  function(x) x$coefficients["ethnicityminority:conditionthreat", ])))

## MGCFA (Table 3, p. 704)
## can be replicated using package lavaan
## Not run: 
##D ## convenience function for multi-group CFA on this data
##D mgcfa <- function(model, ...) cfa(model, data = StereotypeThreat,
##D   group = "group", likelihood = "wishart", start = "simple", ...)
##D 		 
##D ## list of all 9 models
##D m <- vector("list", length = 9)
##D names(m) <- c("m2", "m2a", "m3", "m3a", "m4", "m5", "m5a", "m5b", "m6")
##D 
##D ## Step 2: Fix loadings across groups
##D f <- 'ability =~ abstract + verbal + numerical'
##D m$m2 <- mgcfa(f, group.equal = "loadings")
##D 
##D ## Step 2a: Free numerical loading in group 4 (minority.threat)
##D f <- 'ability =~ abstract + verbal + c(l1, l1, l1, l4) * numerical'
##D m$m2a <- mgcfa(f, group.equal = "loadings")
##D 
##D ## Step 3: Fix variances across groups
##D m$m3 <- mgcfa(f, group.equal = c("loadings", "residuals"))
##D 
##D ## Step 3a: Free numerical variance in group 4
##D f <- c(f, 'numerical ~~ c(e1, e1, e1, e4) * numerical')
##D m$m3a <- mgcfa(f, group.equal = c("loadings", "residuals"))
##D 
##D ## Step 4: Fix latent variances within conditions
##D f <- c(f, 'ability ~~ c(vmaj, vmin, vmaj, vmin) * ability')
##D m$m4 <- mgcfa(f, group.equal = c("loadings", "residuals"))
##D 
##D ## Step 5: Fix certain means, free others
##D f <- c(f, 'numerical ~ c(na1, na1, na1, na4) * 1')
##D m$m5 <- mgcfa(f, group.equal = c("loadings", "residuals", "intercepts"))
##D 
##D ## Step 5a: Free ability mean in group majority.control
##D f <- c(f, 'abstract ~ c(ar1, ar2, ar2, ar2) * 1')
##D m$m5a <- mgcfa(f, group.equal = c("loadings", "residuals", "intercepts"))
##D 
##D ## Step 5b: Free also ability mean in group minority.control
##D f <- c(f[1:4], 'abstract ~ c(ar1, ar2, ar3, ar3) * 1')
##D m$m5b <- mgcfa(f, group.equal = c("loadings", "residuals", "intercepts"))
##D 
##D ## Step 6: Different latent mean structure
##D f <- c(f, 'ability ~  c(maj, min, maj, min) * 1 + c(0, NA, 0, NA) * 1')
##D m$m6 <- mgcfa(f, group.equal = c("loadings", "residuals", "intercepts"))
##D 
##D ## Extract measures of fit
##D tab <- t(sapply(m, fitMeasures, c("chisq", "df", "pvalue", "rmsea", "cfi")))
##D tab <- rbind("1" = c(0, 0, 1, 0, 1), tab)
##D tab <- cbind(tab,
##D   delta_chisq = c(NA, abs(diff(tab[, "chisq"]))),
##D   delta_df = c(NA, diff(tab[, "df"])))
##D tab <- cbind(tab, "pvalue2" = pchisq(tab[, "delta_chisq"],
##D   abs(tab[, "delta_df"]), lower.tail = FALSE))
##D tab <- tab[, c(2, 1, 3, 7, 6, 8, 4, 5)]
##D round(tab, digits = 3)
## End(Not run)



