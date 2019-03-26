library(meta)


### Name: metaprop
### Title: Meta-analysis of single proportions
### Aliases: metaprop
### Keywords: htest

### ** Examples

# Apply various meta-analysis methods to estimate proportions
#
m1 <- metaprop(4:1, 10 * 1:4)
m2 <- update(m1, sm="PAS")
m3 <- update(m1, sm="PRAW")
m4 <- update(m1, sm="PLN")
m5 <- update(m1, sm="PFT")
#
m1
m2
m3
m4
m5
#
forest(m1)
# forest(m2)
# forest(m3)
# forest(m3, pscale=100)
# forest(m4)
# forest(m5)


# Do not back transform results, e.g. print logit transformed
# proportions if sm="PLOGIT" and store old settings
#
oldset <- settings.meta(backtransf=FALSE)
#
m6  <- metaprop(4:1, c(10, 20, 30, 40))
m7  <- update(m6, sm="PAS")
m8  <- update(m6, sm="PRAW")
m9  <- update(m6, sm="PLN")
m10 <- update(m6, sm="PFT")
#
forest(m6)
# forest(m7)
# forest(m8)
# forest(m8, pscale=100)
# forest(m9)
# forest(m10)
#
# Use old settings
#
settings.meta(oldset)


# Examples with zero events
#
m1 <- metaprop(c(0, 0, 10, 10), rep(100, 4))
m2 <- metaprop(c(0, 0, 10, 10), rep(100, 4), incr=0.1)
#
summary(m1)
summary(m2)
#
# forest(m1)
# forest(m2)


# Example from Miller (1978):
#
death <- c(3, 6, 10, 1)
animals <- c(11, 17, 21, 6)
#
m3 <- metaprop(death, animals, sm="PFT")
forest(m3)


# Data examples from Newcombe (1998)
# - apply various methods to estimate confidence intervals for
#   individual studies
#
event <- c(81, 15, 0, 1)
n <- c(263, 148, 20, 29)
#
m1 <- metaprop(event, n, sm="PLOGIT", method.ci="SA")
m2 <- update(m1, method.ci="SACC")
m3 <- update(m1, method.ci="WS")
m4 <- update(m1, method.ci="WSCC")
m5 <- update(m1, method.ci="CP")
#
lower <- round(rbind(NA, m1$lower, m2$lower, NA, m3$lower, m4$lower, NA, m5$lower), 4)
upper <- round(rbind(NA, m1$upper, m2$upper, NA, m3$upper, m4$upper, NA, m5$upper), 4)
#
tab1 <- data.frame(
  scen1=meta:::formatCI(lower[,1], upper[,1]),
  scen2=meta:::formatCI(lower[,2], upper[,2]),
  scen3=meta:::formatCI(lower[,3], upper[,3]),
  scen4=meta:::formatCI(lower[,4], upper[,4]),
  stringsAsFactors=FALSE
  )
names(tab1) <- c("r=81, n=263", "r=15, n=148", "r=0, n=20", "r=1, n=29")
row.names(tab1) <- c("Simple", "- SA", "- SACC",
                     "Score", "- WS", "- WSCC",
                     "Binomial", "- CP")
tab1[is.na(tab1)] <- ""
#
# Newcombe (1998), Table I, methods 1-5:
#
tab1
#
# Same confidence interval, i.e. unaffected by choice of summary measure
#
print(metaprop(event, n, sm="PLOGIT", method.ci="WS"), ma=FALSE)
print(metaprop(event, n, sm="PLN", method.ci="WS"), ma=FALSE)
print(metaprop(event, n, sm="PFT", method.ci="WS"), ma=FALSE)
print(metaprop(event, n, sm="PAS", method.ci="WS"), ma=FALSE)
print(metaprop(event, n, sm="PRAW", method.ci="WS"), ma=FALSE)
#
# Different confidence intervals as argument sm="NAsm"
#
print(metaprop(event, n, sm="PLOGIT", method.ci="NAsm"), ma=FALSE)
print(metaprop(event, n, sm="PLN", method.ci="NAsm"), ma=FALSE)
print(metaprop(event, n, sm="PFT", method.ci="NAsm"), ma=FALSE)
print(metaprop(event, n, sm="PAS", method.ci="NAsm"), ma=FALSE)
print(metaprop(event, n, sm="PRAW", method.ci="NAsm"), ma=FALSE)
#
# Different confidence intervals as argument backtransf=FALSE.
# Accordingly, method.ci="NAsm" used internally.
#
print(metaprop(event, n, sm="PLOGIT", method.ci="WS"), ma=FALSE, backtransf=FALSE)
print(metaprop(event, n, sm="PLN", method.ci="WS"), ma=FALSE, backtransf=FALSE)
print(metaprop(event, n, sm="PFT", method.ci="WS"), ma=FALSE, backtransf=FALSE)
print(metaprop(event, n, sm="PAS", method.ci="WS"), ma=FALSE, backtransf=FALSE)
print(metaprop(event, n, sm="PRAW", method.ci="WS"), ma=FALSE, backtransf=FALSE)
#
# Same results (printed on original and log scale, respectively)
#
print(metaprop(event, n, sm="PLN", method.ci="NAsm"), ma=FALSE)
print(metaprop(event, n, sm="PLN"), ma=FALSE, backtransf=FALSE)
# Results for first study (on log scale)
round(log(c(0.3079848, 0.2569522, 0.3691529)), 4)


# Meta-analysis using generalised linear mixed models
# (R packages 'metafor' and 'lme4' must be available)
#
# metaprop(event, n, method = "GLMM")


#
# Print results as events per 1000 observations
#
print(metaprop(6:8, c(100, 1200, 1000)), pscale = 1000, digits = 1)



