library(diagmeta)


### Name: diagmeta
### Title: Meta-analysis of diagnostic test accuracy studies with the
###   multiple cutoffs model
### Aliases: diagmeta

### ** Examples


# FENO dataset
#
data(Schneider2017)

diag1 <- diagmeta(tpos, fpos, tneg, fneg, cutpoint,
                  studlab = paste(author, year, group),
                  data = Schneider2017,
                  model = "DIDS", log.cutoff = TRUE)
                  
summary(diag1)
plot(diag1)




