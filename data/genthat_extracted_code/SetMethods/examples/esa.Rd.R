library(SetMethods)


### Name: esa
### Title: Function that performs the Enhanced Standard Analysis.
### Aliases: esa
### Keywords: QCA

### ** Examples

# Import your data. For example:

data(SCHF)

# Get the truth table for the presence of the outcome:

TT_y <- truthTable(SCHF, outcome = "EXPORT",
                   conditions = c("EMP","BARGAIN","UNI","OCCUP","STOCK", "MA"),
                   incl.cut = .9,
                   complete = TRUE,
                   PRI = TRUE,
                   sort.by = c("out", "incl", "n"))

# Exclude condition STOCK + MA and condition EMP as necessary for EXPORT
# Exclude all remainder rows containing the combination BARGAIN*~OCCUP
# Exclude the rows "19", "14", "46", "51" as contradictory:

newtt <- esa(oldtt = TT_y, nec_cond = c("STOCK+MA", "EMP"), 
          untenable_LR = "BARGAIN*~OCCUP", contrad_rows = c("19", "14", "46", "51"))

# The truth table newly created can afterwards be used in further analyses




