library(QCApro)


### Name: pof
### Title: Compute Set-Relational Parameters of Fit
### Aliases: pof is.pof
### Keywords: functions

### ** Examples

# csQCA using Krook (2010)
#-------------------------
data(d.represent)
head(d.represent)

# solution with details
KRO <- eQMC(d.represent, outcome = "WNP", incl.cut1 = 0.9, 
            details = TRUE)
KRO

# exact binomial tests of sufficiency inclusion
pof(KRO$pims, outcome = "WNP", d.represent, inf.test = c("binom", 0.1), 
    incl.cut1 = 0.75, incl.cut0 = 0.5)

# fsQCA using Emmenegger (2011)
#------------------------------
data(d.jobsecurity)
head(d.jobsecurity)

# solution with details
EMM.sol <- eQMC(d.jobsecurity, outcome = "JSR", incl.cut1 = 0.9, 
                details = TRUE)
EMM.sol

# are the model prime implicants also sufficient for the negation 
# of the outcome?
pof(EMM.sol$pims, outcome = "JSR", d.jobsecurity, neg.out = TRUE)

# are the negations of the model prime implicants also sufficient 
# for the outcome?
pof(1 - EMM.sol$pims, outcome = "JSR", d.jobsecurity)

# parameters of fit for matrix of implicants;
# "-1" is the placeholder for an eliminated variable;
# e.g.: R*p*V and S*c*L*P*v
#      "S"  "C"  "L"  "R"  "P"  "V"
#     [,1] [,2] [,3] [,4] [,5] [,6]
#[1,]   -1   -1   -1    1    0    1
#[2,]    1    0    1   -1    1    0
mat <- matrix(c(-1,-1,-1, 1, 0, 1, 
                 1, 0, 1,-1, 1, 0), nrow = 2, byrow = TRUE)

pof(mat, outcome = "JSR", d.jobsecurity)

# or even vectors of line numbers from the implicant matrix
pof(c(43, 57), "JSR", d.jobsecurity)


# mv-data from Hartmann and Kemmerzell (2010)
#-------------------------------------------
data(d.partybans)
head(d.partybans)

# parameters of fit for several mv-expressions
expr <- c("C{1}", "F{2}", "T{2}", "T{1}*V{0}")
dat <- data.frame(ifelse(d.partybans$C == 1, 1, 0),
                  ifelse(d.partybans$F == 2, 1, 0),
                  ifelse(d.partybans$T == 2, 1, 0), 
                  ifelse(d.partybans$T == 1 & d.partybans$V == 0, 1, 0))
colnames(dat) <- expr                        

pof(dat, outcome = "PB{1}", d.partybans)

# miscellaneous
#--------------
# parameters of fit for a data frame
x <- data.frame(A = c(1,1,1,0,1), B = c(1,1,1,0,1),
                C = c(0,1,0,0,1), D = c(0,0,1,0,1),
                O = c(1,1,1,0,1))

pof(x[, -5], outcome = "O", x)

# for a single column from that data frame
pof(x$A, x$O)

# for multiple columns from that data frame
pof(x[, 1:2], outcome = "O", x)




