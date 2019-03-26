library(MRCV)


### Name: MI.test
### Title: Test for Marginal Independence
### Aliases: MI.test MI.stat

### ** Examples

# Test for MMI using the second-order Rao-Scott adjustment
test.mmi.rs2 <- MI.test(data = farmer1, I = 1, J = 5, type = "rs2")
test.mmi.rs2

# Test for MMI using all three approaches
# A small B is used for demonstration purposes; normally, a larger B should be used
## Not run: 
##D test.mmi.all <- MI.test(data = farmer1, I = 1, J = 5, type = "all", B = 99, 
##D     plot.hist = TRUE)
##D test.mmi.all
## End(Not run)

# Use MI.test() with summary data
# Convert raw data file to summary file for this example 
farmer1.irdframe <- item.response.table(data = farmer1, I = 1, J = 5, create.dataframe = 
    TRUE)
# Test for MMI using the Bonferroni adjustment
test.mmi.bon <- MI.test(data = farmer1.irdframe, I = 1, J = 5, type = "bon", 
    summary.data = TRUE)
test.mmi.bon

# Test for SPMI using the second-order Rao-Scott adjustment
test.spmi.rs2 <- MI.test(data = farmer2, I = 3, J = 4, type = "rs2")
test.spmi.rs2

# Test for MMI using the marginal logit model approach
## Not run: 
##D library(geepack)
##D n<-nrow(farmer1)
##D farmer1.id<-cbind(case=1:n, farmer1)
##D # Reshape raw data into long format as required by geeglm() function
##D # Assumes 3:ncol(farmer1.id) corresponds to MRCV items
##D farmer1.gee<-reshape(data = farmer1.id, 
##D                  varying = names(farmer1.id)[3:ncol(farmer1.id)], 
##D                  v.names = "response", timevar = "item", idvar = "case", 
##D                  direction = "long") 
##D row.names(farmer1.gee)<-NULL
##D farmer1.gee[,2:3]<-lapply(farmer1.gee[,2:3], factor)
##D # Data frame must be ordered by case
##D farmer1.gee<-farmer1.gee[order(farmer1.gee$case),]
##D head(farmer1.gee)
##D tail(farmer1.gee)
##D mod.fit.H0<-geeglm(formula = response ~ item, family = binomial(link = logit), 
##D                   data = farmer1.gee, na.action = na.omit, id = case, 
##D                   corstr = "unstructured")
##D mod.fit.HA<-geeglm(formula = response ~ Ed*item, family = binomial(link = logit), 
##D                    data = farmer1.gee, na.action = na.omit, id = case, 
##D                    corstr = "unstructured")
##D # Compute Wald test
##D anova(mod.fit.HA, mod.fit.H0)
## End(Not run)



