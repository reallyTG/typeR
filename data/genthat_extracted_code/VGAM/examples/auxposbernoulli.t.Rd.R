library(VGAM)


### Name: aux.posbernoulli.t
### Title: Auxiliary Function for the Positive Bernoulli Family Function
###   with Time Effects
### Aliases: aux.posbernoulli.t
### Keywords: models regression

### ** Examples

# Fit a M_tbh model to the deermice data:
(pdata <- aux.posbernoulli.t(with(deermice, cbind(y1, y2, y3, y4, y5, y6))))

deermice <- data.frame(deermice,
                    bei = 0,  # Add this
                    pdata$cap.hist1)  # Incorporate these
head(deermice)  # Augmented with behavioural effect indicator variables
tail(deermice)



