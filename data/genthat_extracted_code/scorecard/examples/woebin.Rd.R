library(scorecard)


### Name: woebin
### Title: WOE Binning
### Aliases: woebin

### ** Examples

# load germancredit data
data(germancredit)

# Example I
# binning of two variables in germancredit dataset
# using tree method
bins2_tree = woebin(germancredit, y="creditability",
   x=c("credit.amount","housing"), method="tree")
bins2_tree

## Not run: 
##D # using chimerge method
##D bins2_chi = woebin(germancredit, y="creditability",
##D    x=c("credit.amount","housing"), method="chimerge")
##D 
##D # save breaks_list as a R file
##D bins2 = woebin(germancredit, y="creditability",
##D    x=c("credit.amount","housing"), save_breaks_list='breaks_list')
##D 
##D 
##D # Example II
##D # binning of the germancredit dataset
##D bins_germ = woebin(germancredit, y = "creditability")
##D # converting bins_germ into a dataframe
##D # bins_germ_df = data.table::rbindlist(bins_germ)
##D 
##D # Example III
##D # customizing the breakpoints of binning
##D library(data.table)
##D dat = rbind(
##D   germancredit,
##D   data.table(creditability=sample(c("good","bad"),10,replace=TRUE)),
##D   fill=TRUE)
##D 
##D breaks_list = list(
##D   age.in.years = c(26, 35, 37, "Inf%,%missing"),
##D   housing = c("own", "for free%,%rent")
##D )
##D 
##D special_values = list(
##D   credit.amount = c(2600, 9960, "6850%,%missing"),
##D   purpose = c("education", "others%,%missing")
##D )
##D 
##D bins_cus_brk = woebin(dat, y="creditability",
##D   x=c("age.in.years","credit.amount","housing","purpose"),
##D   breaks_list=breaks_list, special_values=special_values)
##D 
## End(Not run)




