library(eiCompare)


### Name: ei_rc_congruence
### Title: Congruence for 2x2
### Aliases: ei_rc_congruence

### ** Examples


# LA County 2010 Insurance Commissioner Race
#ei_rc_combine <- ei_rc_good_table(results, ei_bayes_res, 
#                                  groups= c("Latino", "Non Latino"))

load ( system.file("extdata/congruence_table.RData",package="eiCompare") )

ei_rc_congruence(ei_rc_combine2_2, c(1,4), c(1,4)) 




