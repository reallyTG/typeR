library(HH)


### Name: interaction.positioned
### Title: interaction method for positioned factors.
### Aliases: interaction.positioned
### Keywords: dplot regression

### ** Examples

a <- positioned(letters[c(1,2,3,1,2,3)], value=c(1,4,9))
b <- positioned(LETTERS[c(4,4,4,5,5,5)], value=c(1,2))
a.b <- interaction.positioned(a, b)
a.b.2 <- interaction.positioned(a, b, b.scale=.2)
b.a <- interaction.positioned(b, a)



