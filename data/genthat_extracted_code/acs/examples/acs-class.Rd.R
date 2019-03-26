library(acs)


### Name: acs-class
### Title: Class '"acs"'
### Aliases: acs-class acs.colnames,acs-method acs.units,acs-method
###   -,acs,acs-method -,acs,numeric-method -,numeric,acs-method
###   /,acs,acs-method /,acs,numeric-method /,numeric,acs-method
###   [<-,acs-method [,acs-method *,acs,acs-method *,acs,numeric-method
###   *,numeric,acs-method +,acs,acs-method +,acs,numeric-method
###   +,numeric,acs-method estimate,acs-method modified,acs-method
###   show,acs-method span,acs-method standard.error,acs-method
###   summary,acs-method estimate modified span standard.error acs.colnames
###   acs.units dim.acs length.acs acs.colnames<- acs.units<- is.acs span<-
###   apply acs.colnames<-,acs-method acs.units<-,acs-method is.acs
###   span<-,acs-method apply,acs-method
### Keywords: classes

### ** Examples

showClass("acs")
# load some data from the ACS
data(kansas09)
str(kansas09)

# access slots
endyear(kansas09)
span(kansas09)
estimate(kansas09)[1:5,1:5]
standard.error(kansas09[1:5,1:5])


# subset
kansas09[1:4,6:9]

# more complicated subsets
kansas09[c("Linn County, Kansas", "Wilson County, Kansas") ,
   grep(pattern="21.years", x=acs.colnames(kansas09))]

# addition on estimates and errors
kansas09[1:4,25]+kansas09[1:4,49]

# can even multiply and divide
# males per female, by county
kansas09[1:4,2]/kansas09[1:4,26]

# (males<5 plus females<5) * 12
(kansas09[7,3]+kansas09[7,27]) * 12

# some replacement: males<5 as a percentage of all males
kansas09[,3]=kansas09[,3]/kansas09[,2]



