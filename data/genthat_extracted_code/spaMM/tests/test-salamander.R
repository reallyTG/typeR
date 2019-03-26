cat("\ntest salamander:")
# salamander

data("salamander")
salam <- HLfit(cbind(Mate,1-Mate)~TypeF+TypeM+TypeF*TypeM+(1|Female)+(1|Male),
      family=binomial(),data=salamander,HLmethod="ML",control.HLfit = list(LevenbergM=FALSE))

testthat::expect_equal(salam$APHLs$p_v,-209.2766,tolerance=1e-4)
