library(openCR)


### Name: Microtus
### Title: Patuxent Meadow Voles
### Aliases: microtusCH microtusFCH microtusMCH microtusFMCH microtusRDCH
### Keywords: datasets

### ** Examples


# cf Williams, Nichols and Conroy Table 17.6
m.array(microtusFCH)
m.array(microtusMCH)

# cf Williams, Nichols and Conroy Fig. 17.2
fitfm <- openCR.fit(microtusFMCH, model = list(p~1, phi ~ session + sex))
maledat <- expand.grid(sex = factor('M', levels = c('F','M')), session = factor(1:6))
plot(fitfm, ylim=c(0,1), type = 'o')
plot(fitfm, newdata = maledat, add = TRUE, xoffset = 0.1, pch = 16, type = 'o')

# adjusting for variable interval
intervals(microtusCH) <-  c(35,28,35,28,34) / 30 
intervals(microtusRDCH)[intervals(microtusRDCH)>0] <- c(35,28,35,28,34) / 30

## Not run: 
##D # The text file JLYEXMPL distributed with JOLLY is in the extdata folder of the R package
##D # The microtusCH object may be rebuilt as follows
##D datadir <- system.file('extdata', package = 'openCR')
##D JLYdf <- read.table(paste0(datadir,'/JLYEXMPL'), skip = 3, 
##D                     colClasses = c('character','numeric'))
##D names(JLYdf) <- c('ch', 'freq')
##D JLYdf$freq[grepl('2', JLYdf$ch)] <- -JLYdf$freq[grepl('2', JLYdf$ch)]
##D JLYdf$ch <- gsub ('2','1', JLYdf$ch)
##D microtusCH <- unRMarkInput(JLYdf)
##D 
##D # Compare to combined-sex data from Williams et al. Table 17.5
##D JS.counts(microtusCH) - JS.counts(microtusFMCH)
## End(Not run)




