library(intubate)


### Name: rpart
### Title: Interfaces for rpart package for data science pipelines.
### Aliases: ntbt_rpart
### Keywords: intubate magrittr rpart

### ** Examples

## Not run: 
##D library(intubate)
##D library(magrittr)
##D library(rpart)
##D 
##D ## rpart
##D ## Original function to interface
##D fit <- rpart(Kyphosis ~ Age + Number + Start, data = kyphosis)
##D fit2 <- rpart(Kyphosis ~ Age + Number + Start, data = kyphosis,
##D               parms = list(prior = c(.65,.35), split = "information"))
##D par(mfrow = c(1,2), xpd = NA) # otherwise on some devices the text is clipped
##D plot(fit)
##D text(fit, use.n = TRUE)
##D plot(fit2)
##D text(fit2, use.n = TRUE)
##D 
##D ## The interface reverses the order of data and formula
##D fit <- ntbt_rpart(data = kyphosis, Kyphosis ~ Age + Number + Start)
##D fit2 <- ntbt_rpart(data = kyphosis, Kyphosis ~ Age + Number + Start,
##D                    parms = list(prior = c(.65,.35), split = "information"))
##D 
##D par(mfrow = c(1,2), xpd = NA) # otherwise on some devices the text is clipped
##D plot(fit)
##D text(fit, use.n = TRUE)
##D plot(fit2)
##D text(fit2, use.n = TRUE)
##D 
##D ## so it can be used easily in a pipeline.
##D par(mfrow = c(1,2), xpd = NA) # otherwise on some devices the text is clipped
##D kyphosis %>%
##D   ntbt_rpart(Kyphosis ~ Age + Number + Start) %T>%
##D   plot() %>%
##D   text(use.n = TRUE)
##D kyphosis %>%
##D   ntbt_rpart(Kyphosis ~ Age + Number + Start,
##D              parms = list(prior = c(.65,.35), split = "information")) %T>%
##D   plot() %>%
##D   text(use.n = TRUE)
## End(Not run)



