library(openCR)


### Name: Field vole
### Title: Kielder Field Voles
### Aliases: fieldvoleCH
### Keywords: datasets

### ** Examples


summary(fieldvoleCH, terse = TRUE)
m.array(fieldvoleCH)
JS.counts(fieldvoleCH)

maleCH <- subset(fieldvoleCH, function(x) covariates(x) == 'M')
fit <- openCR.fit(maleCH)
predict(fit)

attr(fieldvoleCH, 'ampm')

## Not run: 
##D 
##D # Read data object from DRYAD ASCII file
##D 
##D datadir <- system.file('extdata', package = 'openCR')
##D EG <- dget(paste0(datadir,'/ergonandgardner2013.rdat'))
##D 
##D # construct capthist object
##D onesession <- function (sess) {
##D     mat <- EG$H[,,sess]
##D     id <- as.numeric(row(mat))
##D     occ <- as.numeric(col(mat))
##D     occ[mat<0] <- -occ[mat<0]
##D     trap <- abs(as.numeric(mat)) 
##D     matrow <- rownames(mat)
##D     df <- data.frame(session = rep(sess, length(id)), 
##D                      ID = matrow[id], 
##D                      occ = occ, 
##D                      trapID = trap,
##D                      sex = c('F','M')[EG$gr],
##D                      row.names = 1:length(id))
##D     # retain captures (trap>0)
##D     df[df$trapID>0, , drop = FALSE]
##D }
##D tr <- read.traps(data = data.frame(EG$X), detector = "multi")
##D 
##D # recode matrix as mixture of zeros and trap numbers
##D EG$H <- EG$H-1
##D 
##D # code censored animals with negative trap number
##D # two ways to recognise censoring
##D censoredprimary <- which(EG$K < 4)
##D censoredsecondary <- which(apply(EG$J,1,function(x) any(x-c(3,5,4,5) < 0)))
##D censored <- unique(c(censoredprimary, censoredsecondary))
##D rownames(EG$H)[censored]
##D # [1] "ma193" "ma239" "ma371" "ma143" "ma348"
##D censorocc <- apply(EG$H[censored,,], 1, function(x) which.max(cumsum(x)))
##D censor3 <- ((censorocc-1) %/% 5)+1       # session
##D censor2 <- censorocc - (censor3-1) * 5   # occasion within session
##D censori <- cbind(censored, censor2, censor3)
##D EG$H[censori] <- -EG$H[censori] 
##D 
##D lch <- lapply(1:4, onesession)
##D ch <- make.capthist(do.call(rbind,lch), tr=tr, covnames='sex')
##D 
##D # apply intervals in months
##D intervals(ch) <-  EG$dt
##D 
##D fieldvoleCH <- ch
##D 
##D # extract time covariate - each secondary session was either am (2) or pm (1)
##D # EG$tod
##D # 1 2 3  4  5
##D # 1 2 1 2 NA NA
##D # 2 2 1 2  1  1
##D # 3 2 1 2  1 NA
##D # 4 2 1 2  1  2
##D # Note consecutive pm trap checks in session 2
##D ampm <- split(EG$tod, 1:4)
##D ampm <- lapply(ampm, na.omit)
##D attr(fieldvoleCH, 'ampm') <- data.frame(ampm = unlist(ampm))
##D 
## End(Not run)




