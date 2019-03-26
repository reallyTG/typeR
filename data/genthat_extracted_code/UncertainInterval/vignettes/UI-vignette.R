## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ---- fig.height = 5, fig.width = 7, results='asis'----------------------
intersect.binormal <- function(m1, sd1, m2, sd2, p1=.5, p2=.5){
  
  B <- (m1/sd1^2 - m2/sd2^2)
  A <- 0.5*(1/sd2^2 - 1/sd1^2)
  C <- 0.5*(m2^2/sd2^2 - m1^2/sd1^2) - log((sd1/sd2)*(p2/p1))
  
  if (A!=0){
    (-B + c(1,-1)*sqrt(B^2 - 4*A*C))/(2*A)
  } else {-C/B}
} 

x = seq(-5,8,length=1000)
mu0=0; sd0=1; mu1=2; sd1=2
y0 <- dnorm(x,mu0, sd0)
y1 <- dnorm(x, mu1, sd1)
is=intersect.binormal(mu0, sd0, mu1, sd1)
plot(x,y0,type='l', col='green', xlab='predictor', ylab='density', main='Figure 1')
lines(x,y1,type='l', col='black')
legend('topright', legend=c('H0', 'H1'), lty=c(1,1), col=c('green', 'black'), cex=.7)
threshold = qnorm(.90, mu0, sd0) # allowing a FPR of .1
abline(v=c(is[2], threshold), col=c( 'red', 'black'))
text(1.9, 0.03, expression(alpha), col='green')
text(0, 0.03, expression(beta), col='black')


## ----fig2, fig.height = 5, fig.width = 7, fig.cap="Figure 2"-------------
library(UncertainInterval)
data(psa2b)
names(psa2b)
plotMD(psa2b$d, psa2b$tpsa)
abline(v=4, col='red')


## ------------------------------------------------------------------------
t2 = table (psa2b$tpsa > 4, psa2b$d)
rownames(t2) <- c('PSA <= 4', 'PSA > 4')
library(knitr)
kable(addmargins(t2), caption = "Table 1")

## ------------------------------------------------------------------------
(res=ui.nonpar(psa2b$d, psa2b$tpsa))

## ------------------------------------------------------------------------
(out=quality.threshold(psa2b$d, psa2b$tpsa, res[1], res[2]))

## ------------------------------------------------------------------------
(t2 = quality.threshold.uncertain(psa2b$d, psa2b$tpsa, res[1], res[2]))

## ----fig.cap="Figure 3"--------------------------------------------------
sel = psa2b$tpsa >= res[1] & psa2b$tpsa <= res[2]
plotMD(psa2b$d[sel], psa2b$tpsa[sel])


## ------------------------------------------------------------------------
kable(t2$table, caption = "Table 2")


## ----echo=TRUE-----------------------------------------------------------
(res=ui.nonpar(psa2b$d, psa2b$tpsa, sens=.60, spec=.60))
quality.threshold(psa2b$d, psa2b$tpsa, res[1], res[2])$indices[c('specificity',  'sensitivity')]

(res=ui.nonpar(psa2b$d, psa2b$tpsa, sens=.65, spec=.65))
quality.threshold(psa2b$d, psa2b$tpsa, res[1], res[2])$indices[c('specificity',  'sensitivity')]

(res=ui.nonpar(psa2b$d, psa2b$tpsa, sens=.70, spec=.70))
quality.threshold(psa2b$d, psa2b$tpsa, res[1], res[2])$indices[c('specificity',  'sensitivity')]

## ----fig.cap="Figures 4 & 5", fig.show='hold',fig.align='center'---------
library(UncertainInterval)
library(car)
data(psa2b)
p1 = powerTransform(psa2b$tpsa)
t_tpsa = bcPower(psa2b$tpsa, p1$roundlam)

qqPlot(t_tpsa[psa2b$d==0])
qqPlot(t_tpsa[psa2b$d==1])

## ----fig.cap="Figure 6"--------------------------------------------------

plotMD(psa2b$d, t_tpsa, model='binormal', position.legend = 'topleft')
(res1=ui.binormal(psa2b$d, t_tpsa))
abline(v=res1$solution, col= 'red')

invBoxCox <- function(x, lambda)
  if (lambda == 0) exp(x) else (lambda*x + 1)^(1/lambda)
invBoxCox(res1$solution, p1$roundlam)



## ----fig.cap="Figure 7"--------------------------------------------------
outlier_values <- boxplot.stats(t_tpsa)$out  # outlier values.
inds <- which(t_tpsa %in% outlier_values)
table(outlier_values, psa2b$d[inds])
boxplot(t_tpsa, main="", boxwex=0.1)
# mtext(paste("Outliers: ", paste(round(outlier_values, 2), collapse=", ")), # cex=0.6)


## ------------------------------------------------------------------------
sel=t_tpsa > -3
plotMD(psa2b$d[sel], t_tpsa[sel], model='binormal')
(res55=ui.binormal(psa2b$d[sel], t_tpsa[sel]))
abline(v=res55$solution, col= 'red')

invBoxCox <- function(x, lambda)
  if (lambda == 0) exp(x) else (lambda*x + 1)^(1/lambda)
invBoxCox(res55$solution, p1$roundlam)

## ------------------------------------------------------------------------
res60=ui.binormal(psa2b$d[sel], t_tpsa[sel], Se=.60, Sp=.60)
res60$results
quality.threshold.uncertain(psa2b$d, t_tpsa, res60$solution[1], res60$solution[2])$indices[c('specificity',  'sensitivity')]
quality.threshold(psa2b$d, t_tpsa, res60$solution[1], res60$solution[2])$indices[c('specificity',  'sensitivity')]

res65=ui.binormal(psa2b$d[sel], t_tpsa[sel], Se=.65, Sp=.65)
res65$results
quality.threshold.uncertain(psa2b$d, t_tpsa, res65$solution[1], res65$solution[2])$indices[c('specificity',  'sensitivity')]
quality.threshold(psa2b$d, t_tpsa, res65$solution[1], res65$solution[2])$indices[c('specificity',  'sensitivity')]

res70=ui.binormal(psa2b$d[sel], t_tpsa[sel], Se=.70, Sp=.70)
res70$results
quality.threshold.uncertain(psa2b$d, t_tpsa, res70$solution[1], res70$solution[2])$indices[c('specificity',  'sensitivity')]
quality.threshold(psa2b$d, t_tpsa, res70$solution[1], res70$solution[2])$indices[c('specificity',  'sensitivity')]


## ------------------------------------------------------------------------
quality.threshold(psa2b$d, t_tpsa, res55$solution[1], res55$solution[2])$table
quality.threshold(psa2b$d, t_tpsa, res60$solution[1], res60$solution[2])$table
quality.threshold(psa2b$d, t_tpsa, res65$solution[1], res65$solution[2])$table
quality.threshold(psa2b$d, t_tpsa, res70$solution[1], res70$solution[2])$table

res70$solution
invBoxCox(res70$solution, p1$roundlam)

## ------------------------------------------------------------------------
data("tostbegg2")
sel = tostbegg2$type==0
plotMD(ref=tostbegg2$d, test=tostbegg2$y, model='ordinal')



## ------------------------------------------------------------------------
ui.ordinal(ref=tostbegg2$d, test=tostbegg2$y, return.all=TRUE)

