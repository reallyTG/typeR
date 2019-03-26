library(DandEFA)


### Name: dandelion
### Title: Dandelion Plot
### Aliases: dandelion
### Keywords: Factor Analysis Visaulization Dandelion Plot

### ** Examples

# E.F.A. of Timss 2011 Student Questionnaire Example for 5 and 8 number of factors
data(timss2011)
timss2011 <- na.omit(timss2011)
dandpal <- rev(rainbow(100, start = 0, end = 0.2))
facl <- factload(timss2011,nfac=5,method="prax",cormeth="spearman")
dandelion(facl,bound=0,mcex=c(1,1.2),palet=dandpal)
facl <- factload(timss2011,nfac=8,method="mle",cormeth="pearson")
dandelion(facl,bound=0,mcex=c(1,1.2),palet=dandpal)



