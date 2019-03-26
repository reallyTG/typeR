library(vardpoor)


### Name: vardomh
### Title: Variance estimation for sample surveys in domain for one or two
###   stage surveys by the ultimate cluster method
### Aliases: vardomh
### Keywords: vardpoor

### ** Examples


data(eusilc)
dataset <- data.table(IDd = paste0("V", 1 : nrow(eusilc)), eusilc)

aa <- vardomh(Y = "eqIncome", H = "db040", PSU = "db030",
              w_final = "rb050", ID_level1 = "db030",
              ID_level2 = "rb030", Dom = "db040", period = NULL,
              N_h = NULL, Z = NULL, dataset = dataset, X = NULL,
              X_ID_level1 = NULL, g = NULL, q = NULL, 
              datasetX = NULL, confidence = 0.95, percentratio = 1,
              outp_lin = TRUE, outp_res = TRUE)

## Not run: 
##D dataset2 <- copy(dataset)
##D dataset$period <- 1
##D dataset2$period <- 2
##D dataset <- data.table(rbind(dataset, dataset2))
##D 
##D # by default without using fh_zero (finite population correction)
##D aa2 <- vardomh(Y = "eqIncome", H = "db040", PSU = "db030",
##D                w_final = "rb050", ID_level1 = "db030",
##D                ID_level2 = "rb030", Dom = "db040", period = "period",
##D                N_h = NULL, Z = NULL, dataset = dataset,
##D                X = NULL, X_ID_level1 = NULL,  
##D                g = NULL, q = NULL, datasetX = NULL,
##D                confidence = .95, percentratio = 1,
##D                outp_lin = TRUE, outp_res = TRUE)
##D aa2
##D 
##D # without using fh_zero (finite population correction)
##D aa3 <- vardomh(Y = "eqIncome", H = "db040", PSU = "db030",
##D                w_final = "rb050", ID_level1 = "db030", 
##D                ID_level2 = "rb030", Dom = "db040",
##D                period = "period", N_h = NULL, fh_zero=FALSE, 
##D                Z = NULL, dataset = dataset, X = NULL,
##D                X_ID_level1 = NULL, g = NULL, q = NULL,
##D                datasetX = NULL, confidence = .95,
##D                percentratio = 1, outp_lin = TRUE,
##D                outp_res = TRUE)
##D aa3
##D 
##D # with using fh_zero (finite population correction)
##D aa4 <- vardomh(Y="eqIncome", H="db040", PSU="db030", w_final="rb050",
##D                ID_level1="db030", ID_level2="rb030", Dom = "db040",
##D                period = "period", N_h = NULL, fh_zero=TRUE, 
##D                Z = NULL, dataset = dataset,
##D                X = NULL, X_ID_level1 = NULL, 
##D                g = NULL, q = NULL, datasetX = NULL,
##D                confidence = .95, percentratio = 1,
##D                outp_lin = TRUE, outp_res = TRUE)
##D aa4
## End(Not run)




