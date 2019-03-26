library(gap)


### Name: FPRP
### Title: False-positive report probability
### Aliases: FPRP
### Keywords: models

### ** Examples

## Not run: 
##D # Example by Laure El ghormli & Sholom Wacholder on 25-Feb-2004
##D # Step 1 - Pre-set an FPRP-level criterion for noteworthiness
##D 
##D T <- 0.2
##D 
##D # Step 2 - Enter values for the prior that there is an association
##D 
##D pi0 <- c(0.25,0.1,0.01,0.001,0.0001,0.00001)
##D 
##D # Step 3 - Enter values of odds ratios (OR) that are most likely, assuming that
##D #          there is a non-null association
##D 
##D ORlist <- c(1.2,1.5,2.0)
##D 
##D # Step 4 - Enter OR estimate and 95##D 
##D 
##D OR <- 1.316
##D ORlo <- 1.08
##D ORhi <- 1.60
##D 
##D logOR <- log(OR)
##D selogOR <- abs(logOR-log(ORhi))/1.96
##D p <- ifelse(logOR>0,2*(1-pnorm(logOR/selogOR)),2*pnorm(logOR/selogOR))
##D p
##D q <- qnorm(1-p/2)
##D POWER <- ifelse(log(ORlist)>0,1-pnorm(q-log(ORlist)/selogOR),
##D                 pnorm(-q-log(ORlist)/selogOR))
##D POWER
##D FPRPex <- t(p*(1-pi0)/(p*(1-pi0)+POWER%o%pi0))
##D row.names(FPRPex) <- pi0
##D colnames(FPRPex) <- ORlist
##D FPRPex
##D FPRPex>T
##D 
##D ## now turn to FPRP
##D OR <- 1.316
##D ORhi <- 1.60
##D ORlist <- c(1.2,1.5,2.0)
##D pi0 <- c(0.25,0.1,0.01,0.001,0.0001,0.00001)
##D z <- FPRP(OR,ORhi,pi0,ORlist,logscale=FALSE)
##D z
## End(Not run)



