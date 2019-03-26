library(entropart)


### Name: DivProfile
### Title: Diversity Profile of a metacommunity
### Aliases: DivProfile is.DivProfile plot.DivProfile summary.DivProfile

### ** Examples

# Load Paracou data (number of trees per species in two 1-ha plot of a tropical forest)
data(Paracou618)
# Estimate diversity.
Profile <- DivProfile(q.seq = seq(0, 2, 0.1), Paracou618.MC, Biased = FALSE)
plot(Profile)
summary(Profile)



