library(tables)


### Name: Format
### Title: 'Format' pseudo-function
### Aliases: Format .Format

### ** Examples

# Using the first form
tabular( (Sepal.Length+Sepal.Width) ~ 
         Format(digits=2)*(mean + sd), data=iris )
         
# The same table, using the second form
tabular( (Sepal.Length+Sepal.Width) ~ 
         Format(format(digits=2))*(mean + sd), data=iris )




