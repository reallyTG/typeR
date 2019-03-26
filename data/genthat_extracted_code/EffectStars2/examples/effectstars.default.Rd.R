library(EffectStars2)


### Name: effectstars.default
### Title: Plot effect stars.
### Aliases: effectstars.default effectstars

### ** Examples

## Not run: 
##D #####################
##D ### Simple example for basic effectstars function
##D p <- 4; k <- 5
##D coefs <- matrix(exp(rnorm(p*k,sd=0.5)),ncol=k)
##D rownames(coefs) <- paste("Variable",1:p)
##D colnames(coefs) <- paste("Cat",1:k)
##D effectstars(coefs)
##D 
##D #####################
##D ### Example for effect stars for a multivariate logit model
##D data(xs.nz, package = "VGAMdata")
##D xs.nz$age <- scale(xs.nz$age)
##D library(VGAM)
##D 
##D cats_dogs <- vglm(cbind(cat, dog) ~ age +  sex + marital, 
##D                   data = xs.nz, family = binom2.or(zero = NULL))
##D 
##D summary(cats_dogs)
##D 
##D ## quick and dirty
##D effectstars(exp(coef(cats_dogs, matrix = TRUE)))
##D 
##D 
##D ## make it pretty
##D # create the effects matrix you want to plot, name rows and columns
##D effects <- exp(coef(cats_dogs, matrix = TRUE))
##D colnames(effects) <- c("cat", "dog", "OR")
##D rownames(effects) <- c("Intercept", "Age", "Gender", rep("Marital", 3))
##D 
##D # create subtitles containing category labels of predictors
##D subs <- c(rep("",2), "(male)", "(married)", "(separated/divorced)", "(widowed)")
##D 
##D # create labels containing the response categories and all p-values
##D p_values <- formatC(summary(cats_dogs)@coef3[,4], format="f", digits=3)
##D labels <- matrix(paste0(rep(c("cat", "dog", "OR"), nrow(effects)), "\n(", p_values, ")"),
##D byrow = TRUE, ncol = 3)
##D 
##D # plot effectstars
##D effectstars(effects, labels = labels, subs = subs)
##D 
##D 
##D #####################
##D ## Example for method effectstars.vglm for a multinomial logit model calculated in VGAM
##D data(election) 
##D library(VGAM)
##D m_elect <- vglm(Partychoice ~ Gender + West + Age + Union + Highschool + Unemployment
##D + Pol.Interest + Democracy + Religion, family = multinomial(), data = election)
##D effectstars(m_elect)
## End(Not run)



