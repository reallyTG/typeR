library(popEpi)


### Name: flexible_argument
### Title: Flexible Variable Usage in 'popEpi' Functions
### Aliases: flexible_argument

### ** Examples


data(sire)
## prepare data for e.g. 5-year "period analysis" for 2008-2012
## note: sire is a simulated cohort integrated into popEpi.
BL <- list(fot=seq(0, 5, by = 1/12))
x <- lexpand(sire, birth = bi_date, entry = dg_date, exit = ex_date,
             status = status %in% 1:2,
             breaks = BL)
              
x <- aggre(x, by = fot)

## silly example of referring to pyrs data by fixed character string;
## its possible that the real name wont be fixed in a real-life application.
pyrs <- "actual_pyrs"  
TF <- environment()
x$actual_pyrs <- as.numeric(x$pyrs)
x$pyrs <- 1
             
## this works (uses actual_pyrs eventually)
st <- survtab_ag(fot ~ 1, data = x, surv.type = "surv.obs",
                 pyrs = TF$pyrs, d = from0to1, 
                 surv.method = "hazard")
## this would be wrong (sees expression 'pyrs' and uses that column,
## which is not what is intended here)
st <- survtab_ag(fot ~ 1, data = x, surv.type = "surv.obs",
                 pyrs = pyrs, d = from0to1,
                 surv.method = "hazard")



