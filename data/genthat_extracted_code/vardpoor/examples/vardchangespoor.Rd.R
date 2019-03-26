library(vardpoor)


### Name: vardchangespoor
### Title: Variance estimation for measures of change for sample surveys
###   for indicators on social exclusion and poverty
### Aliases: vardchangespoor
### Keywords: vardchanges

### ** Examples


### Example 

data(eusilc)
set.seed(1)

data <- data.table(rbind(eusilc, eusilc),
                   year = c(rep(2010, nrow(eusilc)),
                            rep(2011, nrow(eusilc))),
                   country = c(rep("AT", nrow(eusilc)),
                               rep("AT", nrow(eusilc))))
data[age < 0, age := 0]
PSU <- data[, .N, keyby = "db030"][, N := NULL]
PSU[, PSU := trunc(runif(nrow(PSU), 0, 100))]
PSU$inc <- runif(nrow(PSU), 20, 100000)
data <- merge(data, PSU, all = TRUE, by = "db030")
PSU <- eusilc <- NULL
data[, strata:=c("XXXX")]
data$pl085 <- 12 * trunc(runif(nrow(data), 0, 2))
data$month_at_work <- 12 * trunc(runif(nrow(data), 0, 2))
data[, id_l2 := paste0("V", .I)]
result <- vardchangespoor(Y = "inc", age = "age",
                          pl085 = "pl085", month_at_work = "month_at_work",
                          Y_den = "inc", Y_thres = "inc",
                          wght_thres = "rb050",  H = "strata", 
                          PSU = "PSU", w_final="rb050",
                          ID_level1 = "db030",  ID_level2 = "id_l2",
                          Dom = c("rb090"), country = "country",
                          period = "year", sort = NULL,  
                          period1 = c(2010, 2011),
                          period2 = c(2011, 2010),
                          gender = NULL, dataset = data,
                          percentage = 60, order_quant = 50L,
                          alpha = 20, confidence = 0.95,
                          type = "linrmpg")



