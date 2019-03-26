library(qmethod)


### Name: export.pqmethod
### Title: Q methodology: export to PQMethod *.DAT and *.STA files
### Aliases: export.pqmethod

### ** Examples

data(lipset)
db <- lipset[[1]]
export.pqmethod(dataset = db, 
                study.name = 'mystudy', 
                study.description = 'great study', 
                col.range = c(-4, 4), 
                filename = 'mystudy',
                statements=lipset[[2]])



