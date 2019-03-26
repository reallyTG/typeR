library(Pstat)


### Name: TracePst
### Title: Pst variations in function of c/h^2
### Aliases: TracePst

### ** Examples


data(test)
# TracePst(test)
# TracePst(test,boot=2000,va="QM7",Ri=18,pe=0.9,pts=40,xm=4)
TracePst(test,va=7:10,Fst=0.3,Ri=c(22,27,195),Rp=c("A","C","E"),ci=0)
# TracePst(test,va="QM1",Ri=c(3,7:17),Pw=c("C","D"),pts=20)

## The function is currently defined as
function (data, va = 0, ci = 1, boot = 1000, pe = 0.95, Fst = -1, 
    Pw = 0, Rp = 0, Ri = 0, xm = 2, pts = 30) 
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
        return(c(boot.pst.val[floor(boot * (1 - per)/2 + 1)], 
            boot.pst.val[ceiling(boot * (per + 1)/2)]))
    }
    Trace <- function(data, pts, boot, Fst, xm, ci) {
        tra.pst.fst.va <- function(data, pts, clm, Fst, xmax, 
            lab.pos) {
            data = data[, c(1, clm)]
            points <- function(nb.pts) {
                pst.va = Pst.val(data, 0)
                for (i in 1:nb.pts) pst.va = c(pst.va, Pst.val(data, 
                  xmax * i/nb.pts))
                return(pst.va)
            }
            pst.val = points(nb.pts = pts)
            csh.val = xm * c(0:pts)/pts
            plot(pst.val ~ csh.val, type = "l", xlab = "c/h^2", 
                ylab = "Pst", main = c("Pst variations:", names(data)[2]), 
                ylim = c(0, 1), col = "firebrick1")
            if (Fst != -1) {
                abline(h = Fst, col = "green", lty = 4)
                text(0.05 * lab.pos - 0.06, Fst + 0.04 * lab.pos - 
                  0.01, "Fst", col = "green")
            }
        }
        tra.confint.va <- function(clm) {
            point <- function(nb.pt) {
                ci.pst.va = ConInt.pst.va(data, csh = 0, boot = boot, 
                  clm = clm, per = pe)
                upbnd.val = ci.pst.va[2]
                lowbnd.val = ci.pst.va[1]
                for (i in 1:nb.pt) ci.pst.va = c(ci.pst.va, ConInt.pst.va(data, 
                  csh = xm * i/nb.pt, boot = boot, clm = clm, 
                  per = pe))
                for (i in 1:nb.pt) upbnd.val = c(ci.pst.va[2 + 
                  2 * i], upbnd.val)
                for (i in 1:nb.pt) lowbnd.val = c(lowbnd.val, 
                  ci.pst.va[1 + 2 * i])
                return(c(upbnd.val, lowbnd.val))
            }
            ci.pst.val = point(nb.pt = pts)
            csh.val = xm * c(0:pts)/pts
            rev.csh.val = rev(csh.val)
            plot(ci.pst.val ~ c(rev.csh.val, csh.val), type = "l", 
                xlab = "c/h^2", ylab = "Pst", main = c("Pst variations:", 
                  names(data)[clm]), ylim = c(0, 1), col = "chocolate4", 
                lty = 2)
        }
        nb.var = dim(data)[2] - 1
        nb.gra.lon = ceiling(sqrt(nb.var))
        par(mfrow = c(nb.gra.lon, nb.gra.lon))
        for (i in 1:nb.var) {
            tra.pst.fst.va(data, pts = pts, Fst = Fst, clm = i + 
                1, xmax = xm, lab.pos = nb.gra.lon)
            if (ci == 1) {
                par(new = TRUE)
                tra.confint.va(clm = i + 1)
            }
        }
    }
    if (va[1] == 0) {
        nb.var = dim(data)[2] - 1
        va = 1:nb.var
    }
    else {
        nb.var = length(va)
        for (i in 1:nb.var) {
            for (j in 2:dim(data)[2]) {
                if (names(data)[j] == va[i]) 
                  va[i] = j - 1
            }
        }
        va = as.numeric(va)
        if (is.na(sum(va)) == TRUE) 
            return("va is not valid!")
    }
    data = dat.fra.prep(data)
    data = dat.rem.ind.pop(data, ind = Ri, pop = Rp)
    data = dat.pw(data, Pw)
    print("Populations sizes are:")
    print(pop.freq(data))
    data = data[, c(1, va + 1)]
    dev.new()
    Trace(data, pts = pts, boot = boot, Fst = Fst, xm = xm, ci = ci)
  }



