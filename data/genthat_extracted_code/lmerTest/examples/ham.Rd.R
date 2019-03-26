library(lmerTest)


### Name: ham
### Title: Conjoint Study of Dry Cured Ham
### Aliases: ham
### Keywords: datasets

### ** Examples


# Simple model for the ham data:
fm <- lmer(Informed.liking ~ Product*Information + (1|Consumer) , data=ham)

# Anova table for the fixed effects:
anova(fm)

## Not run: 
##D # Fit 'big' model:
##D fm <- lmer(Informed.liking ~ Product*Information*Gender*Age +
##D              + (1|Consumer) + (1|Consumer:Product) +
##D              (1|Consumer:Information),
##D            data=ham)
##D step_fm <- step(fm)
##D step_fm # Display elimination results
##D final_fm <- get_model(step_fm)
## End(Not run)




