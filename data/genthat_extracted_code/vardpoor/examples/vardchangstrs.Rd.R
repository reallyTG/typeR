library(vardpoor)


### Name: vardchangstrs
### Title: Variance estimation for measures of change for stratified simple
###   random sampling
### Aliases: vardchangstrs
### Keywords: vardchangstrs

### ** Examples


### Example 
data("eusilc")
set.seed(1)
eusilc1 <- eusilc[1 : 100,]
set.seed(1)
datas <- data.table(rbind(eusilc1, eusilc1),
                     year = c(rep(2010, nrow(eusilc1)),
                              rep(2011, nrow(eusilc1))))

PSU <- datas[, .N, keyby = "db030"][, N:= NULL]
PSU[, PSU:= trunc(runif(nrow(PSU), 0, 5))]
datas <- merge(datas, PSU, all = TRUE, by = "db030")
datas[, strata := c("XXXX")]

datas[, calc := trunc(runif(nrow(datas), 0, 2))]
datas[, id_lv2 := paste0("V", .I)]

## Not run: 
##D result <- vardchangstrs(Y = "calc", H = "strata",
##D                         PSU = "PSU", w_final = "rb050",
##D                         ID_level1 = "db030", ID_level1 = "id_lv2",
##D                         periods = "year", dataset = datas,
##D                         periods1 = 2010, periods2 = 2011,
##D                         percentratio = 100, confidence = 0.95) 
## End(Not run)



