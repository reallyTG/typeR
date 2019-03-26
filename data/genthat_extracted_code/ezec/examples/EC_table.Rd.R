library(ezec)


### Name: EC_table
### Title: Function to generate a table of EC values from a data frame of
###   multiple isolates.
### Aliases: EC_table

### ** Examples

data(dummydata)
# Using 3 parameter Log-Logistic Model (default)
EC_table(dummydata, form = response ~ dose)

# Using 4 parameter Weibull Model.
EC_table(dummydata, form = response ~ dose, model = "W2.4")

# This function really only needs three columns.
newdat <- dummydata[c("ID", "dose", "response")]
EC_table(newdat, form = response ~ dose)

# We can rename them, too.
colnames(newdat) <- c("identity", "dosage", "growth")
EC_table(newdat, form = growth ~ dosage, idcol = "identity")



