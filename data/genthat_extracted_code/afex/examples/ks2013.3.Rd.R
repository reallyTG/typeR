library(afex)


### Name: ks2013.3
### Title: Data from Klauer & Singmann (2013, Experiment 3)
### Aliases: ks2013.3
### Keywords: dataset

### ** Examples

data("ks2013.3")

# replicate results reported in Klauer & Singmann (2013, p. 1270)

aov_ez("id", "response", ks2013.3, between = "condition",
       within = c("believability", "validity"))

aov_ez("id", "response", subset(ks2013.3, condition == "fixed"),
       within = c("believability", "validity"))

aov_ez("id", "response", subset(ks2013.3, condition == "random"),
       within = c("believability", "validity"))



