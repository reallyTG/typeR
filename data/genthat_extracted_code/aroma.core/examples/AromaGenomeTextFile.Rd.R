library(aroma.core)


### Name: AromaGenomeTextFile
### Title: The AromaGenomeTextFile class
### Aliases: AromaGenomeTextFile
### Keywords: classes

### ** Examples

# Locate a Human,chromosomes(,.*)*.txt file
db <- AromaGenomeTextFile$byGenome("Human")
print(db)

# Read the data
df <- readDataFrame(db)
print(df)
str(df)

# Details on the file format
oopts <- options(width=40)
print(readLines(db))
options(oopts)



