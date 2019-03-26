library(psycho)


### Name: model_to_priors
### Title: Model to Prior.
### Aliases: model_to_priors

### ** Examples

## Not run: 
##D library(rstanarm)
##D library(psycho)
##D 
##D fit <- stan_glm(Sepal.Length ~ Petal.Width, data = iris)
##D priors <- model_to_priors(fit)
##D update(fit, prior = priors$prior)
##D 
##D fit <- stan_glmer(Subjective_Valence ~ Emotion_Condition + (1 | Participant_ID),
##D   data = psycho::emotion
##D )
##D priors <- model_to_priors(fit)
##D 
##D fit1 <- stan_glm(Subjective_Valence ~ Emotion_Condition,
##D   data = filter(psycho::emotion, Participant_ID == "1S")
##D )
##D 
##D fit2 <- stan_glm(Subjective_Valence ~ Emotion_Condition,
##D   data = filter(psycho::emotion, Participant_ID == "1S"),
##D   prior = priors$prior, prior_intercept = priors$prior_intercept
##D )
## End(Not run)




