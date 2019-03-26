library(GetDFPData)


### Name: my.copy.fct
### Title: Copies data to external file
### Aliases: my.copy.fct

### ** Examples


test.data <- data.frame(test.data = runif(100))
name.df <- 'TestData'
base.file.name <- 'TestData'
type.export <- 'csv'

my.copy.fct(df.in = test.data, name.df, base.file.name, type.export)



