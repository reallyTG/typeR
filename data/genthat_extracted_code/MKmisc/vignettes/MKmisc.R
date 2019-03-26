## ------------------------------------------------------------------------
library(MKmisc)

## ------------------------------------------------------------------------
x <- rnorm(100)
IQrange(x)
IQR(x)

## ------------------------------------------------------------------------
sIQR(x)
sd(x)

## ------------------------------------------------------------------------
fiveNS(x)

## ---- fig.width=7, fig.height=7------------------------------------------
x <- rt(10, df = 3)
par(mfrow = c(1,2))
qboxplot(x, main = "1st and 3rd quartile")
boxplot(x, main = "Lower and upper hinge")

## ------------------------------------------------------------------------
## Example from Wikipedia
risks(p0 = 0.4, p1 = 0.1)
risks(p0 = 0.4, p1 = 0.5)

## ------------------------------------------------------------------------
or2rr(or = 1.5, p0 = 0.4)
or2rr(or = 1/6, p1 = 0.1)

## ------------------------------------------------------------------------
curve(log, from = -3, to = 5)
curve(glog, from = -3, to = 5, add = TRUE, col = "orange")
legend("topleft", fill = c("black", "orange"), legend = c("log", "glog"))

## ------------------------------------------------------------------------
curve(log10(x), from = -3, to = 5)
curve(glog10(x), from = -3, to = 5, add = TRUE, col = "orange")
legend("topleft", fill = c("black", "orange"), legend = c("log10", "glog10"))

## ------------------------------------------------------------------------
inv.glog(glog(10))
inv.glog(glog(10, base = 3), base = 3)
inv.glog10(glog10(10))
inv.glog2(glog2(10))

## ---- fig.width=7, fig.height=7------------------------------------------
res <- simCorVars(n = 500, r = 0.8)
cor(res$Var1, res$Var2)

## ---- fig.width=7, fig.height=7------------------------------------------
thyroid(TSH = 1.5, fT3 = 2.5, fT4 = 14, TSHref = c(0.2, 3.0),
        fT3ref = c(1.7, 4.2), fT4ref = c(7.6, 15.0))

## ------------------------------------------------------------------------
library(ggplot2)
data(mpg)
p1 <- ggplot(mpg, aes(displ, hwy)) + geom_point()
p1
p1 + scale_x_log10()
p1 + scale_x_glog10()
p1 + scale_y_log10()
p1 + scale_y_glog10()

## ------------------------------------------------------------------------
x <- matrix(rnorm(1000, mean = 10), nrow = 10)
g1 <- rep("control", 10)
y1 <- matrix(rnorm(500, mean = 11.25), nrow = 10)
y2 <- matrix(rnorm(500, mean = 9.75), nrow = 10)
g2 <- rep("treatment", 10)
group <- factor(c(g1, g2))
Data <- rbind(x, cbind(y1, y2))
pvals <- apply(Data, 2, function(x, group) t.test(x ~ group)$p.value,
               group = group)
## compute log-fold change
logfc <- function(x, group){
  res <- tapply(x, group, mean)
  log2(res[1]/res[2])
}
lfcs <- apply(Data, 2, logfc, group = group)
ps <- data.frame(pvals = pvals, logfc = lfcs)
ggplot(ps, aes(x = logfc, y = pvals)) + geom_point() +
    geom_hline(yintercept = 0.05) + scale_y_neglog10() +
    geom_vline(xintercept = c(-0.1, 0.1)) + xlab("log-fold change") +
    ylab("-log10(p value)") + ggtitle("A Volcano Plot")

## ---- fig.width=7, fig.height=7------------------------------------------
library(ggplot2)
## some random data
test <- data.frame(x = rnorm(10), y = rnorm(10), z = rnorm(10))
test.long <- melt.long(test)
test.long
ggplot(test.long, aes(x = variable, y = value)) +
  geom_boxplot(aes(fill = variable))
## introducing an additional grouping variable
group <- factor(rep(c("a","b"), each = 5))
test.long.gr <- melt.long(test, select = 1:2, group = group)
test.long.gr
ggplot(test.long.gr, aes(x = variable, y = value, fill = group)) +
  geom_boxplot()

## ------------------------------------------------------------------------
## default: "wilson"
binomCI(x = 12, n = 50)
## Clopper-Pearson interval
binomCI(x = 12, n = 50, method = "clopper-pearson")
## identical to 
binom.test(x = 12, n = 50)$conf.int

## ------------------------------------------------------------------------
x <- rnorm(50, mean = 2, sd = 3)
## mean and SD unknown
normCI(x)
## SD known
normCI(x, sd = 3)
## mean known
normCI(x, mean = 2)

## ------------------------------------------------------------------------
x <- rexp(100, rate = 0.5)
## exact
quantileCI(x = x, prob = 0.95)
## asymptotic
quantileCI(x = x, prob = 0.95, method = "asymptotic")

## ------------------------------------------------------------------------
## exact
medianCI(x = x)
## asymptotic
medianCI(x = x, method = "asymptotic")

## ------------------------------------------------------------------------
medianCI(x = x, minLength = TRUE)

## ------------------------------------------------------------------------
## exact
madCI(x = x)
## aysymptotic
madCI(x = x, method = "asymptotic")
## unstandardized
madCI(x = x, constant = 1)

## ------------------------------------------------------------------------
## Example from Wikipedia
rrCI(a = 15, b = 135, c = 100, d = 150)
rrCI(a = 75, b = 75, c = 100, d = 150)

## ------------------------------------------------------------------------
x <- c(runif(50, max = 0.6), runif(50, min = 0.4))
g <- c(rep(0, 50), rep(1, 50))
AUC(x, group = g)

## ------------------------------------------------------------------------
g <- c(rep(1, 50), rep(0, 50))
AUC(x, group = g)
## no switching
AUC(x, group = g, switchAUC = FALSE)

## ------------------------------------------------------------------------
g <- c(rep(0, 50), rep(1, 50))
AUC.test(pred1 = x, lab1 = g)

## ------------------------------------------------------------------------
x2 <- c(runif(50, max = 0.7), runif(50, min = 0.3))
g2 <- c(rep(0, 50), rep(1, 50))
AUC.test(pred1 = x, lab1 = g, pred2 = x2, lab2 = g2)

## ------------------------------------------------------------------------
x3 <- c(x, x2)
g3 <- c(g, c(rep(2, 50), rep(3, 50)))
pairwise.auc(x = x3, g = g3)

## ------------------------------------------------------------------------
x <- rnorm(100) ## assumed as log-data
g <- factor(sample(1:4, 100, replace = TRUE))
levels(g) <- c("a", "b", "c", "d")
## modified FC
pairwise.fc(x, g)
## "true" FC
pairwise.fc(x, g, mod.fc = FALSE)
## without any transformation
pairwise.logfc(x, g)

## ------------------------------------------------------------------------
pairwise.logfc(x, g, ave = median)

## ------------------------------------------------------------------------
pairwise.wilcox.test(airquality$Ozone, airquality$Month, 
                     p.adjust.method = "none")
## To avoid the warnings
library(exactRankTests)
pairwise.fun(airquality$Ozone, airquality$Month, 
             fun = function(x, y) wilcox.exact(x, y)$p.value)

## ------------------------------------------------------------------------
## Example: HIV test 
## 1. ELISA screening test (4th generation)
predValues(sens = 0.999, spec = 0.998, prev = 0.001)
## 2. Western-Plot confirmation test
predValues(sens = 0.998, spec = 0.999996, prev = 1/3)

## ------------------------------------------------------------------------
## example from dataset infert
fit <- glm(case ~ spontaneous+induced, data = infert, family = binomial())
pred <- predict(fit, type = "response")

## with group numbers
perfMeasures(pred, truth = infert$case, namePos = 1)

## with group names
my.case <- factor(infert$case, labels = c("control", "case"))
perfMeasures(pred, truth = my.case, namePos = "case")

## ------------------------------------------------------------------------
## example from dataset infert
fit <- glm(case ~ spontaneous+induced, data = infert, family = binomial())
pred <- predict(fit, type = "response")
optCutoff(pred, truth = infert$case, namePos = 1)
optCutoff(pred, truth = infert$case, namePos = 1,
          perfMeasure = "balanced Brier score", max = FALSE)
optCutoff(pred, truth = infert$case, namePos = 1,
          perfMeasure = "area under the ROC curve (AUC)")

## ------------------------------------------------------------------------
## Hosmer-Lemeshow goodness of fit tests for C and H statistic 
HLgof.test(fit = pred, obs = infert$case)
## e Cessie-van Houwelingen-Copas-Hosmer global goodness of fit test
HLgof.test(fit = pred, obs = infert$case, 
           X = model.matrix(case ~ spontaneous+induced, data = infert))

## ------------------------------------------------------------------------
## see n2 on page 1202 of Chu and Cole (2007)
power.diagnostic.test(sens = 0.99, delta = 0.14, power = 0.95) # 40
power.diagnostic.test(sens = 0.99, delta = 0.13, power = 0.95) # 43
power.diagnostic.test(sens = 0.99, delta = 0.12, power = 0.95) # 47

## ------------------------------------------------------------------------
## see Table 2 of Dobbin et al. (2008)
g <- 0.1
fc <- 1.6
ssize.pcc(gamma = g, stdFC = fc, nrFeatures = 22000)

## ------------------------------------------------------------------------
## identical results as power.t.test, since sd = sd1 = sd2 = 1
power.welch.t.test(n = 20, delta = 1)
power.welch.t.test(power = .90, delta = 1)
power.welch.t.test(power = .90, delta = 1, alternative = "one.sided")

## sd1 = 0.5, sd2 = 1
power.welch.t.test(delta = 1, sd1 = 0.5, sd2 = 1, power = 0.9)

## ------------------------------------------------------------------------
## examples from Table III in Zhu and Lakkis (2014)
power.nb.test(mu0 = 5.0, RR = 2.0, theta = 1/0.5, duration = 1, power = 0.8, approach = 1)
power.nb.test(mu0 = 5.0, RR = 2.0, theta = 1/0.5, duration = 1, power = 0.8, approach = 2)
power.nb.test(mu0 = 5.0, RR = 2.0, theta = 1/0.5, duration = 1, power = 0.8, approach = 3)

## ------------------------------------------------------------------------
## Generate some data
set.seed(123)
x <- rnorm(25, mean = 1)
x[sample(1:25, 5)] <- NA
y <- rnorm(20, mean = -1)
y[sample(1:20, 4)] <- NA
pair <- c(rnorm(25, mean = 1), rnorm(20, mean = -1))
g <- factor(c(rep("yes", 25), rep("no", 20)))
D <- data.frame(ID = 1:45, variable = c(x, y), pair = pair, group = g)

## Use Amelia to impute missing values
library(Amelia)
res <- amelia(D, m = 10, p2s = 0, idvars = "ID", noms = "group")

## Per protocol analysis (Welch two-sample t-test)
t.test(variable ~ group, data = D)
## Intention to treat analysis (Multiple Imputation Welch two-sample t-test)
mi.t.test(res$imputations, x = "variable", y = "group")

## Per protocol analysis (Two-sample t-test)
t.test(variable ~ group, data = D, var.equal = TRUE)
## Intention to treat analysis (Multiple Imputation two-sample t-test)
mi.t.test(res$imputations, x = "variable", y = "group", var.equal = TRUE)

## Specifying alternatives
mi.t.test(res$imputations, x = "variable", y = "group", alternative = "less")
mi.t.test(res$imputations, x = "variable", y = "group", alternative = "greater")

## One sample test
t.test(D$variable[D$group == "yes"])
mi.t.test(res$imputations, x = "variable", subset = D$group == "yes")
mi.t.test(res$imputations, x = "variable", mu = -1, subset = D$group == "yes",
          alternative = "less")
mi.t.test(res$imputations, x = "variable", mu = -1, subset = D$group == "yes",
          alternative = "greater")

## paired test
t.test(D$variable, D$pair, paired = TRUE)
mi.t.test(res$imputations, x = "variable", y = "pair", paired = TRUE)

## ------------------------------------------------------------------------
M <- matrix(rnorm(100), ncol = 5)
FL <- matrix(rpois(100, lambda = 10), ncol = 5) # only for this example
repMeans(x = M, flags = FL, use.flags = "max", ndups = 5, spacing = 4)

## ------------------------------------------------------------------------
af <- oneWayAnova(c(rep(1,5),rep(2,5)))
## p value
af(rnorm(10))
x <- matrix(rnorm(12*10), nrow = 10)
## 2-way ANOVA with interaction
af1 <- twoWayAnova(c(rep(1,6),rep(2,6)), rep(c(rep(1,3), rep(2,3)), 2))
## p values
apply(x, 1, af1)
## 2-way ANOVA without interaction
af2 <- twoWayAnova(c(rep(1,6),rep(2,6)), rep(c(rep(1,3), rep(2,3)), 2), 
                   interaction = FALSE)
## p values
apply(x, 1, af2)

## ------------------------------------------------------------------------
M <- matrix(rcauchy(1000), nrow = 5)
## Pearson
corDist(M)
## Spearman
corDist(M, method = "spearman")
## Minimum Covariance Determinant
corDist(M, method = "mcd")

## ------------------------------------------------------------------------
madMatrix(t(M))

## ---- fig.width=8, fig.height=7------------------------------------------
M <- matrix(rnorm(1000), ncol = 20)
colnames(M) <- paste("Sample", 1:20)
M.cor <- cor(M)
corPlot(M.cor, minCor = min(M.cor), labels = colnames(M))

## ---- fig.width=8, fig.height=7------------------------------------------
## random data
x <- matrix(rnorm(1000), ncol = 10)
## outliers
x[1:20,5] <- x[1:20,5] + 10
madPlot(x, new = TRUE, maxMAD = 2.5, labels = TRUE,
        title = "MAD: Outlier visible")
## in contrast
corPlot(x, new = TRUE, minCor = -0.5, labels = TRUE,
        title = "Correlation: Outlier masked")

## ---- fig.width=7, fig.height=9------------------------------------------
## generate some random data
data.plot <- matrix(rnorm(100*50, sd = 1), ncol = 50)
colnames(data.plot) <- paste("patient", 1:50)
rownames(data.plot) <- paste("gene", 1:100)
data.plot[1:70, 1:30] <- data.plot[1:70, 1:30] + 3
data.plot[71:100, 31:50] <- data.plot[71:100, 31:50] - 1.4
data.plot[1:70, 31:50] <- rnorm(1400, sd = 1.2)
data.plot[71:100, 1:30] <- rnorm(900, sd = 1.2)
nrcol <- 128
## Load required packages
library(gplots)
library(RColorBrewer)
myCol <- rev(colorRampPalette(brewer.pal(10, "RdBu"))(nrcol))
heatmap.2(data.plot, col =  myCol, trace = "none", tracecol = "black",
          main = "standard colors")
farbe <- heatmapCol(data = data.plot, col = myCol, 
                    lim = min(abs(range(data.plot)))-1)
heatmap.2(data.plot, col = farbe, trace = "none", tracecol = "black",
          main = "heatmapCol colors")

## ------------------------------------------------------------------------
x <- "GACGGATTATG"
y <- "GATCGGAATAG"
## Hamming distance
stringDist(x, y)
## Levenshtein distance
d <- stringDist(x, y)
d

## ------------------------------------------------------------------------
attr(d, "ScoringMatrix")
attr(d, "TraceBackMatrix")

## ------------------------------------------------------------------------
## optimal global alignment score
d <- stringSim(x, y)
d
attr(d, "ScoringMatrix")
attr(d, "TraceBackMatrix")

## optimal local alignment score
d <- stringSim(x, y, global = FALSE)
d
attr(d, "ScoringMatrix")
attr(d, "TraceBackMatrix")

## ------------------------------------------------------------------------
x <- "GACGGATTATG"
y <- "GATCGGAATAG"
## Levenshtein distance
d <- stringDist(x, y)
## optimal global alignment
traceBack(d)

## Optimal global alignment score
d <- stringSim(x, y)
## optimal global alignment
traceBack(d)

## Optimal local alignment score
d <- stringSim(x, y, global = FALSE)
## optimal local alignment
traceBack(d, global = FALSE)

## ------------------------------------------------------------------------
sessionInfo()

