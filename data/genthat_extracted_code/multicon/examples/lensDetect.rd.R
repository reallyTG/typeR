library(multicon)


### Name: lensDetect
### Title: Signal Detection Analyses for Lens Model Output
### Aliases: lensDetect
### Keywords: Lens Model Signal Detection

### ** Examples


data(lensData)
DIAMONDS.in <- lensData[,32:39] # Self-ratings on 8 Situation Characteristics
DIAMONDS.ex <- lensData[,40:47] # Coder-ratings on 8 Situation Characteristics
CUES <- lensData[,3:31]         # Coded Situation Cues

mod <- lensModel(DIAMONDS.in, DIAMONDS.ex, CUES) # Get the lens statistics
lensDetect(mod)



