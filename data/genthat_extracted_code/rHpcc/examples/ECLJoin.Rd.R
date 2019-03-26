library(rHpcc)


### Name: ECLJoin
### Title: Creates an ECL "JOIN" definition.
### Aliases: ECLJoin

### ** Examples

  ## Not run: 
##D     transfrm <- ECLTransform$new(name="transfrm", outECLRecord=rec_revenueDef);
##D     transfrm$addField("SELF.orderNumber", "RIGHT.orderNumber");
##D     transfrm$addField("SELF.prodCode", "LEFT.productCode");
##D     transfrm$addField("SELF.prodName", "LEFT.productName");
##D     transfrm$addField("SELF.revenue", "RIGHT.priceEach * RIGHT.quantityOrdered");
##D     
##D     joinCondition <- "LEFT.productCode=RIGHT.productCode"
##D     ds_revenue <- ECLJoin$new(name="ds_revenue", leftRecordSet= ds_products, 
##D                     rightRecordSet=ds_orderDetails, joinCondition = joinCondition, 
##D                     joinType = "INNER", def=transfrm$print());
##D     ecl1$add(ds_revenue)
##D     output <- ECLOutput$new(name="output", def = ds_revenue$getName())
##D     ecl$add(output)
##D     ecl$print()
##D     xmlContent <- ecl$execute()
##D     data <- parseResults(xmlContent)
##D   
## End(Not run)



