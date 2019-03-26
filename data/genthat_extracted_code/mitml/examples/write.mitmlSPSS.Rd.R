library(mitml)


### Name: write.mitmlSPSS
### Title: Write 'mitml' objects to SPSS compatible format
### Aliases: write.mitmlSPSS

### ** Examples

data(studentratings)

fml <- ReadDis + SES ~ ReadAchiev + (1|ID)
imp <- panImpute(studentratings, formula=fml, n.burn=1000, n.iter=100, m=5)

# write data file and SPSS syntax
write.mitmlSPSS(imp, filename="imputation", sep="\t", dec=".", na.value=-999,
locale="en_US")



