## ---- eval=FALSE---------------------------------------------------------
#  install.packages("tsdf")

## ---- eval=FALSE---------------------------------------------------------
#  #check if devtools is installed
#  if(!"devtools" %in% rownames(installed.packages())){
#  	install.packages(devtools)
#  }
#  devtools::install_github("wguo1990/tsdf")

## ------------------------------------------------------------------------
library(tsdf)

## ------------------------------------------------------------------------
# type I errors
alpha1 <- 0.15
alpha2 <- 0.10
# type II error
beta <- 0.15
# response rate
pc <- 0.25
# alternative 
pt <- pc + 0.20
# 2-stage design
out <- opt.design(alpha1, alpha2, beta, pc, pt, stage = 2)

## ------------------------------------------------------------------------
print(out)

## ---- eval=FALSE---------------------------------------------------------
#  opt.design(alpha1, alpha2, beta, pc, pt, stage = 2, sf.param = 1)

## ------------------------------------------------------------------------
# sample size 
n <- rep(3, 3)
# type I errors 
alpha.l <- 0.6
alpha.r <- 0.4
alpha.u <- 0.2
# target toxicity 
pt <- 0.3
# call dec.table
out <- dec.table(alpha.l, alpha.r, alpha.u, pt, n)

## ------------------------------------------------------------------------
print(out)

## ------------------------------------------------------------------------
plot(out)

## ------------------------------------------------------------------------
# true toxicity
truep <- c(0.3, 0.45, 0.5, 0.6)
# generate a decision table
dt <- dec.table(0.6,0.4,0.2,0.3,c(3,3,3))
# run simulation
out1 <- dec.sim(truep, dt$table, start.level = 2, nsim = 1000)

## ------------------------------------------------------------------------
test.file <- system.file("extdata", "testS.csv", package = "tsdf")

## ------------------------------------------------------------------------
out2 <- sl.sim(dt$table, test.file)

## ------------------------------------------------------------------------
# target toxicity 
pt <- c(0.3, 0.4)
summary(out2, pt)

## ------------------------------------------------------------------------
# input information (true toxicity)
plot(out2, s = 2, pt = c(0.3, 0.4), type="s")
# probability of selecting as MTD at each dose level
plot(out2, s = 2, pt = c(0.3, 0.4), type = "prob")
# average number of patients treated at each dose level
plot(out2, s = 2, pt = c(0.3, 0.4), type = "np")
# number of DLTs experienced at each dose level
plot(out2, s = 2, pt = c(0.3, 0.4), type="dlt")

## ----fig.height = 8------------------------------------------------------
plot(out2, pt = c(0.3, 0.4), type = "all", cex = 0.7)

## ----echo=FALSE, results='asis'------------------------------------------
sl <- system.file("extdata", "testS.csv", package = "tsdf")
knitr::kable(read.table(sl, header = TRUE, sep = ","))

## ---- warning=FALSE------------------------------------------------------
table.file <- system.file("extdata", "decTable.csv", package = "tsdf")
dec <- read.table(table.file, sep = ",", col.names = c(3,4,8,10), row.names = 1, check.names = FALSE)
colnames(dec)

## ---- echo=FALSE---------------------------------------------------------
knitr::kable(dec)

