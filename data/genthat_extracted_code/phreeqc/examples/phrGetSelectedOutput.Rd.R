library(phreeqc)


### Name: phrGetSelectedOutput
### Title: Returns the contents of the selected output as a list of data
###   frames.
### Aliases: phrGetSelectedOutput

### ** Examples


# Load database and run ex2
phrLoadDatabaseString(phreeqc.dat)
phrRunString(ex2)

# display a summary of the results
df <- phrGetSelectedOutput()
summary(df$n1)




