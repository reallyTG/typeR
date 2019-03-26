library(QCA)


### Name: retention
### Title: Compute the retention probability of a csQCA solution
### Aliases: retention
### Keywords: functions

### ** Examples

# the replication data, see Thiem, Spohel and Dusa (2015)
dat <- data.frame(matrix(c(
    rep(1,25), rep(0,20), rep(c(0,0,1,0,0),3),
    0,0,0,1,0,0,1,0,0,0,0, rep(1,7),0,1),
    nrow = 16, byrow = TRUE, dimnames = list(
    c("AT","DK","FI","NO","SE","AU","CA","FR",
      "US","DE","NL","CH","JP","NZ","IE","BE"),
    c("P", "U", "C", "S", "W"))
))


# calculate the retention probability, for 2.5% probability of data corruption
# under the IPA - independent perturbation assuption
retention(dat, outcome = "W", incl.cut = 1, type = "corruption",
       dependent = FALSE, p.pert = 0.025)

# the probability that a csQCA solution will change
1 - retention(dat, outcome = "W", incl.cut = 1, type = "corruption",
       dependent = FALSE, p.pert = 0.025)




