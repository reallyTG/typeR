library(DTAT)


### Name: seq.function
### Title: A seq method supporting custom-scaled plot axes.
### Aliases: seq.function

### ** Examples


# Provide evenly-spaced length-6 sequence from 100 to 1000,
# evenly spaced on a fourth-root scale:
seq(function(dose, a=4.0) dose^(1/a), from=100, to=1000, length.out=6, digits=0)




