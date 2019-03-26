library(Pstat)


### Name: BootPst
### Title: Bootstrap method
### Aliases: BootPst

### ** Examples

data(test)
# BootPst(test,va=1)
# BootPst(test,va="QM7",opt="ci",csh=0.8,boot=500,Ri=18)
# BootPst(test,va=11,opt="ci",Ri=c(22,27,195),Rp=c("A","B","E"),pe=0.9)
BootPst(test,va="Body_length",boot=80,opt="hist",bars=50)
# BootPst(test,va=4,opt="hist",Ri=c(3,7:17),Pw=c("C","D"))

## The function is currently defined as
function (data, va, opt = 0, csh = 1, boot = 1000, Ri = 0, Rp = 0, 
    Pw = 0, pe = 0.95, bars = 20) 
{
    nonNa.clm <- function(data, clm) {
        nb.ind = dim(data)[1]
        nb.na = 0
        for (i in 1:nb.ind) if (is.na(data[i, clm])) 
            nb.na = nb.na + 1
        return(nb.ind - nb.na)
    }
    dat.fra.prep <- function(data) {
        nb.var = dim(data)[2] - 1
        data = as.data.frame(data)
        data[, 1] = as.character(data[, 1])
        for (i in 1:nb.var) {
            if (is.numeric(data[, i + 1]) == FALSE) 
                data[, i + 1] = as.numeric(as.character(data[, 
                  i + 1]))
        }
        dat.sta <- function(dat) {
            nb.vari = dim(dat)[2] - 1
            st.dev = rep(0, nb.vari)
            mea = rep(0, nb.vari)
            for (i in 1:nb.vari) {
                nna.clm = nonNa.clm(dat, i + 1)
                st.dev[i] = sqrt((nna.clm - 1)/nna.clm) * sd(dat[, 
                  i + 1], na.rm = TRUE)
                mea[i] = mean(dat[, i + 1], na.rm = TRUE)
            }
            for (j in 1:nb.vari) dat[, j + 1] = (dat[, j + 1] - 
                mea[j])/st.dev[j]
            return(dat)
        }
        data = dat.sta(data)
        return(data)
    }
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
    dat.pw <- function(data, pw = 0) {
        if (pw[1] == 0) 
            return(data)
        else {
            data = data[data[, 1] == pw[1] | data[, 1] == pw[2], 
                ]
            return(data)
        }
    }
    nb.pop <- function(data) {
        data = data[order(data[, 1]), ]
        nb.ind = dim(data)[1]
        nb.pop = 1
        for (i in 1:(nb.ind - 1)) if (data[i, 1] != data[i + 
            1, 1]) 
            nb.pop = nb.pop + 1
        return(nb.pop)
    }
    pop.freq <- function(data) {
        data = data[order(data[, 1]), ]
        nb.ind = dim(data)[1]
        dat.fra = as.data.frame(data)
        nb.pop = 1
        for (i in 1:(nb.ind - 1)) if (data[i, 1] != data[i + 
            1, 1]) 
            nb.pop = nb.pop + 1
        pop.freq.vec = rep(1, nb.pop)
        name = rep(0, nb.pop)
        k = 1
        name[1] = as.character(dat.fra[1, 1])
        for (i in 2:nb.ind) if (dat.fra[i - 1, 1] == dat.fra[i, 
            1]) 
            pop.freq.vec[k] = pop.freq.vec[k] + 1
        else {
            k = k + 1
            name[k] = as.character(dat.fra[i, 1])
        }
        names(pop.freq.vec) = name
        return(pop.freq.vec)
    }
    Pst.val <- function(data, csh = 1) {
        nbpop = nb.pop(data)
        nb.var = dim(data)[2] - 1
        data = data[order(data[, 1]), ]
        if (nbpop == 1) 
            return(rep(0, nb.var))
        else {
            pop.freq = pop.freq(data)
            Pst.clm <- function(dat, clm) {
                mea = mean(dat[, clm], na.rm = TRUE)
                nna.clm = nonNa.clm(dat, clm)
                SSTotal = (nna.clm - 1) * var(dat[, clm], na.rm = TRUE)
                mea.pop = rep(0, nbpop)
                nna.pop.freq = rep(0, nbpop)
                nna.pop.freq[1] = nonNa.clm(dat[1:(pop.freq[1]), 
                  ], clm)
                nb.allna.pop = 0
                if (nna.pop.freq[1] == 0) 
                  nb.allna.pop = 1
                else mea.pop[1] = mean(dat[1:(pop.freq[1]), clm], 
                  na.rm = TRUE)
                for (i in 2:nbpop) {
                  nna.pop.freq[i] = nonNa.clm(dat[(sum(pop.freq[1:(i - 
                    1)]) + 1):(sum(pop.freq[1:i])), ], clm)
                  if (nna.pop.freq[i] != 0) 
                    mea.pop[i] = mean(dat[(sum(pop.freq[1:(i - 
                      1)]) + 1):(sum(pop.freq[1:i])), clm], na.rm = TRUE)
                  else nb.allna.pop = nb.allna.pop + 1
                }
                SSBetween = sum(nna.pop.freq * (mea.pop - mea)^2)
                SSWithin = SSTotal - SSBetween
                if ((nna.clm - nbpop + nb.allna.pop) * (nbpop - 
                  nb.allna.pop - 1) != 0) {
                  MSWithin = SSWithin/(nna.clm - nbpop + nb.allna.pop)
                  MSBetween = SSBetween/(nbpop - nb.allna.pop - 
                    1)
                  return(csh * MSBetween/(csh * MSBetween + 2 * 
                    MSWithin))
                }
                else {
                  if ((nna.clm - nbpop + nb.allna.pop) == 0) 
                    return(1)
                  else return(0)
                }
            }
            pst.val = rep(0, nb.var)
            for (j in 1:nb.var) pst.val[j] = Pst.clm(data, j + 
                1)
            return(pst.val)
        }
    }
    boot.pst.va <- function(data, csh, boot, clm) {
        nb.ind = dim(data)[1]
        dat = data[, c(1, clm)]
        boot.val = rep(0, boot)
        for (i in 1:boot) {
            da = dat[sample(1:nb.ind, nb.ind, T), ]
            boot.val[i] = Pst.val(da, csh)
        }
        return(boot.val)
    }
    ConInt.pst.va <- function(data, csh, boot, clm, per) {
        boot.pst.val = boot.pst.va(data = data, csh = csh, boot = boot, 
            clm = clm)
        boot.pst.val = sort(boot.pst.val)
        print(c(boot.pst.val[floor(boot * (1 - per)/2 + 1)], 
            boot.pst.val[ceiling(boot * (per + 1)/2)]))
        return(boot.pst.val)
    }
    dis.pst.va <- function(data, csh, boot, clm, bars) {
        psts.val = boot.pst.va(data = data, csh = csh, boot = boot, 
            clm = clm)
        hist(psts.val, breaks = c(0:bars)/bars, xlab = "Pst", 
            ylab = "Frequency", main = c("Pst distribution:", 
                names(data)[clm]), col = "gray88")
        return(sort(psts.val))
    }
    for (i in 2:dim(data)[2]) {
        if (names(data)[i] == va) 
            va = i - 1
    }
    if (is.numeric(va) == FALSE) 
        return("va value does not exist!")
    data = dat.fra.prep(data)
    data = dat.rem.ind.pop(data, ind = Ri, pop = Rp)
    data = dat.pw(data, pw = Pw)
    print("The studied quantitative variable is:")
    print(names(data)[va + 1])
    print("Populations sizes are:")
    print(pop.freq(data))
    if (opt != "ci" & opt != "hist") {
        print(paste(boot, "bootstrap values:"))
        return(boot.pst.va(data, csh = csh, boot = boot, clm = va + 
            1))
    }
    if (opt == "ci") {
        print(paste(100 * pe, "% confidence interval determined by", 
            boot, "bootstrap values:"))
        return(ConInt.pst.va(data, csh = csh, boot = boot, clm = va + 
            1, per = pe))
    }
    if (opt == "hist") {
        print(paste(boot, "bootstrap values and", "Pst distribution:"))
        dev.new()
        dis.pst.va(data = data, csh = csh, boot = boot, clm = va + 
            1, bars = bars)
    }
  }



