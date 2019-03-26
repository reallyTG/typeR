library(diagmeta)


### Name: Schneider2017
### Title: Meta-analysis of studies of the diagnostic test accuracy of FENO
###   for diagnosis of asthma
### Aliases: Schneider2017
### Keywords: datasets

### ** Examples


# FENO dataset
#
data(Schneider2017)

diag1 <- diagmeta(tpos, fpos, tneg, fneg, cutpoint,
                  studlab = paste(author, year, group),
                  data = Schneider2017,
                  model = "DIDS", log.cutoff = TRUE)

plot(diag1)



