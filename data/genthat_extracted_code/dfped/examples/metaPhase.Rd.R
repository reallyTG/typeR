library(dfped)


### Name: metaPhase
### Title: Meta-analysis function of dose-finding studies proposed by Zohar
###   et al, (2011).
### Aliases: metaPhase

### ** Examples

## Not run: 
##D     pardos_2006 <- rbind(c(100,0/3, 3), c(150, 1/3,3), c(200, 0/3, 3), c(250, 3/6, 6))
##D     thepot_2014 <- rbind(c(100, 0/5, 5), c(150,3/25, 25))
##D     calvo_2007 <- rbind(c(150, 1/25, 25))
##D     raizer_2010 <- rbind(c(150,11/99, 99))
##D     vanDenBent_2009 <- rbind( c(200, 6/54, 54))
##D     sheikh_2012 <- rbind(c(150, 0.544, 307)) 
##D     rocheNTC00531934 <- rbind(c(150, 0.186, 59)) 
##D     dataTox <- rbind(pardos_2006, thepot_2014, calvo_2007, raizer_2010, vanDenBent_2009, 
##D                    rocheNTC00531934, sheikh_2012)
##D     dataTox <- data.frame(dataTox)
##D     colnames(dataTox) <- c("doses", "proba", "nbPatients")
##D     nbTox <- dataTox$proba*dataTox$nbPatients
##D     dataTox <- data.frame(dataTox, nbTox)
##D     doses <- c(100,150,200, 250)
##D     nbSimu <- 10
##D 
##D     metaPhase(dataTox, doses, nbSimu)
## End(Not run)



