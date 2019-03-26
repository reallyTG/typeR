library(BradleyTerry2)


### Name: CEMS
### Title: Dittrich, Hatzinger and Katzenbeisser (1998, 2001) Data on
###   Management School Preference in Europe
### Aliases: CEMS
### Keywords: datasets

### ** Examples


##
##  Fit the standard Bradley-Terry model, using the simple 'add 0.5'
##  method to handle ties:
##
table3.model <-  BTm(outcome = cbind(win1.adj, win2.adj),
                     player1 = school1, player2 = school2,
                     formula = ~.. , refcat = "Stockholm",
                     data = CEMS)
##  The results in Table 3 of Dittrich et al (2001) are reproduced
##  approximately by a simple re-scaling of the estimates:
table3 <- summary(table3.model)$coef[, 1:2]/1.75
print(table3)
##
##  Now fit the 'final model' from Table 6 of Dittrich et al.:
##
table6.model <-  BTm(outcome = cbind(win1.adj, win2.adj),
                     player1 = school1, player2 = school2,
                     formula = ~ .. +
                         WOR[student] * Paris[..] +
                         WOR[student] * Milano[..] +
                         WOR[student] * Barcelona[..] +
                         DEG[student] * St.Gallen[..] +
                         STUD[student] * Paris[..] +
                         STUD[student] * St.Gallen[..] +
                         ENG[student] * St.Gallen[..] +
                         FRA[student] * London[..] +
                         FRA[student] * Paris[..] +
                         SPA[student] * Barcelona[..] +
                         ITA[student] * London[..] +
                         ITA[student] * Milano[..] +
                         SEX[student] * Milano[..],
                     refcat = "Stockholm",
                     data = CEMS)
##
##  Again re-scale to reproduce approximately Table 6 of Dittrich et
##  al. (2001):
##
table6 <- summary(table6.model)$coef[, 1:2]/1.75
print(table6)
##
## Not run: 
##D ##  Now the slightly simplified model of Table 8 of Dittrich et al. (2001):
##D ##
##D table8.model <-  BTm(outcome = cbind(win1.adj, win2.adj),
##D                      player1 = school1, player2 = school2,
##D                      formula = ~ .. +
##D                          WOR[student] * LAT[..] +
##D                          DEG[student] * St.Gallen[..] +
##D                          STUD[student] * Paris[..] +
##D                          STUD[student] * St.Gallen[..] +
##D                          ENG[student] * St.Gallen[..] +
##D                          FRA[student] * London[..] +
##D                          FRA[student] * Paris[..] +
##D                          SPA[student] * Barcelona[..] +
##D                          ITA[student] * London[..] +
##D                          ITA[student] * Milano[..] +
##D                          SEX[student] * Milano[..],
##D                      refcat = "Stockholm",
##D                      data = CEMS)
##D table8 <- summary(table8.model)$coef[, 1:2]/1.75
##D ##
##D ##  Notice some larger than expected discrepancies here (the coefficients
##D ##  named "..Barcelona", "..Milano" and "..Paris") from the results in
##D ##  Dittrich et al. (2001).  Apparently a mistake was made in Table 8 of
##D ##  the published Corrigendum note (R. Dittrich personal communication,
##D ##  February 2010).
##D ##
##D print(table8)
## End(Not run)




