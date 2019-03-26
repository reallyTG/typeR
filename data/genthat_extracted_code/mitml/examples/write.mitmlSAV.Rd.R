library(mitml)


### Name: write.mitmlSAV
### Title: Write 'mitml' objects to native SPSS format
### Aliases: write.mitmlSAV

### ** Examples

data(studentratings)

fml <- ReadDis + SES ~ ReadAchiev + (1|ID)
imp <- panImpute(studentratings, formula=fml, n.burn=1000, n.iter=100, m=5)

# write data file and SPSS syntax
write.mitmlSAV(imp, filename="imputation")



