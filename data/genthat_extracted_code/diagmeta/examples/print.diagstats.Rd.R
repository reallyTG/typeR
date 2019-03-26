library(diagmeta)


### Name: print.diagstats
### Title: Print method for diagstats objects
### Aliases: print.diagstats

### ** Examples


# FENO dataset
#
data(Schneider2017)

diag1 <- diagmeta(tpos, fpos, tneg, fneg, cutpoint,
                  studlab = paste(author, year, group),
                  data = Schneider2017, 
                  model = "DIDS", log.cutoff = TRUE)

# Values for prevalence 10% at cutoffs 25 and 50
#
ds1 <- diagstats(diag1, c(25, 50), 0.10)

ds1

print(ds1, predicted = FALSE)




