library(atlas)


### Name: atlas.csv
### Title: Queries ATLAS with a CSV() command and imports the contents of
###   the csv into a data frame
### Aliases: atlas.csv

### ** Examples

## No test: 
atlas.csv(atlas.connect('http://localhost:8080'), 'CSV(ICD9=250.50, CPT, LABS, ICD9)')
## End(No test)
## No test: 
atlas.csv(atlas.connect('http://localhost:8080'), 'CSV(ICD9=250.50, CPT, LABS, ICD9)',
          '/output.csv')
## End(No test)




