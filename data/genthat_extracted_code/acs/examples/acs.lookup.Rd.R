library(acs)


### Name: acs.lookup
### Title: Search for relevant demographic variables and tables from the US
###   Census.
### Aliases: acs.lookup

### ** Examples

## Not run: 
##D acs.lookup(endyear=2014, span=5, table.number="B01001")
##D acs.lookup(endyear=2012, span=1, table.number="B01001", keyword="Female")
##D acs.lookup(endyear=2012, span=1, keyword=c("Female", "GED"))
##D acs.lookup(endyear=2000, dataset="sf3", table.number="P56")
##D acs.lookup(endyear=1990, dataset="sf3", table.number="H058")
##D age.by.sex=acs.lookup(endyear=2014, span=5, table.name="Age by Sex")
##D age.by.sex
##D workers.age.by.sex=age.by.sex[4:6]
##D workers.age.by.sex
## End(Not run)



