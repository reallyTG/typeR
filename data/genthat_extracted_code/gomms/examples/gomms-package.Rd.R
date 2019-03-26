library(gomms)


### Name: gomms-package
### Title: GLM-Based Ordination Method
### Aliases: gomms-package

### ** Examples

## Not run: 
##D # load test data
##D 
##D data(gomms_test_data);
##D 
##D # estimate factor scores
##D cdat <- as.matrix(gomms_test_data[,-ncol(gomms_test_data)]);
##D rslt <- gomms(cdat);
##D 
##D # plot estimated factor scores
##D y <- as.matrix(gomms_test_data$group);
##D gomms.plot(rslt, y);
## End(Not run)



