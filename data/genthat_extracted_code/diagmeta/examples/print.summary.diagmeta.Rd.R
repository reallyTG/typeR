library(diagmeta)


### Name: print.summary.diagmeta
### Title: Print method for summary of diagmeta objects
### Aliases: print.summary.diagmeta

### ** Examples


# FENO dataset
#
data(Schneider2017)

diag1 <- diagmeta(tpos, fpos, tneg, fneg, cutpoint,
                  studlab = paste(author, year, group),
                  data = Schneider2017,
                  model = "DIDS", log.cutoff = TRUE)

summary(diag1)
print(summary(diag1), digits = 2)




