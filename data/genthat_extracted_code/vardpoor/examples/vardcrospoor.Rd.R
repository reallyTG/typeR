library(vardpoor)


### Name: vardcrospoor
### Title: Variance estimation for cross-sectional, longitudinal measures
###   for indicators on social exclusion and poverty
### Aliases: vardcrospoor
### Keywords: vardcros

### ** Examples

data(eusilc)
set.seed(1)

data <- data.table(rbind(eusilc, eusilc),
                   year = c(rep(2010, nrow(eusilc)),
                            rep(2011, nrow(eusilc))))
data[age < 0, age := 0]
PSU <- data[, .N, keyby = "db030"][, N := NULL]
PSU[, PSU := trunc(runif(nrow(PSU), 0, 100))]
PSU$inc <- runif(nrow(PSU), 20, 100000)
data <- merge(data, PSU, all = TRUE, by = "db030")
PSU <- eusilc <- NULL
data[, strata := c("XXXX")]
data$pl085 <- 12 * trunc(runif(nrow(data), 0, 2))
data$month_at_work <- 12 * trunc(runif(nrow(data), 0, 2))
data[, id_l2 := paste0("V", .I)]

result <- vardcrospoor(Y = "inc", age = "age",
                       pl085 = "pl085", 
                       month_at_work = "month_at_work",
                       Y_den = "inc", Y_thres = "inc",
                       wght_thres = "rb050",
                       H = "strata", PSU = "PSU", 
                       w_final="rb050", ID_level1 = "db030",
                       ID_level2 = "id_l2",
                       Dom = c("rb090", "db040"),
                       country = NULL, period = "year",
                       sort = NULL, gender = NULL,
                       dataset = data,
                       percentage = 60,
                       order_quant = 50L,
                       alpha = 20,
                       confidence = 0.95,
                       type = "linrmpg")

## Not run: 
##D result2 <- vardcrospoor(Y = "inc", age = "age",
##D                         pl085 = "pl085", 
##D                         month_at_work = "month_at_work",
##D                         Y_den = "inc", Y_thres = "inc",
##D                         wght_thres = "rb050",
##D                         H = "strata", PSU = "PSU", 
##D                         w_final = "rb050", ID_level1 = "db030",
##D                         ID_level2 = "id_l2",
##D                         Dom = c("rb090", "db040"),
##D                         period = "year", sort = NULL,
##D                         gender = NULL, dataset = data,
##D                         percentage = 60,
##D                         order_quant = 50L,
##D                         alpha = 20,
##D                         confidence = 0.95,
##D                         type = "linrmpg")
## End(Not run)



