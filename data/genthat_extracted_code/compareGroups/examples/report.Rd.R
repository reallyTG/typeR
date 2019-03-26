library(compareGroups)


### Name: report
### Title: Report of descriptive tables and plots.
### Aliases: report
### Keywords: utilities

### ** Examples


## Not run: 
##D 
##D require(compareGroups)
##D data(regicor)
##D 
##D  # example on an ordinary table
##D res <- createTable(compareGroups(year ~ . -id, regicor), hide = c(sex=1), hide.no = 'no')
##D report(res, "report.pdf" ,size="small", title="\Huge \textbf{REGICOR study}", 
##D        author="Isaac Subirana \\ IMIM-Parc de Salut Mar")
##D 
##D  # example on an stratified table by sex
##D res.men <- createTable(compareGroups(year ~ . -id-sex, regicor, subset=sex=='Male'), 
##D                        hide.no = 'no')
##D res.wom <- createTable(compareGroups(year ~ . -id-sex, regicor, subset=sex=='Female'), 
##D                        hide.no = 'no')
##D res <- cbind("Men"=res.men, "Wom"=res.wom)
##D report(res[[1]], "reportmen.pdf", size="small", 
##D         title="\Huge \textbf{REGICOR study \\ Men}", date="") # report for men / no date
##D report(res[[2]], "reportwom.pdf", size="small", 
##D         title="\Huge \textbf{REGICOR study \\ Women}", date="") # report for wom / no date
##D 
## End(Not run)




