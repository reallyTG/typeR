library(copula)


### Name: SMI.12
### Title: SMI Data - 141 Days in Winter 2011/2012
### Aliases: SMI.12 lSMI
### Keywords: datasets

### ** Examples

data(SMI.12)
## maybe
head(SMI.12)

str(D.12 <- as.Date(rownames(SMI.12)))
summary(D.12)

matplot(D.12, SMI.12, type="l", log = "y",
        main = "The 20 SMI constituents  (2011-09 -- 2012-03)",
        xaxt="n", xlab = "2011  /  2012")
Axis(D, side=1)



if(FALSE) { ##--- This worked up to mid 2012, but no longer ---
 begSMI <- "2011-09-09"
 endSMI <- "2012-03-28"
 ##-- read *public* data ------------------------------
 stopifnot(require(zoo), # -> to access all the zoo methods
           require(tseries))
 symSMI <- c("ABBN.VX","ATLN.VX","ADEN.VX","CSGN.VX","GIVN.VX","HOLN.VX",
	     "BAER.VX","NESN.VX","NOVN.VX","CFR.VX", "ROG.VX", "SGSN.VX",
	     "UHR.VX", "SREN.VX","SCMN.VX","SYNN.VX","SYST.VX","RIGN.VX",
	     "UBSN.VX","ZURN.VX")
 lSMI <- sapply(symSMI, function(sym)
		get.hist.quote(instrument = sym, start= begSMI, end= endSMI,
			       quote = "Close", provider = "yahoo",
			       drop=TRUE))
 ## check if stock data have the same length for each company.
 sapply(lSMI, length)
 ## "concatenate" all:
 SMIo <- do.call(cbind, lSMI)
 ## and fill in the NAs :
 SMI.12 <- na.fill(SMIo, "extend")
 colnames(SMI.12) <- sub("\\.VX", "", colnames(SMI.12))
 SMI.12 <- as.matrix(SMI.12)
}##----       --- original download

if(require(zoo)) {
  stopifnot(identical(SMI.12,
     local({ S <- as.matrix(na.fill(do.call(cbind, lSMI), "extend"))
             colnames(S) <- sub("\\.VX", "", colnames(S)); S })))
}




