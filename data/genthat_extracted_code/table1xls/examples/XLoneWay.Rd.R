library(table1xls)


### Name: XLoneWay
### Title: One-way Contingency Tables exported to a spreadsheet
### Aliases: XLoneWay

### ** Examples

book1<-XLwriteOpen("chick1.xls") 
XLoneWay(book1,"Diets",ChickWeight$Diet)
### Now in separate columns, and with a title - note it shifts the table down.
### Also adding a Chi-Square goodness of fit (GoF) test vs. a 2:1:1:1 allocation
XLoneWay(book1,"Diets",ChickWeight$Diet,combine=FALSE,row1=10,
         rowTitle="Diet",title="Counts by Diet:",testname='chisq.test',p=c(2,1,1,1)/5)
cat("Look for",paste(getwd(),"chick1.xls",sep='/'),"to see the results!\n")



