library(mitml)


### Name: write.mitml
### Title: Write 'mitml' objects to file
### Aliases: write.mitml

### ** Examples

data(studentratings)

fml <- ReadDis + SES ~ ReadAchiev + (1|ID)
imp <- panImpute(studentratings, formula=fml, n.burn=1000, n.iter=100, m=5)

# write full 'mitml' object (default)
write.mitml(imp, filename="imputation.R")

# drop parameters of the imputation model
write.mitml(imp, filename="imputation.R", drop=TRUE)



