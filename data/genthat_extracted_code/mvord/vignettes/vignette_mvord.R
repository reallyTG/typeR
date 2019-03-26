### R code from vignette source 'vignette_mvord.Rnw'
### Encoding: UTF-8

###################################################
### code chunk number 1: vignette_mvord.Rnw:80-82
###################################################
options(prompt = "R> ", continue = "+  ", width = 70,
        useFancyQuotes = FALSE, deparse.cutoff = 56)


###################################################
### code chunk number 2: vignette_mvord.Rnw:86-90
###################################################
library("mvord")
data("data_cr_panel")
data("data_cr")
cache <- TRUE


###################################################
### code chunk number 3: vignette_mvord.Rnw:828-830
###################################################
data(data_mvord_toy)
str(data_mvord_toy)


###################################################
### code chunk number 4: vignette_mvord.Rnw:836-841
###################################################
data_toy_long <- cbind.data.frame(i = rep(1:100,2),
  j = rep(1:2,each = 100), Y = c(data_mvord_toy$Y1, data_mvord_toy$Y2),
  X1 = rep(data_mvord_toy$X1, 2), X2 = rep(data_mvord_toy$X2, 2),
  f1 = rep(data_mvord_toy$f1, 2), f2 = rep(data_mvord_toy$f2, 2))
str(data_toy_long)


###################################################
### code chunk number 5: vignette_mvord.Rnw:847-848 (eval = FALSE)
###################################################
## res <- mvord(formula = MMO(Y, i, j) ~ 0 + X1 + X2, data = data_toy_long)


###################################################
### code chunk number 6: res1
###################################################
FILE <- "res1.rda"
if (cache & file.exists(FILE)) {
  load(FILE)
} else {
  if (cache) {
res <- mvord(formula = MMO(Y, i, j) ~ 0 + X1 + X2, data = data_toy_long)
res <- mvord:::reduce_size.mvord(res)
  save(res, file  = FILE)
  } else {
      if(file.exists(FILE)) file.remove(FILE)
  }
}


###################################################
### code chunk number 7: vignette_mvord.Rnw:964-965 (eval = FALSE)
###################################################
## res <- mvord(formula = MMO2(Y1, Y2) ~ 0 + X1 + X2, data = data_mvord_toy)


###################################################
### code chunk number 8: res2
###################################################
FILE <- "res2.rda"
if (cache & file.exists(FILE)) {
  load(FILE)
} else {
  if (cache) {
res <- mvord(formula = MMO2(Y1, Y2) ~ 0 + X1 + X2, data = data_mvord_toy)
res <- mvord:::reduce_size2.mvord(res)
  save(res, file  = FILE)
  } else {
      if(file.exists(FILE)) file.remove(FILE)
  }
}


###################################################
### code chunk number 9: vignette_mvord.Rnw:1344-1345
###################################################
names_constraints(formula = Y ~ 0 + X1 + X2 + f2, data = data_mvord_toy)


###################################################
### code chunk number 10: vignette_mvord.Rnw:1367-1369
###################################################
formula <- MMO2(Y1, Y2) ~ 1 + X1 : X2 + f1 + f2 * X1
names_constraints(formula, data = data_mvord_toy)


###################################################
### code chunk number 11: vignette_mvord.Rnw:1508-1509
###################################################
predict(res, subjectID =  1:6)


###################################################
### code chunk number 12: vignette_mvord.Rnw:1512-1513
###################################################
predict(res, type = "cum.prob", subjectID =  1:6)


###################################################
### code chunk number 13: vignette_mvord.Rnw:1516-1517
###################################################
predict(res, type = "class", subjectID =  1:6)


###################################################
### code chunk number 14: vignette_mvord.Rnw:1573-1576
###################################################
data(data_cr)
head(data_cr, n = 3)
str(data_cr, vec.len = 3)


###################################################
### code chunk number 15: plot_data
###################################################
op <- par(mfrow = c(1,4),
          oma = c(0,1.1,0,0),
          mar = c(2,3,5,1))
cexf <- 1.8
barplot(table(data_cr$rater1),  ylim = c(0, 500), las=1, main="rater1",
        cex.lab = cexf, cex.names = cexf, cex.main = 2, cex.axis = cexf, col=rgb(0.2,0.4,0.6,0.6))
barplot(table(data_cr$rater2), ylim = c(0, 500),las=1, main="rater2",
        cex.lab = cexf, cex.names = cexf, cex.main = 2, cex.axis = cexf, col=rgb(0.2,0.4,0.6,0.6))
barplot(table(data_cr$rater3), ylim = c(0, 500),las=1,main="rater3",
        cex.lab = cexf, cex.names = cexf, cex.main = 2, cex.axis = cexf, col=rgb(0.2,0.4,0.6,0.6))
barplot(table(data_cr$rater4), las=1, ylim = c(0, 500), main="rater4",
        cex.lab = cexf, cex.names = cexf, cex.main = 2, cex.axis = cexf, col=rgb(0.2,0.4,0.6,0.6))
par(op)


###################################################
### code chunk number 16: vignette_mvord.Rnw:1607-1609 (eval = FALSE)
###################################################
## res_cor_probit_simple <- mvord(formula = MMO2(rater1, rater2, rater3,
##   rater4) ~ 0 + LR + LEV + PR + RSIZE + BETA, data = data_cr)


###################################################
### code chunk number 17: vignette_mvord.Rnw:1611-1625
###################################################
FILE <- "res_cor_probit_simple.rda"
if (cache & file.exists(FILE)) {
  load(FILE)
} else {
  if (cache) {
res_cor_probit_simple <- mvord(
    formula =
    MMO2(rater1, rater2, rater3, rater4) ~ 0 + LR + LEV + PR + RSIZE + BETA, data = data_cr)
res_cor_probit_simple <- mvord:::reduce_size.mvord(res_cor_probit_simple)
  save(res_cor_probit_simple, file  = FILE)
  } else {
      if(file.exists(FILE)) file.remove(FILE)
  }
}


###################################################
### code chunk number 18: vignette_mvord.Rnw:1632-1633
###################################################
summary(res_cor_probit_simple, call = FALSE)


###################################################
### code chunk number 19: vignette_mvord.Rnw:1645-1646
###################################################
thresholds(res_cor_probit_simple)


###################################################
### code chunk number 20: vignette_mvord.Rnw:1649-1650
###################################################
coef(res_cor_probit_simple)


###################################################
### code chunk number 21: vignette_mvord.Rnw:1653-1654
###################################################
error_structure(res_cor_probit_simple)[[11]]


###################################################
### code chunk number 22: vignette_mvord.Rnw:1672-1677 (eval = FALSE)
###################################################
## res_cor_logit <- mvord(formula = MMO2(rater1, rater2, rater3, rater4) ~
##     0 + LR + LEV + PR + RSIZE + BETA, data = data_cr, link = mvlogit(),
##     coef.constraints = cbind(LR = c(1, 1, 1, 1), LEV = c(1, 2, 3, 4),
##       PR = c(1, 1, 1, 1), RSIZE = c(1, 1, 1, 2), BETA = c(1, 1, 2, 3)),
##     threshold.constraints = c(1, 1, 2, 3))


###################################################
### code chunk number 23: vignette_mvord.Rnw:1680-1701
###################################################
FILE <- "res_cor_logit.rda"
if (cache & file.exists(FILE)) {
  load(FILE)
} else {
  if (cache) {
res_cor_logit <- mvord(formula = MMO2(rater1, rater2, rater3, rater4) ~
    0 + LR + LEV + PR + RSIZE + BETA, data = data_cr, link = mvlogit(),
  coef.constraints = cbind(
    c(1,1,1,1),
    c(1,2,3,4),
    c(1,1,1,1),
    c(1,1,1,2),
    c(1,1,2,3)),
    threshold.constraints = c(1, 1, 2, 3))
res_cor_logit <- mvord:::reduce_size2_Funi.mvord(res_cor_logit)
  save(res_cor_logit, file  = FILE)
  } else {
      if(file.exists(FILE)) file.remove(FILE)
  }

}


###################################################
### code chunk number 24: vignette_mvord.Rnw:1706-1707
###################################################
summary(res_cor_logit, call = FALSE)


###################################################
### code chunk number 25: vignette_mvord.Rnw:1714-1715
###################################################
constraints(res_cor_logit)$BETA


###################################################
### code chunk number 26: plot_fit1
###################################################
cols = rev(topo.colors(100))
# cols <- rev(colorspace::sequential_hcl(round(200),
#                                    h = 260, c = c(80, 0),
#                                    l = c(30, 90),
#                                    power = 0.7))
 scatterplot.mvord <- function(tab,
                               zlim = NULL, #xylim, num.bins=64,
                               col = cols,
                               xlab = NULL, ylab = NULL, main = NULL,
                               percent = FALSE,
                               #col.regression.line=1,
                               col.one.to.one.line=grey(0.4),
                               col.bar.legend=TRUE,
                               #plt.beyond.zlim=FALSE,
                               ...){

  if(percent == "all") tab <- tab/sum(tab)*100
  if(percent == "row") tab <- sweep(tab, 1, rowSums(tab), "/")
  if(percent == "col") tab <- sweep(tab, 2, colSums(tab), "/")

  if(percent %in% c("all", "row", "col")){  zlim = c(0,100)
    tab <- round(tab*100,4)
  }

  tab[tab==0] <- NA

  if (is.null(zlim))  zlim <- range(tab, na.rm=T)


    plot.seq.x <- seq_len(nrow(tab))
    plot.seq.y <- seq_len(ncol(tab))
    labels.x <- rownames(tab)
    labels.y <- colnames(tab)

    if(is.null(xlab)) xlab <- ""
    if(is.null(ylab)) ylab <- ""



  image(x=plot.seq.x, y=plot.seq.y, z=tab, zlim=zlim, col=col,
        xlab= "", ylab= "",
        main=main, axes = FALSE,
        xlim = c(min(plot.seq.x) - 1,max(plot.seq.x) + 1),
        ylim = c(min(plot.seq.y) - 1,max(plot.seq.y) + 1), ...)
  axis(1, at = plot.seq.x, line = 0.5, labels = labels.x)
  axis(2, at = plot.seq.y, line = 0.5, labels = labels.y, las = 1)
  title(xlab= xlab)
  title(ylab= ylab, line = 4)


  if (!is.null(col.one.to.one.line))
    segments(min(plot.seq.x) - 0.5, min(plot.seq.y) - 0.5,
          max(plot.seq.x) + 0.5, max(plot.seq.y) + 0.5, lty = 3,
          col=col.one.to.one.line)
    #abline(0, 1, lty=3, col=col.one.to.one.line)

  # if (col.bar.legend)
  #   aqfig::vertical.image.legend(col=col, zlim=zlim)
  starting.par.settings <- par(no.readonly = TRUE)
    mai <- par("mai")
    fin <- par("fin")
    x.legend.fig <- c(1 - (mai[4]/fin[1]), 1)
    y.legend.fig <- c(mai[1]/fin[2], 1 - (mai[3]/fin[2]))
    x.legend.plt <- c(x.legend.fig[1] + (0.08 * (x.legend.fig[2] -
        x.legend.fig[1])), x.legend.fig[2] - (0.6 * (x.legend.fig[2] -
        x.legend.fig[1])))
    y.legend.plt <- y.legend.fig
    cut.pts <- seq(zlim[1], zlim[2], length = length(col) + 1)
    z <- (cut.pts[1:length(col)] + cut.pts[2:(length(col) + 1)])/2
    par(new = TRUE, pty = "m", plt = c(x.legend.plt, y.legend.plt))
    image(x = 1, y = z, z = matrix(z, nrow = 1, ncol = length(col)),
        col = col, xlab = "", ylab = "", xaxt = "n", yaxt = "n")
    axis(4, mgp = c(3, 0.2, 0), las = 2, cex.axis = 0.8, tcl = -0.1)
    box()
    mfg.settings <- par()$mfg
    par(starting.par.settings)
    par(mfg = mfg.settings, new = FALSE)
}

op <- par(mfrow = c(2,2),
          oma = c(1,1,0,0),
          mar = c(4,5,2,3))
op <- par(mfrow = c(2,2),
          oma = c(0,0,0,0),
          mar = c(4,5,2,3))
scatterplot.mvord(
    table(res_cor_logit$rho$y[,1], marginal_predict(res_cor_logit, type = "class")[,1]),
                  main = "rater 1", ylab = "predicted", xlab = "observed", percent = "row")#row of table
scatterplot.mvord(
    table(res_cor_logit$rho$y[,2], marginal_predict(res_cor_logit, type = "class")[,2]),
                  main = "rater 2", ylab = "predicted", xlab = "observed", percent = "row")
scatterplot.mvord(
    table(res_cor_logit$rho$y[,3], marginal_predict(res_cor_logit, type = "class")[,3]),
                  main = "rater 3", ylab = "predicted", xlab = "observed", percent = "row")
scatterplot.mvord(
    table(res_cor_logit$rho$y[,4], marginal_predict(res_cor_logit, type = "class")[,4]),
                  main = "rater 4", ylab = "predicted", xlab = "observed", percent = "row")
par(op)


###################################################
### code chunk number 27: vignette_mvord.Rnw:1834-1836
###################################################
BIC(res_cor_probit_simple)
BIC(res_cor_logit)


###################################################
### code chunk number 28: vignette_mvord.Rnw:1839-1841
###################################################
AIC(res_cor_probit_simple)
AIC(res_cor_logit)


###################################################
### code chunk number 29: vignette_mvord.Rnw:1844-1846
###################################################
logLik(res_cor_probit_simple)
logLik(res_cor_logit)


###################################################
### code chunk number 30: vignette_mvord.Rnw:1853-1856
###################################################
data(data_cr_panel)
str(data_cr_panel, vec.len = 3)
head(data_cr_panel, n = 3)


###################################################
### code chunk number 31: vignette_mvord.Rnw:1887-1892 (eval = FALSE)
###################################################
## res_AR1_probit <- mvord(formula = MMO(rating, firm_id, year) ~ LR + LEV +
##   PR + RSIZE + BETA, error.structure = cor_ar1(~ BSEC), link = mvprobit(),
##   data = data_cr_panel, coef.constraints = c(rep(1, 4), rep(2, 4)),
##   threshold.constraints = rep(1, 8), threshold.values = rep(list(c(0, NA,
##     NA, NA)),8), mvord.control(solver = "BFGS"))


###################################################
### code chunk number 32: vignette_mvord.Rnw:1894-1915
###################################################
FILE <- "res_AR1_probit.rda"
if (cache & file.exists(FILE)) {
  load(FILE)
} else {
  if (cache) {
res_AR1_probit <- mvord(
  formula = MMO(rating, firm_id, year) ~ LR + LEV + PR + RSIZE +  BETA,
  data = data_cr_panel,
  error.structure = cor_ar1(~ BSEC),
  coef.constraints = c(rep(1,4), rep(2,4)),
  threshold.constraints = c(rep(1,8)),
  threshold.values = rep(list(c(0,NA,NA,NA)),8),
  link = mvprobit(),
  control = mvord.control(solver = "BFGS",  solver.optimx.control = list(trace = TRUE)))
   res_AR1_probit <- mvord:::reduce_size.mvord(res_AR1_probit)
  save(res_AR1_probit, file  = FILE)
  } else {
      if(file.exists(FILE)) file.remove(FILE)
  }

}


###################################################
### code chunk number 33: vignette_mvord.Rnw:1921-1922
###################################################
summary(res_AR1_probit, short = TRUE, call = FALSE)


###################################################
### code chunk number 34: vignette_mvord.Rnw:1928-1929
###################################################
error_structure(res_AR1_probit)


###################################################
### code chunk number 35: vignette_mvord.Rnw:1932-1933
###################################################
head(error_structure(res_AR1_probit, type = "corr"), n = 3)


###################################################
### code chunk number 36: vignette_mvord.Rnw:1936-1937
###################################################
head(error_structure(res_AR1_probit, type = "sigmas"), n = 1)


###################################################
### code chunk number 37: vignette_mvord.Rnw:1947-1948
###################################################
load("data_SRHS_long.rda")


###################################################
### code chunk number 38: vignette_mvord.Rnw:1950-1951 (eval = FALSE)
###################################################
## data(data_SRHS_long, package = "LMest")


###################################################
### code chunk number 39: vignette_mvord.Rnw:1953-1954
###################################################
str(data_SRHS_long)


###################################################
### code chunk number 40: echo
###################################################
data_SRHS_long$time <- rep(1:8, length(unique(data_SRHS_long$id)))


###################################################
### code chunk number 41: vignette_mvord.Rnw:1974-1978 (eval = FALSE)
###################################################
## res_srhs <- mvord(formula = MMO(srhs, id, time) ~ 0 + factor(gender) +
## 	factor(race) + factor(education) + age, data = data_SRHS_long,
##     threshold.constraints = rep(1, 8), coef.constraints = rep(1, 8),
##     error.structure = cor_ar1(~ 1), link = mvlogit(), PL.lag = 2)


###################################################
### code chunk number 42: vignette_mvord.Rnw:1980-1998
###################################################
FILE <- "res_srhs.rda"
if (cache & file.exists(FILE)) {
  load(FILE)
} else {
  if (cache) {
    res_srhs <- mvord(formula = MMO(srhs, id, time) ~ 0 +  factor(gender) +
   	    factor(race) + factor(education) + age,
                  data = data_SRHS_long,
                  link = mvlogit(),
                  threshold.constraints = rep(1, 8),
                  coef.constraints = rep(1, 8),
                  error.structure = cor_ar1(~1), PL.lag = 2)
   res_srhs <- mvord:::reduce_size.mvord(res_srhs)
    save(res_srhs, file  = FILE)
  } else {
      if(file.exists(FILE)) file.remove(FILE)
  }
}


###################################################
### code chunk number 43: vignette_mvord.Rnw:2004-2005
###################################################
unique(error_structure(res_srhs, type = "corr"))


###################################################
### code chunk number 44: vignette_mvord.Rnw:2008-2009
###################################################
summary(res_srhs, call = FALSE)


###################################################
### code chunk number 45: vignette_mvord.Rnw:2028-2034
###################################################
N <- "http://www-math.bgsu.edu/~albert/ord_book/Chapter5/essay_data/N.dat"
X <- "http://www-math.bgsu.edu/~albert/ord_book/Chapter5/essay_data/X.dat"
y  <- read.delim(url(N), header = F, sep = "")
wl <- read.delim(url(X), header = F, sep = "")[,2]
df <- cbind.data.frame(y, wl)
colnames(df)[1:5] <- paste0("Judge", 1:5)


###################################################
### code chunk number 46: vignette_mvord.Rnw:2042-2043
###################################################
head(df)


###################################################
### code chunk number 47: vignette_mvord.Rnw:2048-2052 (eval = FALSE)
###################################################
## res_essay_0 <- mvord(
##   formula = MMO2(Judge1, Judge2, Judge3, Judge4, Judge5) ~ -1,
##   data = df, threshold.constraints = rep(1, 5),
##   coef.constraints = rep(1, 5))


###################################################
### code chunk number 48: vignette_mvord.Rnw:2054-2074
###################################################
FILE <- "res_essay.rda"
if (cache & file.exists(FILE)) {
  load(FILE)
} else {
  if (cache) {
    res_essay_wl <- mvord(
      formula = MMO2(Judge1, Judge2, Judge3, Judge4, Judge5) ~ 0 + wl,
      data = df, threshold.constraints = rep(1, 5),
      coef.constraints = rep(1, 5))
    res_essay_wl <- mvord:::reduce_size2.mvord(res_essay_wl)
    res_essay_0 <- mvord(
      formula = MMO2(Judge1, Judge2, Judge3, Judge4, Judge5) ~ -1,
      data = df, threshold.constraints = rep(1, 5),
      coef.constraints = rep(1,5))
    res_essay_0 <- mvord:::reduce_size.mvord(res_essay_0)
    save(res_essay_0, res_essay_wl, file  = FILE)
  } else {
      if(file.exists(FILE)) file.remove(FILE)
  }
}


###################################################
### code chunk number 49: vignette_mvord.Rnw:2077-2078
###################################################
summary(res_essay_0, call = FALSE)


###################################################
### code chunk number 50: vignette_mvord.Rnw:2081-2085 (eval = FALSE)
###################################################
## res_essay_wl <- mvord(
##   formula = MMO2(Judge1, Judge2, Judge3, Judge4, Judge5) ~ 0 + wl,
##   data = df, threshold.constraints = rep(1, 5),
##   coef.constraints = rep(1, 5))


###################################################
### code chunk number 51: vignette_mvord.Rnw:2088-2089
###################################################
summary(res_essay_wl, call = FALSE)


###################################################
### code chunk number 52: vignette_mvord.Rnw:2092-2096
###################################################
agree_prob_list <- lapply(1:10, function(i)
  joint_probabilities(res_essay_wl, rep(i, 5)))
agree_prob <- Reduce("+", agree_prob_list)
summary(agree_prob)


###################################################
### code chunk number 53: vignette_mvord.Rnw:2100-2102 (eval = FALSE)
###################################################
## plot(df$wl, agree_prob,
##   xlab = "word length", ylab = "probability of agreement")


###################################################
### code chunk number 54: vignette_mvord.Rnw:2107-2109
###################################################
plot(df$wl, agree_prob,
  xlab = "word length", ylab = "probability of agreement")


