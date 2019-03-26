library(vardpoor)


### Name: vardchanges
### Title: Variance estimation for measures of change for single and
###   multistage stage cluster sampling designs
### Aliases: vardchanges
### Keywords: vardchanges

### ** Examples


### Example 

data("eusilc")
set.seed(1)
eusilc1 <- eusilc[1:40,]

set.seed(1)
data <- data.table(rbind(eusilc1, eusilc1),
                   year = c(rep(2010, nrow(eusilc1)),
                            rep(2011, nrow(eusilc1))))
data[age < 0, age := 0]
PSU <- data[, .N, keyby = "db030"][, N := NULL]
PSU[, PSU := trunc(runif(nrow(PSU), 0, 5))]
data <- merge(data, PSU, all = TRUE, by = "db030")
PSU <- eusilc <- NULL
data[, strata := c("XXXX")]

data[, t_pov := trunc(runif(nrow(data), 0, 2))]
data[, exp := 1]

# At-risk-of-poverty (AROP)
data[, pov := ifelse (t_pov == 1, 1, 0)]
data[, id_lev2 := paste0("V", .I)]


result <- vardchanges(Y = "pov", H = "strata", 
                      PSU = "PSU", w_final = "rb050",
                      ID_level1 = "db030", ID_level2 = "id_lev2",
                      Dom = NULL, Z = NULL, period = "year",
                      dataset = data, period1 = 2010,
                      period2 = 2011, change_type = "absolute")
 
## Not run: 
##D data("eusilc")
##D data <- data.table(rbind(eusilc, eusilc),
##D                    year=c(rep(2010, nrow(eusilc)),
##D                           rep(2011, nrow(eusilc))))
##D data[age < 0, age := 0]
##D PSU <- data[,.N, keyby = "db030"][, N := NULL]
##D PSU[, PSU := trunc(runif(nrow(PSU), 0, 100))]
##D data <- merge(data, PSU, all = TRUE, by = "db030")
##D PSU <- eusilc <- NULL
##D data[, strata := "XXXX"]
##D 
##D data[, t_pov := trunc(runif(nrow(data), 0, 2))]
##D data[, t_dep := trunc(runif(nrow(data), 0, 2))]
##D data[, t_lwi := trunc(runif(nrow(data), 0, 2))]
##D data[, exp := 1]
##D data[, exp2 := 1 * (age < 60)]
##D 
##D # At-risk-of-poverty (AROP)
##D data[, pov := ifelse (t_pov == 1, 1, 0)]
##D  
##D # Severe material deprivation (DEP)
##D data[, dep := ifelse (t_dep == 1, 1, 0)]
##D 
##D # Low work intensity (LWI)
##D data[, lwi := ifelse (t_lwi == 1 & exp2 == 1, 1, 0)]
##D 
##D # At-risk-of-poverty or social exclusion (AROPE)
##D data[, arope := ifelse (pov == 1 | dep == 1 | lwi == 1, 1, 0)]
##D data[, dom := 1]
##D data[, id_lev2 := .I]
##D 
##D result <- vardchanges(Y = c("pov", "dep", "lwi", "arope"),
##D                       H = "strata", PSU = "PSU", w_final = "rb050",
##D                       ID_level1 = "db030", ID_level2 = "id_lev2",
##D                       Dom = "rb090", Z = NULL, period = "year",
##D                       dataset = data, period1 = 2010, 
##D                       period2 = 2011, change_type = "absolute")
## End(Not run)



