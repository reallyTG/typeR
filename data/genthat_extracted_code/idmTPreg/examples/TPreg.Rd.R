library(idmTPreg)


### Name: TPreg
### Title: Regression Modeling of Transition Probabilities in a Progressive
###   Illness-Death Model
### Aliases: TPreg

### ** Examples

data(colonTPreg)

co11 <- TPreg( ~ Age + Nodes + treatment, colonTPreg, link = "logit", s = 50, R = 19, t = 200,
trans = "11", ncores = 1)
co11
summary(co11)



