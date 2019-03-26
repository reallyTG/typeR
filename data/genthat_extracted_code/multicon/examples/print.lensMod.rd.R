library(multicon)


### Name: print.lensMod
### Title: Printing Lens Model Output
### Aliases: print.lensMod
### Keywords: Lens Model

### ** Examples


data(lensData)
DIAMONDS.in <- lensData[,32:39] # Self-ratings on 8 Situation Characteristics
DIAMONDS.ex <- lensData[,40:47] # Coder-ratings on 8 Situation Characteristics
CUES <- lensData[,3:31]         # Coded Situation Cues

mod <- lensModel(DIAMONDS.in, DIAMONDS.ex, CUES) # Get the lens statistics
print(mod)



