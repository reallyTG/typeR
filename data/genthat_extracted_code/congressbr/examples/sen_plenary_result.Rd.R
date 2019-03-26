library(congressbr)


### Name: sen_plenary_result
### Title: Returns results from the plenary in the Federal Senate for a
###   specified date
### Aliases: sen_plenary_result

### ** Examples

# get info for the 3rd of March 2016:
x <- sen_plenary_result(date = "20160303")
# Earlier periods may not have information:
## No test: 
sen_plenary_result(date = "20110405")
## End(No test)



