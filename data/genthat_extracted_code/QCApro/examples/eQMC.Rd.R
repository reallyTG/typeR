library(QCApro)


### Name: eQMC
### Title: Minimization with Enhanced Quine-McCluskey Algorithm
### Aliases: eQMC is.qca
### Keywords: functions

### ** Examples

# csQCA using Krook (2010)
#-------------------------
data(d.represent)
head(d.represent)

# solution with details and case names
KRO <- eQMC(d.represent, outcome = "WNP", details = TRUE, show.cases = TRUE)
KRO

# check PI chart
KRO$PIchart

# solution with truth table object
KRO.tt <- truthTable(d.represent, outcome = "WNP")
KRO <- eQMC(KRO.tt)
KRO

# simplifying assumptions (SAs) that would have been used with Quine-McCluskey 
# optimization
KRO$SA

# fsQCA using Emmenegger (2011)
#------------------------------
data(d.jobsecurity)
head(d.jobsecurity)

# solution with details
EMM <- eQMC(d.jobsecurity, outcome = "JSR", incl.cut1 = 0.9, details = TRUE)
EMM

# are the model prime implicants also sufficient for the negation of the outcome?
pof(EMM$pims, outcome = "JSR", d.jobsecurity, neg.out = TRUE, relation = "suf")

# are the negations of the model prime implicants also sufficient for the outcome?
pof(1 - EMM$pims, outcome = "JSR", d.jobsecurity, relation = "suf")

# plot all three prime implicants of the solution
PIsc <- EMM$pims
par(mfrow = c(1, 3))
for(i in 1:3){
 plot(PIsc[, i], d.jobsecurity$JSR, pch = 19, ylab = "JSR",
  xlab = names(PIsc)[i], xlim = c(0, 1), ylim = c(0, 1),
  main = paste("Prime Implicant", print(i)))
 mtext(paste(
  "Inclusion = ", round(EMM$IC$overall$incl.cov$incl[i], 3),
  "; Coverage = ", round(EMM$IC$overall$incl.cov$cov.r[i], 3)), 
  cex = 0.7, line = 0.4)
 abline(h = 0.5, lty = 2, col = gray(0.5))
 abline(v = 0.5, lty = 2, col = gray(0.5))
 abline(0, 1)
}

# mvQCA using Hartmann and Kemmerzell (2010)
#-------------------------------------------
data(d.partybans)
head(d.partybans)

# specify exogenous factors beforehand
exo.facs <- c("C", "F", "T", "V")

# parsimonious solution with contradictions included
HK.sol <- eQMC(d.partybans, outcome = "PB{1}", exo.facs = exo.facs,
  incl.cut0 = 0.4, sol.type = "ps+", details = TRUE)
HK.sol

# which are the two countries in T{2} but not PB{1}?
rownames(d.partybans[d.partybans$T == 2 & d.partybans$PB != 1, ])

# QCA with multiple outcomes from multivalent variables
#------------------------------------------------------
d.mmv <- data.frame(A = c(2,0,0,1,1,1,2,2), B = c(2,2,2,2,1,1,0,0), 
                    C = c(0,1,0,0,0,2,1,0), D = c(2,1,2,2,3,1,3,0), 
                    E = c(3,2,3,3,0,1,3,2), 
  row.names = letters[1:8])
head(d.mmv)

mmv.s <- eQMC(d.mmv, outcome = c("D{2}", "E{3}"))
mmv.s

# use quotes with curly-bracket notation to access solution component
print(mmv.s$"E{3}", details = TRUE, show.cases = TRUE)

# negation of outcome from multivalent factor is disjunction of all other
# levels; high under-determination (18 models)
mmv.s <- eQMC(d.mmv, outcome = "E{3}", neg.out = TRUE)
mmv.s

# causal chains with QCA (Thiem 2015); data from Baumgartner (2009)
#-----------------------------------------------------------------------------
d.Bau <- data.frame(
  U = c(1,1,1,1,0,0,0,0), D = c(1,1,0,0,1,1,0,0),
  L = c(1,1,1,1,1,1,0,0), G = c(1,0,1,0,1,0,1,0),
  E = c(1,1,1,1,1,1,1,0),
  row.names = letters[1:8])
head(d.Bau)

# with multiple outcomes, no solution details are printed;
# "causal-chain structure": (D + U <=> L) * (G + L <=> E)
# "common-cause structure": (D + U <=> L) * (G + D + U <=> E)
Bau.cna <- eQMC(d.Bau, outcome = names(d.Bau), relation = "sufnec")
Bau.cna

# get the truth table, solution details and case names for outcome "E"
print(Bau.cna$E, details = TRUE, show.cases = TRUE)

# examples relating to QCA method evaluation
#-------------------------------------------
#
# is the conservative solution (QCA-CS) really "conservative"?
#-------------------------------------------------------------
# Ragin (2008, 173): "The complex [conservative] solution [...] does not 
# permit any counterfactual cases and thus no simplifying assumptions 
# regarding combinations of conditions that do not exist in the data.";
# the conservative solution is "[c]onservative because [...] the
# researcher [...] is exclusively guided by the empirical information 
# at hand" (Schneider and Wagemann 2012, 162)
#
# in fact, QCA-CS makes extremely strong assumptions on ALL remainders;
# QCA-CS assumes every remainder exists at least 'freq.cut' times, 
# and occurs with the negation of the outcome more than 
# 'freq.cut' * (1 - 'incl.cut1') times

# create a test data-set 'CS' with 32 cases and randomly assign values 
# on the endogenous factor 'Z'
CS <- data.frame(mintermMatrix(rep(2,5)))
CS$Z <- sample(0:1, 2^5, replace = TRUE)

# randomly draw 20 cases to create a limitedly diverse data-set 'CS.LD'
# and turn all 12 remainder minterms into observations that occur with 
# 'Z = 0' in original data-set 'CS'
CS.LD <- CS[sample(1:2^5, 20), ]
change <- as.numeric(setdiff(rownames(CS), rownames(CS.LD)))
CS$Z[change] <- 0

# create the (conservative) solutions for 'CS' and 'CS.LD'
CS.sol <- eQMC(CS, outcome = "Z")
CS.LD.sol <- eQMC(CS.LD, outcome = "Z", sol.type = "cs")

# test whether the two solutions are identical
identical(unlist(CS.LD.sol$solution), unlist(CS.sol$solution))

# both solutions are identical, for two datasets that do not allow the same
# causal inferences to be made; this indicates that QCA-CS draws causal inferences 
# beyond what the data warrants; the lower the diversity index (ratio of non-remainder
# minterms to all minterms), the stronger the assumptions QCA-CS makes




