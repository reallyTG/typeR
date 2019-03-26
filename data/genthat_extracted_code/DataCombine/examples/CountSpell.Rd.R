library(DataCombine)


### Name: CountSpell
### Title: Count spells, including for grouped data
### Aliases: CountSpell

### ** Examples

# Create fake data
ID <- sort(rep(seq(1:4), 5))
Time <- rep(1:20)
Dummy <-  c(1, sample(c(0, 1), size = 19, replace = TRUE))
Data <- data.frame(ID, Time, Dummy)

# Find spell for whole data frame
DataSpell1 <- CountSpell(Data, TimeVar = 'Time', SpellVar = 'Dummy',
                         SpellValue = 1)

head(DataSpell1)

# Find spell for each ID group
DataSpell2 <- CountSpell(Data, TimeVar = 'Time', SpellVar = 'Dummy',
                         GroupVar = 'ID', SpellValue = 1)

head(DataSpell2)




