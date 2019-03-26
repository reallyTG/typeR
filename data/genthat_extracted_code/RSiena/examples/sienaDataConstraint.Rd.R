library(RSiena)


### Name: sienaDataConstraint
### Title: Function to change the values of the constraints between
###   networks.
### Aliases: sienaDataConstraint
### Keywords: classes

### ** Examples

nowFriends <- sienaDependent(array(c(s501, s502, s503), dim=c(50, 50, 3)))
ever <- array(c(s501, s502, s503), dim=c(50, 50, 3))
ever[,,2] <- pmax(ever[,,1], ever[,,2])
ever[,,3] <- pmax(ever[,,2], ever[,,3])
everFriends <- sienaDependent(ever)
# Note: this data set serves to illustrate this function,
# but it is not an appropriate data set for estimation by siena07,
# because everFriends (for the three waves together) depends deterministically
# on nowFriends (for the three waves together).
nowOrEver <- sienaDataCreate(nowFriends, everFriends)
attr(nowOrEver, "higher")
nowOrEver
nowOrEver.unconstrained <-
   sienaDataConstraint(nowOrEver, everFriends, nowFriends, "higher", FALSE)
nowOrEver.unconstrained
attr(nowOrEver.unconstrained, "higher")



