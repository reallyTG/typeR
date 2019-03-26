library(popEpi)


### Name: splitMulti
### Title: Split case-level observations
### Aliases: splitMulti

### ** Examples

#### let's prepare data for computing period method survivals
#### in case there are problems with dates, we first 
#### convert to fractional years.
## Not run: 
##D library(Epi)
##D data("sire", package = "popEpi")
##D x <- Lexis(data=sire, entry = list(fot=0, per=get.yrs(dg_date), age=dg_age), 
##D            exit=list(per=get.yrs(ex_date)), exit.status=status)
##D x2 <- splitMulti(x, breaks = list(fot=seq(0, 5, by = 3/12), per=c(2008, 2013)))
##D # equivalently:
##D x2 <- splitMulti(x, fot=seq(0, 5, by = 3/12), per=c(2008, 2013))
##D 
##D ## using dates; note: breaks must be expressed as dates or days!
##D x <- Lexis(data=sire, entry = list(fot=0, per=dg_date, age=dg_date-bi_date), 
##D            exit=list(per=ex_date), exit.status=status)
##D BL <- list(fot = seq(0, 5, by = 3/12)*365.242199,
##D            per = as.Date(paste0(c(1980:2014),"-01-01")),
##D            age = c(0,45,85,Inf)*365.242199)
##D x2 <- splitMulti(x, breaks = BL, verbose=TRUE)
##D 
##D 
##D ## multistate example (healty - sick - dead)
##D sire2 <- data.frame(sire)
##D 
##D set.seed(1L) 
##D not_sick <- sample.int(nrow(sire2), 6000L, replace = FALSE)
##D sire2[not_sick, ]$dg_date <- NA
##D sire2[!is.na(sire2$dg_date) & sire2$status == 0, ]$status <- -1
##D 
##D sire2$status[sire2$status==2] <- 1
##D sire2$status <- factor(sire2$status, levels = c(0, -1, 1), 
##D                        labels = c("healthy", "sick", "dead"))
##D 
##D xm <- Lexis(data=sire2, entry = list(fot=0, per=get.yrs(bi_date), age=0), 
##D             exit=list(per=get.yrs(ex_date)), exit.status=status)
##D xm2 <- cutLexis(xm, cut = get.yrs(xm$dg_date), 
##D                 timescale = "per", 
##D                 new.state = "sick")
##D xm2[xm2$lex.id == 6L, ]
##D 
##D xm2 <- splitMulti(xm2, breaks = list(fot = seq(0,150,25)))
##D xm2[xm2$lex.id == 6L, ]
## End(Not run)




