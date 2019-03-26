library(pksensi)


### Name: solve_mcsim
### Title: Solve PK Model Through MCSim
### Aliases: solve_mcsim generate_infile

### ** Examples

## Not run: 
##D url <- "https://raw.githubusercontent.com/nanhung/pksensi/master/tests/1cpt.model"
##D destfile <- paste0(getwd(),"/1cpt.model")
##D download.file(url, destfile)
##D mName <- "1cpt"
##D compile_model(mName)
##D 
##D q <- "qunif"
##D q.arg <- list(list(min = 0.6, max = 1.0),
##D    list(min = 0.5, max = 1.5),
##D    list(min = 0.02, max = 0.3),
##D    list(min = 20, max = 60))
##D 
##D params <- c("Fgutabs","k_a","k_e","V_dist")
##D 
##D set.seed(1234)
##D x <- rfast99(params = params, n = 200, q = q, q.arg = q.arg, rep = 20)
##D 
##D infile.name <- "example.in"
##D outfile.name <- "example.csv"
##D vars <- "C_rest"
##D 
##D t <- seq(from = 0.25, to = 12.25, by = 0.5)
##D 
##D y <- solve_mcsim(x, mName = mName, infile.name = infile.name,
##D setpoint.name = "setpoint.dat",
##D outfile.name = outfile.name, params = params, vars = vars, time = t,
##D condition = "IngDose = 1")
##D 
##D pksim(y)
## End(Not run)




