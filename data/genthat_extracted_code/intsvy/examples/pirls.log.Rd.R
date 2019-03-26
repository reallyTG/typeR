library(intsvy)


### Name: pirls.log
### Title: Logistic regression analysis
### Aliases: pirls.log pirls2016.log

### ** Examples

## Not run: 
##D # Table IV.5.14, p. 457 International Report 2012
##D 
##D pisa12$SKIP[!(pisa12$ST09Q01 =="None" & pisa12$ST115Q01 == "None")] <- 1
##D pisa12$SKIP[pisa12$ST09Q01 =="None" & pisa12$ST115Q01 == "None"] <- 0
##D 
##D pisa12$LATE[!pisa12$ST08Q01=="None"] <- 1
##D pisa12$LATE[pisa12$ST08Q01=="None"] <- 0
##D 
##D pisa.log(y="SKIP", x="LATE", by="IDCNTRYL", data = pisa12)
##D 
##D # from PISA2012lite
##D 
##D student2012$SKIP[!(student2012$ST09Q01 =="None  " & student2012$ST115Q01 == 1)] <- 1
##D student2012$SKIP[student2012$ST09Q01 =="None  " & student2012$ST115Q01 == 1] <- 0
##D 
##D student2012$LATE[!student2012$ST08Q01=="None  "] <- 1
##D student2012$LATE[student2012$ST08Q01=="None  "] <- 0
##D 
##D pisa.log(y="SKIP", x="LATE", by="CNT", data = student2012)
##D 
## End(Not run)


