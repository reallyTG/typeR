library(diagmeta)


### Name: summary.diagmeta
### Title: Summary method for diagmeta
### Aliases: summary.diagmeta

### ** Examples


# FENO dataset
#
data(Schneider2017)

diag1 <- diagmeta(tpos, fpos, tneg, fneg, cutpoint,
                  studlab = paste(author, year, group),
                  data = Schneider2017,
                  model = "DIDS", log.cutoff = TRUE)

summary(diag1)




