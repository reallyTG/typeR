library(plink)


### Name: equate-methods
### Title: IRT True Score and Observed Score Equating
### Aliases: equate equate-methods equate,list-method
###   equate,irt.pars-method
### Keywords: methods

### ** Examples

# IRT true score and observed score examples from 
# Kolen & Brennan (2004, ch. 6)
pm <- as.poly.mod(36)
x <- as.irt.pars(KB04$pars, KB04$common,
  cat=list(rep(2,36),rep(2,36)), poly.mod=list(pm,pm))
out <- plink(x, rescale="MS", base.grp=2, D=1.7, exclude=list(27,NA))

# Create the quadrature points and weights
wt <- as.weight(
  theta=c(-5.2086,-4.163,-3.1175,-2.072,-1.0269,0.0184,
    1.0635,2.109,3.1546,4.2001),
  weight=c(0.000101,0.00276,0.03021,0.142,0.3149,0.3158,
    0.1542,0.03596,0.003925,0.000186))

# Conduct the equating
equate(out,weights1=wt, synth.weights=c(1,0),D=1.7)

# Conduct true score equating for specific true scores
equate(out, true.scores=7:15, ts.low=FALSE, D=1.7)

# Exclude all common items (assume they correspond to an external anchor)
equate(out, D=1.7, exclude="all.common")


# Observed score equating for mixed-format tests
pm1 <- as.poly.mod(55,c("drm","gpcm","nrm"),dgn$items$group1)
pm2 <- as.poly.mod(55,c("drm","gpcm","nrm"),dgn$items$group2)
x <- as.irt.pars(dgn$pars,dgn$common,dgn$cat,list(pm1,pm2))
out <- plink(x, rescale="HB") 
OSE <- equate(out, method="OSE", score=2)

# Display the equated scores
OSE[[1]]

# Multiple group equating
pars <- TK07$pars
common <- TK07$common
cat <- list(rep(2,26),rep(2,34),rep(2,37),rep(2,40),rep(2,41),rep(2,43))
pm1 <- as.poly.mod(26)
pm2 <- as.poly.mod(34)
pm3 <- as.poly.mod(37)
pm4 <- as.poly.mod(40)
pm5 <- as.poly.mod(41)
pm6 <- as.poly.mod(43)
pm <- list(pm1, pm2, pm3, pm4, pm5, pm6)
x <- as.irt.pars(pars, common, cat, pm, grp.names=paste("grade",3:8,sep=""))
out <- plink(x, rescale="SL")


# True score equating
equate(out, method="TSE")

# True score equating with the base group changed to 3
equate(out, method="TSE", base.grp=3)

# Observed score equating (These data are for non-equivalent groups, but
# this example is included to illustrate the multigroup capabilities)
OSE <- equate(out, method="OSE", base.grp=3)

# Display the equated scores for each group
OSE[[1]]




