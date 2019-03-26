library(mitml)


### Name: write.mitmlMplus
### Title: Write 'mitml' objects to Mplus format
### Aliases: write.mitmlMplus

### ** Examples

data(studentratings)

fml <- ReadDis + SES ~ ReadAchiev + (1|ID)
imp <- panImpute(studentratings, formula=fml, n.burn=1000, n.iter=100, m=5)

# write imputation files, index file, and log file
write.mitmlMplus(imp, filename="imputation", suffix="list", na.value=-999)



