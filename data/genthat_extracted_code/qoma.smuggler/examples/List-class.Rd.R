library(qoma.smuggler)


### Name: List-class
### Title: Mutable list
### Aliases: List-class List

### ** Examples

# set FAME monthly date range January 2018 to December 2018
rng <- to_fame_range(rhli::HMONTH,"18m1","18m12")
# convert to equivalent lubridate date column
tbl <- to_lubridate_index(rng)
# generate N(0,1) random observations
nobs <- rng[3]-rng[2]+1
tbl['x'] <- rnorm(nobs)
# construct List entry containing data and FAME metadata
mydb <- List()
entry <- newEntry(tbl$x,
    desc = "N(0,1)", 
    docu = "R generated N(0,1) time series.", 
    range = rng,obse = rhli::HOBSUM )
# put key='x',value=entry in List
mydb$put('x',entry)
# display contents of List
print_catalog(mydb)
# retrieve value for key 'x' from List
mydb$get('x')




