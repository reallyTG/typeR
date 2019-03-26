library(relsurv)


### Name: transrate.hld
### Title: Reorganize Data obtained from Human Life-Table Database into a
###   Ratetable Object
### Aliases: transrate.hld
### Keywords: survival

### ** Examples

## Not run: 
##D finpop <- transrate.hld(c("FIN_1981-85.txt","FIN_1986-90.txt","FIN_1991-95.txt"))
## End(Not run)
## Not run: 
##D nzpop <- transrate.hld(c("NZL_1980-82_Non-maori.txt","NZL_1985-87_Non-maori.txt",
##D 	 "NZL_1980-82_Maori.txt","NZL_1985-87_Maori.txt"),
##D 	 cut.year=c(1980,1985),race=rep(c("nonmaori","maori"),each=2))
## End(Not run)



