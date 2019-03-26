library(DataCombine)


### Name: StartEnd
### Title: Find the starting and ending time points of a spell
### Aliases: StartEnd

### ** Examples

# Create fake data
ID <- sort(rep(seq(1:4), 5))
Time <- rep(1:5, 4)
Dummy <-  c(1, sample(c(0, 1), size = 19, replace = TRUE))
Data <- data.frame(ID, Time, Dummy)

# Find start/end of spells denoted by Dummy = 1
DataSpell <- StartEnd(Data, SpellVar = 'Dummy', GroupVar = 'ID',
                     TimeVar = 'Time', SpellValue = 1)

head(DataSpell)




