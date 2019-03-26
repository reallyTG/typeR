library(fitteR)


### Name: printReport
### Title: Prepare report of fitting
### Aliases: printReport

### ** Examples

# discrete empirical data
x <- rnbinom(100, 0.5, 0.2)
r <- fitter(x, dom="dis", posList=list(stats=NA))
# create only 'shiny' app
out <- printReport(r, type="shiny")
names(out)
## Not run:  out$shiny 
out <- printReport(r, type=c("csv")) # warning as 'file' is NULL, 
str(out) # but table (data.frame) returned




