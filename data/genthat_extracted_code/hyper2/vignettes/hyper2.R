### R code from vignette source 'hyper2.Rnw'

###################################################
### code chunk number 1: set_seed_chunk
###################################################
set.seed(0)


###################################################
### code chunk number 2: time_saver
###################################################
calc_from_scratch <- FALSE


###################################################
### code chunk number 3: hyper2.Rnw:101-102
###################################################
ignore <- require(magrittr,quietly=TRUE)


###################################################
### code chunk number 4: setupchess
###################################################
library("hyper2")
chess <- hyper2(list(1,2,3),c(30,36,22))
chess


###################################################
### code chunk number 5: chess_denominator
###################################################
chess[c(1,2)] <- -35
chess[c(2,3)] <- -35
chess[c(1,3)] <- -18
chess


###################################################
### code chunk number 6: use_chess
###################################################
chess[c(2,1)]


###################################################
### code chunk number 7: chess_pnames
###################################################
pnames(chess) <- c("Topalov","Anand","Karpov")
chess


###################################################
### code chunk number 8: loglikelihoodchess
###################################################
loglik(chess,c(1/3,1/3))


###################################################
### code chunk number 9: gradientloglikelihoodchess
###################################################
gradient(chess,c(1/3,1/3))


###################################################
### code chunk number 10: maxlikechess
###################################################
maxp(chess)


###################################################
### code chunk number 11: 2016_olympics_heat1_setup
###################################################
data("rowing")
H <- hyper2(pnames=allrowers)
H


###################################################
### code chunk number 12: 2016_olympics_heat1_first
###################################################
heat1 <- c("fournier", "cabrera", "bhokanal", "saensuk", "kelmelis", "teilemb")
H <- H + order_likelihood(char2num(heat1,allrowers))
H


###################################################
### code chunk number 13: rowers
###################################################
head(sculls2016)


###################################################
### code chunk number 14: rowing_maxp
###################################################
dotchart(maxp(sculls2016))


###################################################
### code chunk number 15: setupteams
###################################################
team_red <- c("Jamie","Tracy","Ben","Amy","Renae","Georgia")
team_blue <- c("Brent","Laura","Emelia","Colin","Kira","Tash")


###################################################
### code chunk number 16: masterchef_example
###################################################
H <- hyper2(pnames = c(
                "Amy", "Ben", "Brent", "Colin", "Emelia",
                "Georgia", "Jamie", "Kira", "Laura", "Renae",
                "Sarah", "Tash", "Tracy"))
H


###################################################
### code chunk number 17: redteamwins
###################################################
H[team_red] <- +1
H[c(team_red,team_blue)] <- -1
H


###################################################
### code chunk number 18: teamchallenge
###################################################
blue   <- c("Laura","Jamie")   # first
yellow <- c("Emelia","Amy")    # second
green  <- c("Brent","Tracy")   # third
red    <- c("Ben","Renae")     # fourth

H[blue] <- 1
H[c(blue,yellow,green,red)] <- -1
H[yellow] <- 1
H[c(yellow,green,red)] <- -1
H[green] <- 1
H[c(green,red)] <- -1
H


###################################################
### code chunk number 19: hyper2.Rnw:599-603
###################################################
L <- ggol(H, 
          winner     = "Laura",
          btm4       = c("Brent", "Tracy","Ben"),
          eliminated = "Renae")


###################################################
### code chunk number 20: like_series
###################################################
data("masterchef")
n <- 13   # 13 players
equal_strengths <- rep(1/n,n-1)
like_series(equal_strengths, masterchef_series6)


###################################################
### code chunk number 21: unconstrained_optimization (eval = FALSE)
###################################################
## UI = rbind(diag(n-1),-1)  # p_i >= 0
## CI = c(rep(0,n-1),-1)     # p_1+...+p_{n-1} <= 1
## 
## constrOptim(
##     theta = equal_strengths,
##     f = function(p){-like_series(p,L)}, 
##     ui=UI, ci=CI,
##     grad=NULL)


###################################################
### code chunk number 22: maxp_masterchef
###################################################
pmax_masterchef6
dotchart(pmax_masterchef6)


###################################################
### code chunk number 23: like_series
###################################################
like_series(indep(pmax_masterchef6), masterchef_series6)


###################################################
### code chunk number 24: pvalcalcequalstrengths
###################################################
pchisq(2*(78.7-66.2),df=12,lower.tail=FALSE)


###################################################
### code chunk number 25: brent.gt.laura (eval = FALSE)
###################################################
## UI = rbind(UI,c(0,0,1,0,0,0,0,0,-1,0,0,0,0))  # Brent >= Laura
## CI <- c(CI,0)
## ans2 <-
## constrOptim(
##     theta = equal_strengths,
##     f = function(p){-like_series(p,L)},  # 'L' created by ggol() above
##     grad=NULL,
##     ui = UI, ci=CI)


###################################################
### code chunk number 26: hyper2.Rnw:764-765
###################################################
like_series(indep(pmax_masterchef6_constrained), masterchef_series6)


