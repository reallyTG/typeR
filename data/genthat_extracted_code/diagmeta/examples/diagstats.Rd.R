library(diagmeta)


### Name: diagstats
### Title: Calculate statistical measures of test performance for objects
###   of class 'diagmeta'
### Aliases: diagstats

### ** Examples


# FENO dataset
#
data(Schneider2017)

diag1 <- diagmeta(tpos, fpos, tneg, fneg, cutpoint,
                  studlab = paste(author, year, group),
                  data = Schneider2017, 
                  model = "DIDS", log.cutoff = TRUE)

# Results at the optimal cutoff
#
diagstats(diag1)

# Results for cutoffs 25 and 50 (and a prevalence of 10%)
#
diagstats(diag1, c(25, 50), prevalence = 0.10)

# Results for sensitivity and specificity of 0.95
#
diagstats(diag1, sens = 0.95, spec = 0.95)




