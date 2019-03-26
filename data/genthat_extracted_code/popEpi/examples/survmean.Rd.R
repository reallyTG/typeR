library(popEpi)


### Name: survmean
### Title: Compute Mean Survival Times Using Extrapolation
### Aliases: survmean

### ** Examples


library(survival)
library(Epi)
## take 500 subjects randomly for demonstration
data(sire)
sire <- sire[sire$dg_date < sire$ex_date, ]
set.seed(1L)
sire <- sire[sample(x = nrow(sire), size = 500),]

## NOTE: recommended to use factor status variable
x <- Lexis(entry = list(FUT = 0, AGE = dg_age, CAL = get.yrs(dg_date)),
           exit = list(CAL = get.yrs(ex_date)),
           data = sire,
           exit.status = factor(status, levels = 0:2,
                                labels = c("alive", "canD", "othD")),
           merge = TRUE)

## phony variable
set.seed(1L)
x$group <- rbinom(nrow(x), 1, 0.5)
## age group
x$agegr <- cut(x$dg_age, c(0,45,60,Inf), right=FALSE)

## population hazards data  set
pm <- data.frame(popEpi::popmort)
names(pm) <- c("sex", "CAL", "AGE", "haz")

## breaks to define observed survival estimation
BL <- list(FUT = seq(0, 10, 1/12))

## crude mean survival
sm1 <- survmean(Surv(FUT, lex.Xst != "alive") ~ 1,
                pophaz = pm, data = x, weights = NULL,
                breaks = BL)
                
sm1 <- survmean(FUT ~ 1,
                pophaz = pm, data = x, weights = NULL,
                breaks = BL)             
## Not run: 
##D ## mean survival by group                 
##D sm2 <- survmean(FUT ~ group,
##D                 pophaz = pm, data = x, weights = NULL,
##D                 breaks = BL)
##D                 
##D ## ... and adjusted for age using internal weights (counts of subjects)      
##D ## note: need also longer extrapolation here so that all curves
##D ## converge to zero in the end.
##D eBL <- list(FUT = c(BL$FUT, 11:75))
##D sm3 <- survmean(FUT ~ group + adjust(agegr),
##D                 pophaz = pm, data = x, weights = "internal",
##D                 breaks = BL, e1.breaks = eBL)
## End(Not run)
## visual inspection of how realistic extrapolation is for each stratum;
## solid lines are observed + extrapolated survivals;
## dashed lines are expected survivals
plot(sm1)
## Not run: 
##D ## plotting object with both stratification and standardization
##D ## plots curves for each strata-std.group combination
##D plot(sm3)
##D 
##D ## for finer control of plotting these curves, you may extract
##D ## from the survmean object using e.g.
##D attributes(sm3)$survmean.meta$curves
##D 
##D 
##D #### using Dates
##D 
##D x <- Lexis(entry = list(FUT = 0L, AGE = dg_date-bi_date, CAL = dg_date),
##D            exit = list(CAL = ex_date),
##D            data = sire[sire$dg_date < sire$ex_date, ],
##D            exit.status = factor(status, levels = 0:2, 
##D                                 labels = c("alive", "canD", "othD")), 
##D            merge = TRUE)
##D ## phony group variable
##D set.seed(1L)
##D x$group <- rbinom(nrow(x), 1, 0.5)
##D 
##D                   
##D ## NOTE: population hazard should be reported at the same scale
##D ## as time variables in your Lexis data.
##D data(popmort, package = "popEpi")
##D pm <- data.frame(popmort)
##D names(pm) <- c("sex", "CAL", "AGE", "haz")
##D ## from year to day level
##D pm$haz <- pm$haz/365.25 
##D pm$CAL <- as.Date(paste0(pm$CAL, "-01-01")) 
##D pm$AGE <- pm$AGE*365.25 
##D 
##D BL <- list(FUT = seq(0, 8, 1/12)*365.25)
##D eBL <- list(FUT = c(BL$FUT, c(8.25,8.5,9:60)*365.25))
##D smd <- survmean(FUT ~ group, data = x, 
##D                 pophaz = pm, verbose = TRUE, r = "auto5",
##D                 breaks = BL, e1.breaks = eBL)     
##D plot(smd)
## End(Not run)





