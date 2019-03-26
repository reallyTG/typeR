library(vardpoor)


### Name: vardcros
### Title: Variance estimation for cross-sectional, longitudinal measures
###   for single and multistage stage cluster sampling designs
### Aliases: vardcros
### Keywords: vardcros

### ** Examples

# Example 1
data(eusilc)
set.seed(1)
data <- data.table(eusilc)
data[, year := 2010]
data[, country := "AT"]
data[age < 0, age := 0]
PSU <- data[, .N, keyby = "db030"][, N := NULL]
PSU[, PSU := trunc(runif(nrow(PSU), 0, 100))]
data <- merge(data, PSU, by = "db030", all = TRUE)
PSU <- eusilc <- 0

data[, strata := "XXXX"]
data[, t_pov := trunc(runif(nrow(data), 0, 2))]
data[, t_dep := trunc(runif(nrow(data), 0, 2))]
data[, t_lwi := trunc(runif(nrow(data), 0, 2))]
data[, exp := 1]
data[, exp2 := 1 * (age < 60)]

# At-risk-of-poverty (AROP)
data[, pov := ifelse (t_pov == 1, 1, 0)]

# Severe material deprivation (DEP)
data[, dep := ifelse (t_dep == 1, 1, 0)]

# Low work intensity (LWI)
data[, lwi := ifelse (t_lwi == 1 & exp2 == 1, 1, 0)]

# At-risk-of-poverty or social exclusion (AROPE)
data[, arope := ifelse (pov == 1 | dep == 1 | lwi == 1, 1, 0)]

result11 <- vardcros(Y="arope", H = "strata",
                     PSU = "PSU", w_final = "rb050",
                     ID_level1 = "db030", ID_level2 = "rb030",
                     Dom = "rb090", Z = NULL, country = "country",
                     period = "year", dataset = data,
                     linratio = FALSE, withperiod = TRUE,
                     netchanges = TRUE, confidence = .95)

## Not run: 
##D # Example 2
##D data(eusilc)
##D set.seed(1)
##D data <- data.table(rbind(eusilc, eusilc),
##D                       year = c(rep(2010, nrow(eusilc)),
##D                                rep(2011, nrow(eusilc))))
##D data[, country := "AT"]
##D data[age < 0, age := 0]
##D PSU <- data[, .N, keyby = "db030"][, N := NULL]
##D PSU[, PSU := trunc(runif(nrow(PSU), 0, 100))]
##D data <- merge(data, PSU, by = "db030", all = TRUE)
##D PSU <- eusilc <- 0
##D data[, strata := "XXXX"]
##D data[, strata := as.character(strata)]
##D data[, t_pov := trunc(runif(nrow(data), 0, 2))]
##D data[, t_dep := trunc(runif(nrow(data), 0, 2))]
##D data[, t_lwi := trunc(runif(nrow(data), 0, 2))]
##D data[, exp := 1]
##D data[, exp2 := 1 * (age < 60)]
##D 
##D # At-risk-of-poverty (AROP)
##D data[, pov := ifelse(t_pov == 1, 1, 0)]
##D 
##D # Severe material deprivation (DEP)
##D data[, dep := ifelse(t_dep == 1, 1, 0)]
##D 
##D # Low work intensity (LWI)
##D data[, lwi := ifelse(t_lwi == 1 & exp2 == 1, 1, 0)]
##D 
##D # At-risk-of-poverty or social exclusion (AROPE)
##D data[, arope := ifelse(pov == 1 | dep == 1 | lwi == 1, 1, 0)]
##D 
##D result11 <- vardcros(Y = c("pov", "dep", "arope"),
##D                      H = "strata", PSU = "PSU", w_final = "rb050",
##D                      ID_level1 = "db030", ID_level2 = "rb030",
##D                      Dom = "rb090", Z = NULL, country = "country",
##D                      period = "year", dataset=data, linratio = FALSE, 
##D                      withperiod = TRUE, netchanges = TRUE,
##D                      confidence = .95)
##D 
##D data2 <- data[exp2 == 1]
##D result12 <- vardcros(Y = c("lwi"), H = "strata",
##D                      PSU = "PSU", w_final = "rb050",
##D                      ID_level1 = "db030", ID_level2 = "rb030",
##D                      Dom = "rb090", Z = NULL,
##D                      country = "country", period = "year",
##D                      dataset = data2, linratio = FALSE, 
##D                      withperiod = TRUE, netchanges = TRUE,
##D                      confidence = .95)
##D 
##D 
##D ### Example 3
##D data(eusilc)
##D set.seed(1)
##D year <- 2011
##D data <- data.table(rbind(eusilc, eusilc, eusilc, eusilc),
##D                    rb010 = c(rep(2008, nrow(eusilc)),
##D                              rep(2009, nrow(eusilc)),
##D                              rep(2010, nrow(eusilc)),
##D                              rep(2011, nrow(eusilc))))
##D data[, rb020 := "AT"]
##D 
##D data[, u := 1]
##D data[age < 0, age := 0]
##D data[, strata := "XXXX"]
##D PSU <- data[, .N, keyby = "db030"][, N:=NULL]
##D PSU[, PSU := trunc(runif(nrow(PSU), 0, 100))]
##D data <- merge(data, PSU, by = "db030", all = TRUE)
##D thres <- data.table(rb020 = as.character(rep("AT", 4)),
##D                     thres = c(11406, 11931, 12371, 12791),
##D                     rb010 = 2008 : 2011)
##D data <- merge(data, thres, all.x = TRUE, by = c("rb010", "rb020"))
##D data[is.na(u), u := 0]
##D data <- data[u == 1]
##D 
##D #############
##D # T3        #
##D #############
##D 
##D T3 <- data[rb010 == year - 3]
##D T3[, strata1 := strata]
##D T3[, PSU1 := PSU]
##D T3[, w1 := rb050]
##D T3[, inc1 := eqIncome]
##D T3[, rb110_1 := db030]
##D T3[, pov1 := inc1 <= thres1]
##D T3 <- T3[, c("rb020", "rb030", "strata", "PSU", "inc1", "pov1"), with = FALSE]
##D 
##D #############
##D # T2        #
##D #############
##D T2 <- data[rb010 == year - 2]
##D T2[, strata2 := strata]
##D T2[, PSU2 := PSU]
##D T2[, w2 := rb050]
##D T2[, inc2 := eqIncome]
##D T2[, rb110_2 := db030]
##D setnames(T2, "thres", "thres2")
##D T2[, pov2 := inc2 <= thres2]
##D T2 <- T2[, c("rb020", "rb030", "strata2", "PSU2", "inc2", "pov2"), with = FALSE]
##D 
##D #############
##D # T1        #
##D #############
##D T1 <- data[rb010 == year - 1]
##D T1[, strata3 := strata]
##D T1[, PSU3 := PSU]
##D T1[, w3 := rb050]
##D T1[, inc3 := eqIncome]
##D T1[, rb110_3 := db030]
##D setnames(T1, "thres", "thres3")
##D T1[, pov3 := inc3 <= thres3]
##D T1 <- T1[, c("rb020", "rb030", "strata3", "PSU3", "inc3", "pov3"), with = FALSE]
##D 
##D #############
##D # T0        #
##D #############
##D T0 <- data[rb010 == year]
##D T0[, PSU4 := PSU]
##D T0[, strata4 := strata]
##D T0[, w4 := rb050]
##D T0[, inc4 := eqIncome]
##D T0[, rb110_4 := db030]
##D setnames(T0, "thres", "thres4")
##D T0[, pov4 := inc4 <= thres4]
##D T0 <- T0[, c("rb020", "rb030", "strata4", "PSU4", "w4", "inc4", "pov4"), with = FALSE]
##D apv <- merge(T3, T2, all = TRUE, by = c("rb020", "rb030"))
##D apv <- merge(apv, T1, all = TRUE, by = c("rb020", "rb030"))
##D apv <- merge(apv, T0, all = TRUE, by = c("rb020", "rb030"))
##D apv <- apv[(!is.na(inc1)) & (!is.na(inc2)) & (!is.na(inc3)) & (!is.na(inc4))]
##D apv[, ppr := ifelse(((pov4 == 1) & ((pov1 == 1 & pov2 == 1 & pov3 == 1) | (pov1 == 1 &
##D                       pov2 == 1 & pov3 == 0) | (pov1 == 1 & pov2 == 0 & pov3 == 1) |
##D                      (pov1 == 0 & pov2 ==1 & pov3 == 1))), 1, 0)]
##D 
##D data[, id2 := .I]
##D result20 <- vardcros(Y = "ppr", H = "strata", PSU = "PSU",
##D                     w_final = "w4", ID_level1="rb030",
##D                     ID_level2 = "rb030", Dom = NULL,
##D                     Z = NULL, country = "rb020",
##D                     period = NULL, dataset = apv,
##D                     linratio = FALSE, 
##D                     withperiod = FALSE,
##D                     netchanges = FALSE,
##D                     confidence = .95)
## End(Not run)



