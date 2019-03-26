library(dfmeta)


### Name: ZKO
### Title: Meta-analysis approach based on Zohar et al, 2011.
### Aliases: ZKO

### ** Examples

  ## Not run: 
##D   
##D   	###############################################
##D   	#### A simple example using a simple data #####
##D   	###############################################
##D   
##D   	vanGroeningen <- rbind(c(25,0/6, 6), c(35, 0/5,5), c(40, 4/11, 11), c(45, 3/5, 5))
##D   	Hoff <- rbind(c(30, 3/9, 9), c(35, 2/3, 3), c(40, 2/3, 3))
##D   	Zhu <- rbind(c(30, 0/12, 12), c(35, 2/3, 3))
##D   	dataTox <- rbind(vanGroeningen, Hoff, Zhu)
##D   	dataTox <- data.frame(dataTox)
##D   	colnames(dataTox) <- c("doses", "proba", "nbPatients")
##D   	nbTox <- dataTox$proba*dataTox$nbPatients
##D   	dataTox <- data.frame(dataTox, nbTox)
##D   	doses <- c(25, 30, 35, 40, 45)
##D   	nbSimu <- 10
##D   	zko <- ZKO(dataTox, doses, target = 0.3, dr = c(0.05, 0.15, 0.2, 0.3, 0.35), nbSimu)
##D     
##D   	###########################################################################
##D   	################ A second example using the data "Toxdata" ################
##D   	################### included in the "dfmeta" R package ####################
##D   	###########################################################################
##D   
##D   	data(Toxdata)
##D   	pos <- which(Toxdata$simulation == 0)
##D   	dataTox2 <- Toxdata[pos, ]
##D   	dataTox2 <- dataTox2[, c(2,6,4,5)]
##D   
##D   	### Remember that the structure of the database must be in the following structure ###
##D   
##D   	colnames(dataTox2) <- c("doses", "proba", "nbPatients", "nbTox")
##D   	doses <- 0:5
##D   	nbSimu <- 10
##D   	zko2 <- ZKO(dataTox2, doses, target = 0.3, dr = c(0.05, 0.15, 0.2, 0.3, 0.35, 0.45),
##D   	nbSimu)
##D   
## End(Not run)



