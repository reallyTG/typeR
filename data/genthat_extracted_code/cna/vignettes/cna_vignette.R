### R code from vignette source 'cna_vignette.Rnw'

###################################################
### code chunk number 1: preliminaries
###################################################
options(prompt = "R> ", continue = "+  ", width = 70, useFancyQuotes = FALSE)


###################################################
### code chunk number 2: data examples
###################################################
library(cna)
cna(d.educate)
cna(d.women)


###################################################
### code chunk number 3: data type (eval = FALSE)
###################################################
## cna(d.jobsecurity, type = "fs")
## fscna(d.jobsecurity)
## cna(d.pban, type = "mv") 
## mvcna(d.pban)


###################################################
### code chunk number 4: truthTab1 (eval = FALSE)
###################################################
## truthTab(d.women)
## mvtt(d.pban) 


###################################################
### code chunk number 5: truthTab2 (eval = FALSE)
###################################################
## pact.tt <- truthTab(d.pacts, type = "fs", case.cutoff = 2)
## cna(pact.tt)
## tt2df(pact.tt)


###################################################
### code chunk number 6: simul1 (eval = FALSE)
###################################################
## dat1 <- allCombs(c(2, 2, 2)) - 1 
## selectCases("A + B <-> C", dat1)


###################################################
### code chunk number 7: simul2 (eval = FALSE)
###################################################
## dat2 <- allCombs(c(3, 3, 3)) 
## selectCases1("A=1*B=3 + A=3 <-> C=2", mvtt(dat2), con = .75, cov = .75)


###################################################
### code chunk number 8: simul3 (eval = FALSE)
###################################################
## dat3 <- allCombs(c(2, 2, 2)) - 1
## makeFuzzy(tt2df(selectCases("A + B <-> C", dat3)), 
##   fuzzvalues = seq(0, 0.4, 0.05))


###################################################
### code chunk number 9: simul4 (eval = FALSE)
###################################################
## dat4 <- allCombs(c(3, 4, 5))
## dat5 <- selectCases("A=1*B=3 + A=3 <-> C=2", mvtt(dat4))
## some(dat5, n = 10, replace = FALSE)


###################################################
### code chunk number 10: cons1 (eval = FALSE)
###################################################
## fscna(d.jobsecurity, con = 1, cov = .9)
## fscna(d.jobsecurity, con = .9, cov = 1)
## fscna(d.jobsecurity, con = .9, cov = .9)


###################################################
### code chunk number 11: cons2
###################################################
ana.job.1 <- fscna(d.jobsecurity, con = .8, cov = .9)
printCols <- c("condition", "consistency", "coverage")
csf(ana.job.1)[printCols]


###################################################
### code chunk number 12: odering1
###################################################
dat.aut.1 <- d.autonomy[15:30, c("AU","EM","SP","CO")]
ana.aut.1 <- fscna(dat.aut.1, ordering = list(c("EM","SP","CO"), "AU"), 
  strict = TRUE, con = .91, cov = .91)
csf(ana.aut.1)[printCols]


###################################################
### code chunk number 13: odering2
###################################################
ana.aut.2 <- fscna(dat.aut.1, ordering = list(c("EM","SP","CO"), "AU"), 
  strict = FALSE, con = .91, cov = .91)
csf(ana.aut.2)[printCols]


###################################################
### code chunk number 14: maxstep1 (eval = FALSE)
###################################################
## cna(d.volatile, ordering = list("VO2"))
## cna(d.volatile, ordering = list("VO2"), maxstep = c(4,3,10))
## cna(d.volatile, ordering = list("VO2"), maxstep = c(4,3,11))
## cna(d.volatile, ordering = list("VO2"), maxstep = c(4,4,11))


###################################################
### code chunk number 15: maxstep2 (eval = FALSE)
###################################################
## cna(d.volatile, ordering = list("VO2"), maxstep = c(8,10,40), 
##   suff.only = TRUE)


###################################################
### code chunk number 16: maxstep3
###################################################
ana.wom.1 <- cna(d.women)
csf(ana.wom.1)[printCols]
ana.wom.2 <- cna(d.women, maxstep = c(3,4,10))
csf(ana.wom.2)[printCols]


###################################################
### code chunk number 17: notcols (eval = FALSE)
###################################################
## fscna(d.jobsecurity, con = .8, cov = .9, notcols = "JSR")
## fscna(dat.aut.1, ordering = list(c("EM","SP","CO"), "AU"),
##   strict = FALSE, con = .88, cov = .82, notcols = c("AU", "EM"))


###################################################
### code chunk number 18: tab2c (eval = FALSE)
###################################################
## dat6 <- allCombs(c(2, 2, 2, 2, 2)) -1
## dat7 <- selectCases("(A + B <-> C)*(A*B + D <-> E)", dat6)
## set.seed(28)
## tab2c <- makeFuzzy(tt2df(dat7), fuzzvalues = seq(0, 0.4, 0.01))
## fscna(tab2c, con = .8, cov = .9, what = "mac")


###################################################
### code chunk number 19: details (eval = FALSE)
###################################################
## cna(d.educate, details = TRUE)
## cna(d.educate, details = c("i", "e", "r"))


###################################################
### code chunk number 20: what (eval = FALSE)
###################################################
## cna(d.educate, what = "tm")
## cna(d.educate, what = "mac")
## cna(d.educate, what = "all")


###################################################
### code chunk number 21: vol1 (eval = FALSE)
###################################################
## vol1 <- cna(d.volatile, ordering = list("VO2"))
## msc(vol1)
## asf(vol1)
## csf(vol1)


###################################################
### code chunk number 22: inus1
###################################################
dat.inu.1 <- allCombs(c(2, 2, 2)) -1
dat.inu.2 <- some(dat.inu.1, 40, replace = TRUE)
dat.inu.3 <- selectCases1("A + a*B <-> C", con = 1, cov = 1, dat.inu.2)
printCols <- c("condition", "consistency", "coverage", "complexity", 
  "inus")
asf(cna(dat.inu.3, con = 1, cov = 1, details = TRUE))[printCols]


###################################################
### code chunk number 23: inus2
###################################################
set.seed(4)
dat.inu.4 <- some(dat.inu.1, 40, replace = TRUE)
dat.inu.5 <- selectCases1("A + a*B <-> C", con = .8, cov = .8, dat.inu.4)
asf(cna(dat.inu.5, con = .8, cov = .8, details = TRUE))[printCols]


###################################################
### code chunk number 24: inus3
###################################################
ana.job.3 <- fscna(d.jobsecurity, con = .8, cov = .9, details = TRUE)
asf(ana.job.3)[printCols]


###################################################
### code chunk number 25: inus4
###################################################
ana.job.4 <- fscna(d.jobsecurity, con = .8, cov = .9, details = TRUE,
  inus.only = TRUE, what = "a")
asf(ana.job.4)[printCols]


###################################################
### code chunk number 26: d.edu1
###################################################
printCols <- c("condition", "consistency", "coverage", "exhaustiveness")
csf(cna(d.educate, details = TRUE))[printCols]


###################################################
### code chunk number 27: d.edu2
###################################################
csf(cna(d.educate[-1,], details = TRUE))[printCols]


###################################################
### code chunk number 28: d.edu3
###################################################
printCols <- c("condition", "consistency", "coverage", "faithfulness")
csf(cna(d.educate, details = TRUE))[printCols]


###################################################
### code chunk number 29: d.edu4
###################################################
csf(cna(rbind(d.educate,c(1,1,0,1,0)), con=.8, details = TRUE))[printCols]


###################################################
### code chunk number 30: rownames
###################################################
rownames(d.educate) <- 1:8


###################################################
### code chunk number 31: coherence
###################################################
d.edu.exp1 <- rbind(d.educate, c(1,0,1,0,0))
printCols <- c("condition", "consistency", "coverage", "coherence")
csf(cna(d.edu.exp1, con = .8, details = TRUE))[printCols]


###################################################
### code chunk number 32: redundant1
###################################################
(dat.redun <- tt2df(selectCases("(A*B + C <-> D)*(a + c <-> E)", 
  allCombs(c(2, 2, 2, 2, 2)) -1)))


###################################################
### code chunk number 33: redundant3
###################################################
ana.redun <- cna(dat.redun, details = TRUE)
printCols <- c("condition", "consistency", "coverage", "exhaustiveness",
  "faithfulness", "redundant")
csf(ana.redun)[printCols]


###################################################
### code chunk number 34: redundant3
###################################################
minimalizeCsf(ana.redun)


###################################################
### code chunk number 35: ambigu1
###################################################
dat8 <- allCombs(c(2, 2, 2, 2)) - 1
dat9 <- selectCases("A*b + a*B + B*C <-> D", dat8)
printCols <- c("condition", "consistency", "coverage", "inus",
  "exhaustiveness")
csf(cna(dat9, details = TRUE))[printCols]


###################################################
### code chunk number 36: ambigu2
###################################################
csf(mvcna(d.pban, cov = .95, maxstep = c(4,5,12)))["condition"]


###################################################
### code chunk number 37: ambigu3
###################################################
ana.pact.1 <- fscna(d.pacts, ordering = list("PACT"), con = .8, cov = .8,
  maxstep = c(4,4,12), details = TRUE)
csf.pact.1 <- csf(ana.pact.1, .Machine$integer.max)
length(csf.pact.1$condition)


###################################################
### code chunk number 38: ambigu4
###################################################
csf.pact.1.ex <- subset(csf.pact.1, exhaustiveness==1)
length(csf.pact.1.ex$condition)


###################################################
### code chunk number 39: ambigu5
###################################################
csf.pact.1.ex.co <- subset(csf.pact.1.ex, coherence >= 0.85)
length(csf.pact.1.ex.co$condition)


###################################################
### code chunk number 40: ambigu2
###################################################
ana.pact.2 <- fscna(d.pacts, ordering = list("PACT"), con = .8, cov = .8,
  maxstep = c(4,4,12), details = TRUE, inus.only = TRUE)
csf.pact.2 <- csf(ana.pact.2, .Machine$integer.max)
csf.pact.2.inus.ex.co <- subset(csf.pact.2, 
  exhaustiveness==1 & coherence >= 0.85)
csf.pact.2.inus.ex.co


###################################################
### code chunk number 41: back1
###################################################
dat.aut.2 <- d.autonomy[15:30, c("AU","EM","SP","CO","RE","DE")]
ana.aut.3 <- fscna(dat.aut.2, con = .91, cov = .91,
  ordering = list(c("RE", "DE","SP","CO"),"EM","AU"),
  strict = TRUE)
fscond(csf(ana.aut.3)$condition, dat.aut.2)


###################################################
### code chunk number 42: back2
###################################################
group.by.outcome(fscond(asf(ana.aut.3)$condition, dat.aut.2))$AU


