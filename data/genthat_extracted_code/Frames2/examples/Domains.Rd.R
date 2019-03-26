library(Frames2)


### Name: Domains
### Title: Domains
### Aliases: Domains

### ** Examples

##########   Example 1   ##########
U <- c(13, 18, 20, 14, 9)
#Let build an auxiliary vector indicating whether values in U are above or below the mean.
aux <- c("Below", "Above", "Above", "Below", "Below")
#Now, only values below the mean remain, the other ones are turned zero.
Domains (U, aux, "Below")

##########   Example 2   ##########
data(DatA)
attach(DatA)
#Let calculate total feeding expenses corresponding to households in domain a.
sum (Domains (Feed, Domain, "a"))



