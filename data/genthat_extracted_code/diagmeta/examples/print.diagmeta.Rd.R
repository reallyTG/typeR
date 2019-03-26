library(diagmeta)


### Name: print.diagmeta
### Title: Print method for diagmeta objects
### Aliases: print.diagmeta

### ** Examples


# FENO dataset
#
data(Schneider2017)

diag1 <- diagmeta(tpos, fpos, tneg, fneg, cutpoint,
                  studlab = paste(author, year, group),
                  data = Schneider2017,
                  model = "DIDS", log.cutoff = TRUE)

diag1




