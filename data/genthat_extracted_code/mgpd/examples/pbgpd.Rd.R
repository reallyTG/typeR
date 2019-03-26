library(mgpd)


### Name: pbgpd
### Title: internal
### Aliases: pbgpd
### Keywords: internal

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (x, y, model = "log", mar1 = c(0, 1, 0.1), mar2 = c(0, 
    1, 0.1), dep = 2, a = 1/2, b = 1/2, asy = 0, p = 3, ...) 
{
    pbgpd = NULL
    models = c("log", "psilog", "philog", "neglog", "psineglog", 
        "phineglog", "bilog", "negbilog", "ct", "taj")
    if (!(model %in% models)) 
        stop(paste("'", model, "' is an unknown model.", sep = ""))
    else {
        if (model == "log") 
            pbgpd = pbgpd_log(x, y, mar1 = mar1, mar2 = mar2, 
                dep = dep)
        if (model == "psilog") 
            pbgpd = pbgpd_psilog(x, y, mar1 = mar1, mar2 = mar2, 
                dep = dep, asy = asy, p = p)
        if (model == "philog") 
            pbgpd = pbgpd_philog(x, y, mar1 = mar1, mar2 = mar2, 
                dep = dep, asy = asy, p = p)
        if (model == "neglog") 
            pbgpd = pbgpd_neglog(x, y, mar1 = mar1, mar2 = mar2, 
                dep = dep)
        if (model == "psineglog") 
            pbgpd = pbgpd_psineglog(x, y, mar1 = mar1, mar2 = mar2, 
                dep = dep, asy = asy, p = p)
        if (model == "phineglog") 
            pbgpd = pbgpd_phineglog(x, y, mar1 = mar1, mar2 = mar2, 
                dep = dep, asy = asy, p = p)
        if (model == "bilog") 
            pbgpd = pbgpd_bilog(x, y, mar1 = mar1, mar2 = mar2, 
                dep = dep, a = a, b = b)
        if (model == "negbilog") 
            pbgpd = pbgpd_negbilog(x, y, mar1 = mar1, mar2 = mar2, 
                dep = dep, a = a, b = b)
        if (model == "ct") 
            pbgpd = pbgpd_ct(x, y, mar1 = mar1, mar2 = mar2, 
                a = a, b = b)
        if (model == "taj") 
            pbgpd = pbgpd_taj(x, y, mar1 = mar1, mar2 = mar2, 
                a = a, b = b)
    }
    pbgpd
  }



