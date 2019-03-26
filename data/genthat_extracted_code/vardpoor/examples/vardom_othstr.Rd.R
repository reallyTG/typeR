library(vardpoor)


### Name: vardom_othstr
### Title: Variance estimation for sample surveys in domain by the two
###   stratification
### Aliases: vardom_othstr
### Keywords: vardpoor

### ** Examples


data(eusilc)

# Example 1
eusilc1 <- eusilc[1:1000, ]
dataset <- data.table(IDd = paste0("V", 1:nrow(eusilc1)), eusilc1)
dataset[, db040_2 := get("db040")]
N_h2 <- dataset[, sum(rb050, na.rm = FALSE), keyby = "db040_2"]

aa<-vardom_othstr(Y = "eqIncome", H = "db040", H2 = "db040_2",  
                  PSU = "db030", w_final = "rb050", id = "rb030",
                  Dom = "db040", period = NULL, N_h = NULL,
                  N_h2 = N_h2, Z = NULL, X = NULL, g = NULL,
                  q = NULL, dataset = dataset, confidence = .95,           
                  outp_lin = TRUE, outp_res = TRUE)


## Not run: 
##D # Example 2
##D dataset <- data.table(IDd = 1:nrow(eusilc), eusilc)
##D dataset[, db040_2 := get("db040")]
##D N_h2 <- dataset[, sum(rb050, na.rm = FALSE), keyby = "db040_2"]
##D 
##D aa <- vardom_othstr(Y = "eqIncome", H = "db040", H2 = "db040_2",
##D                     PSU = "db030", w_final = "rb050", id = "rb030",
##D                     Dom = "db040", period = NULL, N_h2 = N_h2,
##D                     Z = NULL, X = NULL, g = NULL, dataset = dataset,
##D                     q = NULL, confidence = .95, outp_lin = TRUE,
##D                     outp_res = TRUE)
## End(Not run)




