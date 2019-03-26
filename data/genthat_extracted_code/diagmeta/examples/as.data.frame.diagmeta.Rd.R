library(diagmeta)


### Name: as.data.frame.diagmeta
### Title: Extract data frame from diagmeta objects
### Aliases: as.data.frame.diagmeta

### ** Examples


# FENO dataset
#
data(Schneider2017)

diag1 <- diagmeta(tpos, fpos, tneg, fneg, cutpoint,
                  studlab = paste(author, year, group),
                  data = Schneider2017,
                  model = "DIDS", log.cutoff = TRUE)

as.data.frame(diag1)




