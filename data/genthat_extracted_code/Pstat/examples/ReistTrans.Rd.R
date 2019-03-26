library(Pstat)


### Name: ReistTrans
### Title: Reist standardization
### Aliases: ReistTrans

### ** Examples

data(test)
names(test)[9]
ReistTrans(test,reg=9)

## The function is currently defined as
function (data, reg, Rp = 0, Ri = 0) 
{
    dat.rem.ind.pop <- function(data, ind = 0, pop = 0) {
        data = as.data.frame(data)
        dat.rem.ind <- function(dat, ind) {
            nb.rem.ind = length(ind)
            nb.ind = dim(dat)[1]
            for (i in 1:nb.rem.ind) dat = dat[row.names(dat)[1:(nb.ind - 
                i + 1)] != ind[i], ]
            return(dat)
        }
        dat.rem.pop <- function(dat, pop) {
            nb.rem.pop = length(pop)
            for (i in 1:nb.rem.pop) dat = dat[dat[, 1] != pop[i], 
                ]
            return(dat)
        }
        if (ind[1] != 0) 
            data = dat.rem.ind(data, ind)
        if (pop[1] != 0) 
            data = dat.rem.pop(data, pop)
        return(data)
    }
    Reitra.va <- function(dat, clm, re) {
        dat = dat[is.finite(dat[, re]), ]
        log.dat = dat
        mea = mean(dat[is.finite(dat[, clm]), re])
        log.dat[, clm] = log(dat[, clm], base = 10)
        log.dat[, re] = log(dat[, re], base = 10)
        mea.clm = mean(log.dat[is.finite(log.dat[, clm]), clm], 
            na.rm = TRUE)
        mea.reg = mean(log.dat[is.finite(log.dat[, clm]), re], 
            na.rm = TRUE)
        a = sum((log.dat[is.finite(log.dat[, clm]), re] - mea.reg) * 
            log.dat[is.finite(log.dat[, clm]), clm])/sum((log.dat[is.finite(log.dat[, 
            clm]), re] - mea.reg) * (log.dat[is.finite(log.dat[, 
            clm]), re] - mea.reg))
        dat[, clm] = log.dat[, clm] - a * (log.dat[, re] - log(mea, 
            base = 10))
        return(dat)
    }
    nb.var = dim(data)[2] - 1
    for (i in 1:nb.var) {
        if (names(data)[i + 1] == reg) 
            reg = i
    }
    if (is.numeric(reg) == FALSE) 
        return("reg value does not exist!")
    data = dat.rem.ind.pop(data, ind = Ri, pop = Rp)
    if (reg == 1) 
        for (i in 2:nb.var) data = Reitra.va(data, clm = i + 
            1, re = 2)
    else {
        for (i in 2:reg) data = Reitra.va(data, clm = i, re = reg + 
            1)
        if (reg < nb.var) 
            for (j in (reg + 1):nb.var) data = Reitra.va(data, 
                clm = j + 1, re = reg + 1)
    }
    return(data[-(reg + 1)])
  }



