library(JWileymisc)


### Name: logicals
### Title: Several logical range comparison helpers
### Aliases: logicals %gele% %gel% %gle% %gl% %sgele% %sgel% %sgle% %sgl%
###   %sge% %sg% %sle% %sl% %nin% %sin% %snin% %flipIn%

### ** Examples


1:5 %gele% c(2, 4)
1:5 %gele% c(4, 2) # order does not matter uses min / max

1:5 %gel% c(2, 4)
1:5 %gel% c(4, 2) # order does not matter uses min / max

1:5 %gle% c(2, 4)
1:5 %gle% c(4, 2) # order does not matter uses min / max

1:5 %gl% c(2, 4)
1:5 %gl% c(4, 2) # order does not matter uses min / max

1:5 %sgele% c(2, 4)
1:5 %sgele% c(4, 2) # order does not matter uses min / max

1:5 %sgel% c(2, 4)
1:5 %sgel% c(4, 2) # order does not matter uses min / max

1:5 %sgle% c(2, 4)
1:5 %sgle% c(4, 2) # order does not matter uses min / max

1:5 %sgl% c(2, 4)
1:5 %sgl% c(4, 2) # order does not matter uses min / max

1:5 %sge% 2
1:5 %sge% 4

1:5 %sg% 2
1:5 %sg% 4

1:5 %sle% 2
1:5 %sle% 4

1:5 %sl% 2
1:5 %sl% 4

1:5 %nin% c(2, 99)
c("jack", "jill", "john", "jane") %nin% c("jill", "jane", "bill")

1:5 %sin% c(2, 99)
c("jack", "jill", "john", "jane") %sin% c("jill", "jane", "bill")

1:5 %snin% c(2, 99)
c("jack", "jill", "john", "jane") %snin% c("jill", "jane", "bill")



