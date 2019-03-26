library(bizdays)


### Name: ref
### Title: Creates date references to be used in 'getdate'
### Aliases: ref ref.Date ref.character ref.numeric

### ** Examples

ref(as.Date("2018-01-01"), "month") # refers to 2018-01
ref("2018-01-01", "month")          # refers to 2018-01
ref("2018-01-01", "year")           # refers to 2018

ref(c("2018-01", "2018-02")) # refers to 2018-01 and 2018-02
ref("2018") # refers to 2018
ref(2010:2018) # refers to all years from 2010 to 2018




