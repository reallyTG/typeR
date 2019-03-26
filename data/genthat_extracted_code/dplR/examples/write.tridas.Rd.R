library(dplR)


### Name: write.tridas
### Title: Write Tree Ring Data Standard (TRiDaS) file
### Aliases: write.tridas
### Keywords: IO

### ** Examples
library(utils)
## Write raw ring widths
data(co021)
fname1 <- write.tridas(rwl.df = co021,
    fname = tempfile(fileext=".xml"), prec = 0.01,
    site.info = list(title = "Schulman old tree no. 1, Mesa Verde",
                     type = "unknown"),
    taxon = "Pseudotsuga menziesii var. menziesii (Mirb.) Franco",
    project.info = list(investigator = "E. Schulman",
                        title = "", category = "",
                        period = "", type = "unknown"))
print(fname1) # tempfile used for output

## Write mean value chronology of detrended ring widths
data(ca533)
ca533.rwi <- detrend(rwl = ca533, method = "ModNegExp")
ca533.crn <- chron(ca533.rwi, prefix = "CAM", prewhiten = TRUE)
fname2 <- write.tridas(crn = ca533.crn,
    fname = tempfile(fileext=".xml"),
    taxon = "Pinus longaeva D.K. Bailey",
    project.info =
        list(investigator = "Donald A. Graybill, V.C. LaMarche, Jr.",
             title = "Campito Mountain", category = "",
             period = "", type = "unknown"))
print(fname2) # tempfile used for output

unlink(c(fname1, fname2)) # remove the files



