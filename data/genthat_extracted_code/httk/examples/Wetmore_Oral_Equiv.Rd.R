library(httk)


### Name: get_wetmore_oral_equiv
### Title: Get Wetmore Oral Equivalent Dose
### Aliases: get_wetmore_oral_equiv
### Keywords: Wetmore Monte Carlo

### ** Examples

table <- NULL
for(this.cas in sample(get_wetmore_cheminfo(),50)) table <- rbind(table,cbind(
as.data.frame(this.cas),as.data.frame(get_wetmore_oral_equiv(conc=1,chem.cas=this.cas))))




get_wetmore_oral_equiv(0.1,chem.cas="34256-82-1")

get_wetmore_oral_equiv(0.1,chem.cas="34256-82-1",which.quantile=c(0.05,0.5,0.95))



