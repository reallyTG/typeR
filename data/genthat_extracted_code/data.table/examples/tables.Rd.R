library(data.table)


### Name: tables
### Title: Display 'data.table' metadata
### Aliases: tables
### Keywords: data

### ** Examples

DT = data.table(A=1:10, B=letters[1:10])
DT2 = data.table(A=1:10000, ColB=10000:1)
setkey(DT,B)
tables()



