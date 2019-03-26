### R code from vignette source 'vignette.Rnw'

###################################################
### code chunk number 1: start
###################################################
library(samplesizelogisticcasecontrol)


###################################################
### code chunk number 2: data generators
###################################################
mymvn <- function(n) {
  mu    <- c(0, 0)
  sigma <- matrix(c(1, 0.5, 0.5, 2), byrow=TRUE, nrow=2, ncol=2)
  dat   <- rmvnorm(n, mean=mu, sigma=sigma)
  dat
}

myF <- function(n) {
  dat <- mymvn(n)  
  dat <- cbind(dat, dat[, 1]*dat[, 2])
  dat
}


###################################################
### code chunk number 3: data
###################################################
data <- myF(200) 
colnames(data) <- paste("X", 1:3, sep="")
data[1:5, ]


###################################################
### code chunk number 4: prev
###################################################
prev  <- 0.01
logOR <- 0.26
p <- 0.15


###################################################
### code chunk number 5: bernoulli
###################################################
sampleSize_binary(prev, logOR, probXeq1=p) 


###################################################
### code chunk number 6: ordinal_2
###################################################
sampleSize_ordinal(prev, logOR, probX=c(1-p, p)) 


###################################################
### code chunk number 7: ordinal_3
###################################################
sampleSize_ordinal(prev, logOR, probX=c(0.4, 0.35, 0.25)) 


###################################################
### code chunk number 8: normal01
###################################################
sampleSize_continuous(prev, logOR)


###################################################
### code chunk number 9: chi1
###################################################
sampleSize_continuous(prev, logOR, distF="dchisq(x, 1)", 
                     distF.support=c(0,Inf), distF.var=2)
f <- function(x) {dchisq(x, 1)}
sampleSize_continuous(prev, logOR, distF=f, distF.support=c(0, Inf), 
                      distF.var=2)


###################################################
### code chunk number 10: chi2
###################################################
sampleSize_continuous(prev, logOR, distF="dchisq(x, 1)", distF.support=c(0,Inf))


###################################################
### code chunk number 11: data_1
###################################################
sampleSize_data(prev, logOR, data[, "X1", drop=FALSE]) 


###################################################
### code chunk number 12: mvn2
###################################################
logOR <- c(0.1, 0.13)
sampleSize_data(prev, logOR, mymvn(200)) 


###################################################
### code chunk number 13: interaction1
###################################################
logOR <- c(0.1, 0.15, 0.11)
sampleSize_data(prev, logOR, myF(1000)) 


###################################################
### code chunk number 14: file
###################################################
file <- system.file("sampleData", "data.txt", package="samplesizelogisticcasecontrol")
file


###################################################
### code chunk number 15: file_read
###################################################
data <- read.table(file, header=1, sep="\t")


###################################################
### code chunk number 16: create_inter
###################################################
data[, "Interaction"] <- data[, "Gender_Male"]*data[, "Treatment"]
data[1:5, ]


###################################################
### code chunk number 17: subset
###################################################
temp <- data[, "Casecontrol"] %in% 0
data <- data[temp, ]


###################################################
### code chunk number 18: columns
###################################################
vars <- c("Gender_Male", "Treatment", "Interaction")
data <- data[, vars] 


###################################################
### code chunk number 19: logOR_int
###################################################
logOR <- c(0.1, 0.13, 0.27)


###################################################
### code chunk number 20: samp_int1
###################################################
sampleSize_data(prev, logOR, data) 


###################################################
### code chunk number 21: file_list
###################################################
data.list <- list(file=file, header=1, sep="\t",
            covars=c("Gender_Male", "Treatment"),
            exposure=c("Gender_Male", "Treatment"))
data.list$subsetData <- list(list(var="Casecontrol", operator="%in%", value=0))
sampleSize_data(prev, logOR, data.list) 


###################################################
### code chunk number 22: sessionInfo
###################################################
sessionInfo()


