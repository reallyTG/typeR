library(TAM)


### Name: data.fims.Aus.Jpn.scored
### Title: Dataset FIMS Study with Responses of Australian and Japanese
###   Students
### Aliases: data.fims.Aus.Jpn.raw data.fims.Aus.Jpn.scored
### Keywords: datasets

### ** Examples

## Not run: 
##D data(data.fims.Aus.Jpn.scored)
##D #*****
##D # Model 1: Differential Item Functioning Gender for Australian students
##D 
##D # extract Australian students
##D scored <- data.fims.Aus.Jpn.scored[ data.fims.Aus.Jpn.scored$country==1, ]
##D 
##D # select items
##D items <- grep("M1", colnames(data.fims.Aus.Jpn.scored), value=TRUE)
##D ##   > items
##D ##    [1] "M1PTI1"  "M1PTI2"  "M1PTI3"  "M1PTI6"  "M1PTI7"  "M1PTI11" "M1PTI12"
##D ##    [8] "M1PTI14" "M1PTI17" "M1PTI18" "M1PTI19" "M1PTI21" "M1PTI22" "M1PTI23"
##D 
##D # Run partial credit model
##D mod1 <- TAM::tam.mml(scored[,items])
##D 
##D # extract values of the gender variable into a variable called "gender".
##D gender <- scored[,"SEX"]
##D # computes the test score for each student by calculating the row sum
##D # of each student's scored responses.
##D raw_score <- rowSums(scored[,items] )
##D 
##D # compute the mean test score for each gender group: 1=male, and 2=female
##D stats::aggregate(raw_score,by=list(gender),FUN=mean)
##D # The mean test score is 6.12 for group 1 (males) and 6.27 for group 2 (females).
##D # That is, the two groups performed similarly, with girls having a slightly
##D # higher mean test score. The step of computing raw test scores is not necessary
##D # for the IRT analyses. But it's always a good practice to explore the data
##D # a little before delving into more complex analyses.
##D 
##D # Facets analysis
##D # To conduct a DIF analysis, we set up the variable "gender" as a facet and
##D # re-run the IRT analysis.
##D formulaA <- ~item+gender+item*gender    # define facets analysis
##D facets <- as.data.frame(gender)         # data frame with student covariates
##D # facets model for studying differential item functioning
##D mod2 <- TAM::tam.mml.mfr( resp=scored[,items], facets=facets, formulaA=formulaA )
##D summary(mod2)
## End(Not run)



