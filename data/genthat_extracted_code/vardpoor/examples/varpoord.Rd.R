library(vardpoor)


### Name: varpoord
### Title: Estimation of the variance and deff for sample surveys for
###   indicators on social exclusion and poverty
### Aliases: varpoord
### Keywords: varpoord

### ** Examples

data(eusilc)
dataset <- data.table(IDd = paste0("V", 1 : nrow(eusilc)), eusilc)
dataset1 <- dataset[1 : 1000]

# use dataset1 by default without using fh_zero (finite population correction)
aa<-varpoord(Y = "eqIncome", w_final = "rb050",
             Y_thres = NULL, wght_thres = NULL,
             ID_level1 = "db030", ID_level2 = "IDd", 
             H = "db040", PSU = "rb030", N_h = NULL,
             sort = NULL, Dom = NULL,
             gender = NULL, X = NULL,
             X_ID_level1 = NULL, g = NULL,
             q=NULL, datasetX = NULL,             
             dataset = dataset1, percentage = 60,
             order_quant = 50L, alpha = 20, 
             confidence = .95, outp_lin = FALSE,
             outp_res = FALSE, type = "linarpt")
aa

## Not run: 
##D # use dataset1 by default with using fh_zero (finite population correction)
##D aa2 <-varpoord(Y = "eqIncome", w_final = "rb050",
##D              Y_thres = NULL, wght_thres = NULL,
##D              ID_level1 = "db030", ID_level2 = "IDd", 
##D              H = "db040", PSU = "rb030", N_h = NULL,
##D              fh_zero = TRUE, sort = NULL, Dom = "db040",
##D              gender = NULL, X = NULL, X_ID_level1 = NULL,
##D              g = NULL, datasetX = NULL, dataset =  dataset1,
##D              percentage = 60, order_quant = 50L,
##D              alpha = 20, confidence = .95, outp_lin = FALSE,
##D              outp_res = FALSE, type = "linarpt")
##D aa2
##D aa2$all_result
##D 
##D 
##D 
##D # using dataset
##D aa4 <- varpoord(Y = "eqIncome", w_final = "rb050",
##D              Y_thres = NULL, wght_thres = NULL,
##D              ID_level1 = "db030", ID_level2 = "IDd", 
##D              H = "db040", PSU = "rb030", N_h = NULL,
##D              sort = NULL, Dom = "db040",
##D              gender = NULL, X = NULL,
##D              X_ID_level1 = NULL, g = NULL,
##D              datasetX = NULL, dataset =  dataset,
##D              percentage = 60, order_quant = 50L,
##D              alpha = 20, confidence = .95,
##D              outp_lin = TRUE, outp_res = TRUE,
##D              type = "linarpt")
##D aa4$lin_out[20 : 40]
## End(Not run)





