library(QCApro)


### Name: retention
### Title: Compute Retention Probabilities of QCA Baseline Solutions
### Aliases: retention
### Keywords: functions

### ** Examples

# replicate results from Hug (2013) for 2 deleted cases
#------------------------------------------------------
dat <- data.frame(matrix(c(
   rep(1,25),rep(0,20),rep(c(0,0,1,0,0),3),
   0,0,0,1,0,0,1,0,0,0,0,rep(1,7),0,1),
   nrow = 16, byrow = TRUE, dimnames = list(c(
    "AT","DK","FI","NO","SE","AU","CA","FR",
    "US","DE","NL","CH","JP","NZ","IE","BE"),
   c("P", "U", "C", "S", "W"))
))

retention(dat, outcome = "W", type = "deletion", assump = "dependent", n.pert = 2)



