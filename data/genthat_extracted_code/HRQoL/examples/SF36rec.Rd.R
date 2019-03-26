library(HRQoL)


### Name: SF36rec
### Title: Short Form-36 Health Survey recode
### Aliases: SF36rec

### ** Examples

set.seed(2)
# We simulate a variable bounded between 0 and 100.
BodyPain <- runif(1000,0,100)

# We specify that the simulated dimension corresponds
# with body pain dimension.
k <- 3

# We perform the recoding.
BodyPain.rec <- SF36rec(BodyPain,k)



