library(Rdice)


### Name: is.nonTransitive
### Title: Checks truth value of non-transitive sets of dice.
### Aliases: is.nonTransitive

### ** Examples

df <- data.frame(
  die1 = c(5,4,6,15),
  die2 = c(3,6,16,2),
  die3 = c(0,2,14,15),
  die4 = c(8,10,1,9)
)

is.nonTransitive(df, prob = 9/16)



