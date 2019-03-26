library(BSDA)


### Name: Selfdefe
### Title: Self-confidence scores for 9 women before and after instructions
###   on self-defense
### Aliases: Selfdefe
### Keywords: datasets

### ** Examples


Selfdefe$differ <- Selfdefe$after - Selfdefe$before
Selfdefe
t.test(Selfdefe$differ, alternative = "greater")
t.test(Selfdefe$after, Selfdefe$before, 
       paired = TRUE, alternative = "greater")




