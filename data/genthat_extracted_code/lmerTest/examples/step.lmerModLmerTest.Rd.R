library(lmerTest)


### Name: step.lmerModLmerTest
### Title: Backward Elimination for Linear Mixed Models
### Aliases: step.lmerModLmerTest get_model.step_list

### ** Examples


# Fit a model to the ham dataset:
fm <- lmer(Informed.liking ~ Product*Information+
             (1|Consumer) + (1|Product:Consumer)
           + (1|Information:Consumer), data=ham)

# Backward elimination using terms with default alpha-levels:
(step_res <- step(fm))
final <- get_model(step_res)
anova(final)

## Not run: 
##D # Fit 'big' model:
##D fm <- lmer(Informed.liking ~ Product*Information*Gender*Age +
##D              + (1|Consumer) + (1|Consumer:Product) +
##D              (1|Consumer:Information), data=ham)
##D step_fm <- step(fm)
##D step_fm # Display elimination results
##D final_fm <- get_model(step_fm)
## End(Not run)




