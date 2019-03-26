library(npsf)


### Name: banks00_07
### Title: U.S. Commercial Banks Data
### Aliases: banks00_07
### Keywords: datasets

### ** Examples


## Not run: 
##D 
##D # Download data from the link in "Source"
##D 
##D banks00_07 <- read.delim("2b_QLH.txt")
##D 
##D # rename 'entity' to 'id'
##D colnames(banks00_07) [colnames(banks00_07) == "entity"] <- "id"
##D 
##D table(banks00_07$year)
##D # keep if 2000 -- 2007
##D 
##D banks00_07 <- 
##D  banks00_07[(banks00_07$year >= 2000 & banks00_07$year <= 2007),]
##D dim(banks00_07)
##D 
##D q1q3 <- quantile(banks00_07$TA, probs = c(.25,.75))
##D 
##D banks00_07 <- 
##D  banks00_07[(banks00_07$TA >= q1q3[1] & banks00_07$TA <= q1q3[2]),]
##D dim(banks00_07)
##D 
##D 
##D # generate required variables
##D banks00_07$TC <-banks00_07$TOC
##D banks00_07$ER <- banks00_07$Z / banks00_07$TA
##D banks00_07$LA <- banks00_07$Y2 / banks00_07$TA
##D 
##D banks00_07 <- 
##D  banks00_07[, colnames(banks00_07) ##D 
##D  c("id", "year", "Ti", "TC", "Y1", "Y2", "W1","W2", "ER", "LA", "TA", "LLP")]
##D dim(banks00_07)
##D 
##D t0 <- as.vector( by(data = banks00_07$id, 
##D                     INDICES = banks00_07$id, 
##D                     FUN = function(qq) length(qq)) )
##D banks00_07$Ti <- rep(t0, times = t0)
##D banks00_07 <- banks00_07[banks00_07$Ti > 4,]
##D 
##D # complete observations
##D banks00_07 <- banks00_07[complete.cases(banks00_07),]
##D dim(banks00_07)
##D 
##D id_names <- unique(banks00_07$id)
##D N_total <- length(id_names)
##D set.seed(816376586)
##D ids_n2choose <- sample(1:N_total, 500)
##D ids2choose <- id_names[ids_n2choose]
##D banks00_07 <- banks00_07[banks00_07$id ##D 
##D dim(banks00_07)
##D 
##D t0 <- as.vector( by(data = banks00_07$id, 
##D                     INDICES = banks00_07$id, 
##D                     FUN = function(qq) length(qq)) )
##D length(rep(t0, times = t0))
##D 
##D banks00_07$Ti <- rep(t0, times = t0)
##D 
##D banks00_07[1:50,c("id","year","Ti")]
##D 
##D # keep if Ti > 4
##D 
##D banks00_07 <- banks00_07[banks00_07$Ti > 4,]
##D dim(banks00_07)
##D 
##D # sort
##D banks00_07 <- banks00_07[order(banks00_07$id, banks00_07$year),]
##D 
##D # TC = TOC
##D #
##D # ER = Z / TA
##D # Gross total equity to gross total assets ratio.
##D #
##D # LA = Y2 / TA
##D # Total loans and leases to gross total assets ratio.
##D 
##D banks00_07$TA_ave <- 
##D  rep(as.vector( by(data = banks00_07$TA,
##D                    INDICES = banks00_07$id, 
##D                    FUN = function(qq) mean(qq))), times = t0)
##D 
##D banks00_07$TA_initial <- 
##D  rep(as.vector( by(data = banks00_07$TA, 
##D                    INDICES = banks00_07$id,
##D                    FUN = function(qq) qq[1])), times = t0)
##D 
##D banks00_07$LLP_ave <- 
##D  rep(as.vector( by(data = banks00_07$LLP,
##D                    INDICES = banks00_07$id,
##D                    FUN = function(qq) mean(qq))), times = t0)
##D 
##D banks00_07$LLP_initial <- 
##D  rep(as.vector( by(data = banks00_07$LLP, 
##D                    INDICES = banks00_07$id, 
##D                    FUN = function(qq) qq[1])), times = t0)
##D 
##D banks00_07$ER_ave <- 
##D  rep(as.vector( by(data = banks00_07$ER, 
##D                    INDICES = banks00_07$id, 
##D                    FUN = function(qq) mean(qq))), times = t0)
##D 
##D banks00_07$ER_initial <- 
##D  rep(as.vector( by(data = banks00_07$ER, 
##D                    INDICES = banks00_07$id, 
##D                    FUN = function(qq) qq[1])), times = t0)
##D 
##D banks00_07$LA_ave <- 
##D  rep(as.vector( by(data = banks00_07$LA, 
##D                    INDICES = banks00_07$id, 
##D                    FUN = function(qq) mean(qq))), times = t0)
##D 
##D banks00_07$LA_initial <- 
##D  rep(as.vector( by(data = banks00_07$LA, 
##D                    INDICES = banks00_07$id, 
##D                    FUN = function(qq) qq[1])), times = t0)
##D 
##D cols2export <- c("id","year","Ti","TA","TA_ave",
##D                  "TA_initial","LLP","LLP_ave",
##D                  "LLP_initial","ER_ave","ER_initial","LA_ave","LA_initial")
##D 
##D write.table(x = banks00_07, file = "banks00_07.txt", row.names = FALSE)
##D 
## End(Not run)




