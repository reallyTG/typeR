library(phenology)


### Name: Tagloss_model
### Title: Return the daily rate of tag loss.
### Aliases: Tagloss_model

### ** Examples

library(phenology)
## Not run: 
##D # Example
##D t <- 1:1000
##D par <- c(D1=200, D2D1=100, D3D2=200, 
##D          A=-logit(0.02), B=-logit(0.05), C=-logit(0.07))
##D y <- Tagloss_model(t, par)
##D plot(x=t, y, type="l")
## End(Not run)



