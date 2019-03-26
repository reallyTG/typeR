library(vfcp)


### Name: prosim
### Title: Monte Carlo method
### Aliases: prosim
### Keywords: ~kwd1 ~kwd2

### ** Examples

tht = 10.6
cx = c(0.05, 0.1, 0.15, 0.25)
pro = c(0.99999, 0.9999, 0.999, 0.99, 24, 16, 8, 4)
dm = 4
fam = "gumbel"
marg = rep(c("weibull", "betapr"), 2)
xo = rep(c(200, 2.75, 16.5, 6.60), 2)
#===========================
kop2 = kopula(fam, tht, dm)
fmc = c("", "", "clayton", "gumbel", "frank", "joe")
pro = c(0.999999, 0.99999, 0.9999, 16, 8, 4, 2)
tm3 = list()
tmk = list()
# di = dm*(dm - 1)/2
for (k in 1:length(cx)){
  tm3 = gentruk(tht, fm=fam, C=cx[k], pro)
  tmk[[k]] = tm3
}
np = 5
no = 100000
ncx = length(cx)
p = array(0, c(np*ncx, 2))
colnames(p) = c("C", "p")
k = 0
for (i in 1:length(cx)){
  for (j in 1:np){
    k = k + 1
    p[k, 1] = cx[i]
    p[k, 2] = prosim(C = cx[i], fam, tht, dm, no)
  }
}
plst = list()
print(paste(fam, "dim =", dm, "tht =", tht, "n =", no, "nrep.", np))
for (k in 1:ncx){
  plst[[k]] = summary(p[p[, 1] == cx[k], 2])
  print(paste("cx =", cx[k]))
  print(plst[[k]])
}




