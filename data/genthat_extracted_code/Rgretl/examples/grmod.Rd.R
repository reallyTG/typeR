library(Rgretl)


### Name: grmod
### Title: Interface for _gretl_ estimation commands
### Aliases: grmod

### ** Examples

set.seed(13)
dfr = data.frame(y = rnorm(20), x = rnorm(20))
grmod("ols y 0 x --simple-print",dfr)
grmod("ols diff(LRY) 0 diff(LRM)","denmark.gdt")


## Not run: 
##D ## command block example
##D # unrestricted linear regression
##D tp <- "ols diff(LRY) 0 diff(LRM) IBO -q" 
##D # restrict block code:
##D md <- 
##D "restrict --full
##D b[2] + b[3] = 0.3
##D end restrict"
##D # estimation
##D mod1 <- grmod(md,"denmark.gdt",top=tp)
##D names(mod1)
##D 
##D ## prelimanary data manipulation example
##D pr <- 
##D "list DEMOG = age educ female black married
##D list INCOME = finc25 finc35 finc50 finc75 finc100 finc101"
##D # estimate ordered probit
##D grmod("probit pctstck choice DEMOG INCOME wealth89 prftshr",
##D       "pension.gdt",top=pr,type="ordered")
##D 
## End(Not run)



