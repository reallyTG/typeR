library(simstudy)


### Name: defCondition
### Title: Add single row to definitions table of conditions that will be
###   used to add data to an existing definitions table
### Aliases: defCondition

### ** Examples

# New data set

def <- defData(varname = "x", dist = "noZeroPoisson", formula=5)
def <- defData(def, varname="y", dist="normal", formula=0, variance=9)

dt <- genData(10, def)

# Add columns to dt

defC <- defCondition(condition = "x == 1", formula = "5 + 2*y",
                     variance = 1,dist = "normal")

defC <- defCondition(defC, condition = "x <= 5 & x >= 2", formula = "3 - 2*y",
                     variance = 1, dist="normal")

defC <- defCondition(defC, condition = "x >= 6", formula = 1,
                     variance = 1, dist="normal")

defC

# Add conditional column with field name "z"

dt <- addCondition(defC, dt, "z")
dt



