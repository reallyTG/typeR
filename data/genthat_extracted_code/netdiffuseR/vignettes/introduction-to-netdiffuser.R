## ----Setup, echo=FALSE---------------------------------------------------
library(knitr)
knitr::opts_chunk$set(fig.width=9, fig.height=6, out.width="600px",fig.align = "center")

## ----Simulating diffnets-------------------------------------------------
library(netdiffuseR)
s <- 11532
set.seed(s)
diffnet_ran <- rdiffnet(200, 20, "random", seed.p.adopt = .1,
                        seed.graph = "small-world",
                        rgraph.args = list(undirected=FALSE, k=4, p=.5),
                        threshold.dist = function(x) 0.3)

set.seed(s)
diffnet_cen <- rdiffnet(200, 20, "central", seed.p.adopt = .1,
                        seed.graph = "small-world",
                        rgraph.args = list(undirected=FALSE, k=4, p=.5),
                        threshold.dist = function(x) 0.3)

set.seed(s)
diffnet_mar <- rdiffnet(200, 20, "marginal", seed.p.adopt = .1,
                        seed.graph = "small-world",
                        rgraph.args = list(undirected=FALSE, k=4, p=.5),
                        threshold.dist = function(x) 0.3)


## ------------------------------------------------------------------------
summary(diffnet_mar)

## ----Printing the networks-----------------------------------------------
diffnet_ran; diffnet_cen; diffnet_mar

## ----Seed graph and initial adopters, message=FALSE, fig.height=4--------
cols <- c("lightblue","green", "blue")

oldpar <- par(no.readonly = TRUE)
par(mfcol=c(1,3), mai = c(0, 0, 1, 0), mar = rep(1, 4) +  0.1)
set.seed(s);plot(diffnet_ran, main="Random seed")
set.seed(s);plot(diffnet_cen, main="Central seed")
coords <- set.seed(s);plot(diffnet_mar, main="Marginal seed")
par(oldpar)

## ------------------------------------------------------------------------
plot_diffnet(diffnet_ran, slices = c(1,4,8,12,16,20), layout=coords)

## ----Cumulative adopt count----------------------------------------------
plot_adopters(diffnet_ran, bg = cols[1], include.legend = FALSE, what="cumadopt")
plot_adopters(diffnet_cen, bg = cols[2], add=TRUE, what="cumadopt")
plot_adopters(diffnet_mar, bg = cols[3], add=TRUE, what="cumadopt")

legend("topleft", bty="n",
       legend = c("Random","Central", "Marginal"),
       fill=cols)

## ----Hazard rate---------------------------------------------------------
plot_hazard(diffnet_ran, ylim=c(0,1), bg=cols[1])
plot_hazard(diffnet_cen, add=TRUE, bg=cols[2])
plot_hazard(diffnet_mar, add=TRUE, bg=cols[3])

legend("topleft", bty="n",
       legend = c("Random","Central", "Marginal"),
       fill=cols)

## ----Infection and susceptibility----------------------------------------
plot_infectsuscep(diffnet_ran, bins=15, K=3, 
                  main = "Distribution of Infectiousness and\nSusceptibility (Random)")
plot_infectsuscep(diffnet_cen, bins=15, K=3, 
                  main = "Distribution of Infectiousness and\nSusceptibility (Central)")
plot_infectsuscep(diffnet_mar, bins=15, K=3, 
                  main = "Distribution of Infectiousness and\nSusceptibility (Marginal)")

## ----Threshold-----------------------------------------------------------
plot_threshold(diffnet_ran)

## ----Multiple-simulations------------------------------------------------
# Simulating a diffusion process with all the defaults but setting 
# -seed.nodes- to be random
set.seed(1)
ans0 <- rdiffnet_multiple(R=50, statistic=function(x) sum(!is.na(x$toa)),
                          n = 100, t = 4, seed.nodes = "random", stop.no.diff=FALSE)

# Simulating a diffusion process with all the defaults but setting 
# -seed.nodes- to be central
set.seed(1)
ans1 <- rdiffnet_multiple(R=50, statistic=function(x) sum(!is.na(x$toa)),
                          n = 100, t = 4, seed.nodes = "central", stop.no.diff=FALSE)

boxplot(cbind(Random = ans0, Central = ans1),
        main="Distribution of number of adopters in\ndifferent seedscenarios",
        sub = "(50 simulations each)", ylab="Number of adopters")

