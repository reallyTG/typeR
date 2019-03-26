library(gnm)


### Name: backPain
### Title: Data on Back Pain Prognosis, from Anderson (1984)
### Aliases: backPain
### Keywords: datasets

### ** Examples

set.seed(1)
summary(backPain)

### Re-express as count data
backPainLong <- expandCategorical(backPain, "pain")

### Fit models described in Table 5 of Anderson (1984)

### Logistic family models
noRelationship <- gnm(count ~ pain, eliminate = id,
                      family = "poisson", data = backPainLong)

## stereotype model
oneDimensional <- update(noRelationship,
                         ~ . + Mult(pain, x1 + x2 + x3))

## multinomial logistic
threeDimensional <- update(noRelationship, ~ . + pain:(x1 + x2 + x3))

### Models to determine distinguishability in stereotype model
## constrain scale of category-specific multipliers
oneDimensional <- update(noRelationship,
                         ~ . + Mult(pain, offset(x1) + x2 + x3))
## obtain identifiable contrasts & id possibly indistinguishable slopes
getContrasts(oneDimensional, pickCoef(oneDimensional, "[.]pain"))

## Not run: 
##D ## (this part not needed for package testing)
##D ## fit simpler models and compare 
##D .pain <- backPainLong$pain
##D 
##D levels(.pain)[2:3] <- paste(levels(.pain)[2:3], collapse = " | ")
##D fiveGroups <- update(noRelationship,
##D                      ~ . + Mult(.pain, x1 + x2 + x3))
##D 
##D levels(.pain)[4:5] <- paste(levels(.pain)[4:5], collapse = " | ")
##D fourGroups <- update(fiveGroups)
##D 
##D levels(.pain)[2:3] <- paste(levels(.pain)[2:3], collapse = " | ")
##D threeGroups <- update(fourGroups)
##D 
##D ### Grouped continuous model, aka proportional odds model
##D library(MASS)
##D sixCategories <- polr(pain ~ x1 + x2 + x3, data = backPain)
##D 
##D ### Obtain number of parameters and log-likelihoods for equivalent
##D ### multinomial models as presented in Anderson (1984)
##D logLikMultinom <- function(model, size){
##D     object <- get(model)
##D     if (inherits(object, "gnm")) {
##D         l <- sum(object$y * log(object$fitted/size))
##D         c(nParameters = object$rank - nlevels(object$eliminate),
##D           logLikelihood = l)
##D     }
##D     else
##D         c(nParameters = object$edf, logLikelihood = -deviance(object)/2)
##D }
##D size <- tapply(backPainLong$count, backPainLong$id, sum)[backPainLong$id]
##D models <- c("threeDimensional", "oneDimensional", "noRelationship",
##D             "fiveGroups", "fourGroups", "threeGroups", "sixCategories")
##D t(sapply(models, logLikMultinom, size))
## End(Not run)



