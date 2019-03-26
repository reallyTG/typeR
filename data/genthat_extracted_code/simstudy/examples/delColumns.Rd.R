library(simstudy)


### Name: delColumns
### Title: Delete columns from existing data set
### Aliases: delColumns

### ** Examples

# New data set

def <- defData(varname = "x", dist = "noZeroPoisson", formula=7, id = "idnum")
def <- defData(def, varname="xUni", dist="uniformInt", formula="x-3;x+3")

dt <- genData(10, def)
dt

# Delete column

dt <- delColumns(dt, "x")
dt



