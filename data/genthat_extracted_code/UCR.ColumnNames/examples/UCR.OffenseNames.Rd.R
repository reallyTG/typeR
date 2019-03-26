library(UCR.ColumnNames)


### Name: UCR.OffenseNames
### Title: Uniform Crime Report Column Name Fixer
### Aliases: UCR.OffenseNames

### ** Examples

# This is an example data.frame with the same column names
# as the real UCR dataset.
example <- data.frame(V1 = 1:10, V2 = 2:11, V8 = "example")
names(example)
example <- UCR.OffenseNames(example)
names(example)



