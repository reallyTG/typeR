library(Pstat)


### Name: AitTrans
### Title: Aitchison transformation
### Aliases: AitTrans

### ** Examples

data(test)
AitTrans(test)

## The function is currently defined as
function (data, Rp = 0, Ri = 0) 
{
    nb.var = dim(data)[2] - 1
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
    nonNa.row <- function(data, row) {
        nb.na = 0
        for (i in 1:nb.var) if (is.na(data[row, i + 1])) 
            nb.na = nb.na + 1
        return(nb.var - nb.na)
    }
    data = dat.rem.ind.pop(data, ind = Ri, pop = Rp)
    nb.ind = dim(data)[1]
    cor.val = rep(0, nb.ind)
    for (i in 1:nb.ind) {
        cor.val[i] = 1/(nonNa.row(data, i)) * sum(log(data[i, 
            -1], base = 10), na.rm = TRUE)
        for (j in 1:nb.var) data[i, (j + 1)] = log(data[i, (j + 
            1)], base = 10) - cor.val[i]
    }
    return(data)
  }



