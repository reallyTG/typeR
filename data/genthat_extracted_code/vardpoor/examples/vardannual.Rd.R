library(vardpoor)


### Name: vardannual
### Title: Variance estimation for measures of annual net change or annual
###   for single and multistage stage cluster sampling designs
### Aliases: vardannual
### Keywords: vardchangannual

### ** Examples


### Example 
data("eusilc")
set.seed(1)
eusilc1 <- eusilc[1 : 100,]
set.seed(1)
data <- data.table(rbind(eusilc1, eusilc1),
                   year = c(rep(2010, nrow(eusilc1)),
                            rep(2011, nrow(eusilc1))))
data[, country := "AT"]
data[, quarter:= .I - 4 * trunc((.I - 1) / 4)]
data[age < 0, age:= 0]
PSU <- data[, .N, keyby = "db030"][, N:= NULL]
PSU[, PSU:= trunc(runif(nrow(PSU), 0, 5))]
data <- merge(data, PSU, all = TRUE, by = "db030")
PSU <- eusilc <- NULL
data[, strata := c("XXXX")]

data[, employed := trunc(runif(nrow(data), 0, 2))]
data[, unemployed := trunc(runif(nrow(data), 0, 2))]
data[, labour_force := employed + unemployed]
data[, id_lv2 := paste0("V", .I)]

result <- vardannual(Y = "employed", H = "strata",
                     PSU = "PSU", w_final = "rb050",
                     ID_level1 = "db030", ID_level2 = "id_lv2",
                     Dom = NULL, Z = NULL, country = "country",
                     years = "year", subperiods = "quarter",
                     dataset = data, percentratio = 100,
                     confidence = 0.95, method = "cros")

result2 <- vardannual(Y = "employed", H = "strata",
                      PSU = "PSU", w_final = "rb050",
                      ID_level1 = "db030", ID_level2 = "id_lv2",
                      Dom = NULL, Z = NULL, country = "country",
                      years = "year", subperiods = "quarter",
                      dataset = data, year1 = 2010, year2 = 2011,
                      percentratio = 100, confidence = 0.95,
                      method = "netchanges")

## Not run: 
##D result <- vardannual(Y = "unemployed", H = "strata",
##D                      PSU = "PSU", w_final = "rb050",
##D                      ID_level1 = "db030", ID_level1 = "id_lv2",
##D                      Dom = NULL, Z = "labour_force",
##D                      country = "country",  years = "year",
##D                      subperiods = "quarter", dataset = data,
##D                      year1 = 2010, year2 = 2011,
##D                      percentratio = 100, confidence = 0.95,
##D                      method = "netchanges") 
## End(Not run)



