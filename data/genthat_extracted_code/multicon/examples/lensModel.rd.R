library(multicon)


### Name: lensModel
### Title: Lens Model Regressions
### Aliases: lensModel
### Keywords: Lens Model

### ** Examples


data(lensData)
DIAMONDS.in <- lensData[,32:39] # Self-ratings on 8 Situation Characteristics
DIAMONDS.ex <- lensData[,40:47] # Coder-ratings on 8 Situation Characteristics
CUES <- lensData[,3:31]         # Coded Situation Cues

mod <- lensModel(DIAMONDS.in, DIAMONDS.ex, CUES) # Get the lens statistics
mod$'Lens Stats' # View the overall stats
print(mod)       # View the individual coefficients and p-values




