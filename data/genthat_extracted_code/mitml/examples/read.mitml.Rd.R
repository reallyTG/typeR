library(mitml)


### Name: read.mitml
### Title: Read 'mitml' objects from file
### Aliases: read.mitml

### ** Examples

data(studentratings)

fml <- ReadDis + SES ~ ReadAchiev + (1|ID)
imp <- panImpute(studentratings, formula=fml, n.burn=1000, n.iter=100, m=5)

# write 'mitml' object
write.mitml(imp, filename="imputation.R")

# read previously saved 'mitml' object
previous.imp <- read.mitml("imputation.R")

class(previous.imp)
previous.imp



