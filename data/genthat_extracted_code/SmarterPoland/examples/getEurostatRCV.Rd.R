library(SmarterPoland)


### Name: getEurostatRCV
### Title: Download a Dataset from the Eurostat Database
### Aliases: getEurostatRCV
### Keywords: database

### ** Examples

## Not run: 
##D  tmp <- getEurostatRCV(kod = "educ_iste")
##D  head(tmp)
##D  
##D  t1 <- getEurostatRCV("rail_ac_catvict")
##D  tmp <- cast(t1, geo ~ time , mean, subset=victim=="KIL" & 
##D                  pers_inv=="TOTAL" & accident=="TOTAL")
##D  tmp3 <- tmp[,1:9]
##D  rownames(tmp3) <- tmp3[,1]
##D  tmp3 <- tmp3[c("UK", "SK", "FR", "PL", "ES", "PT", "LV"),]
##D  matplot(2005:2012,t(tmp3[,-1]), type="o", pch=19, lty=1, 
##D                  las=1, xlab="", ylab="", yaxt="n")
##D  axis(2,tmp3[,9], rownames(tmp3), las=1)
## End(Not run)



