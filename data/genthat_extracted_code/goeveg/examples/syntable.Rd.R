library(goeveg)


### Name: syntable
### Title: Synoptic tables and calculation of fidelity and differential
###   species character
### Aliases: syntable

### ** Examples

## Synoptic table of Scheden vegetation data
library(cluster)
pam1 <- pam(schedenveg, 4)  # PAM clustering with 4 clusters output

## 1) unordered synoptic percentage frequency table
unordered <- syntable(schedenveg, pam1$clustering, abund = "perc",
                      type = "percfreq")
unordered                   # view results

## 2) differential species analysis
differential <- syntable(schedenveg, pam1$clustering, abund = "perc",
                         type = "diffspec")
# show complete table with differential character of species
differential$syntable
# list differential species for second cluster
differential$differentials$group2

## 3) Synoptic table with phi fidelity
phitable <- syntable(schedenveg, pam1$clustering, abund = "perc",
                     type = "phi")
phitable



