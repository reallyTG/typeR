library(dfped)


### Name: skeleton
### Title: Build a working model.
### Aliases: skeleton plotEstimates

### ** Examples
 
## Not run: 
##D     ########
##D     # Note: For this example we are using a paediatric database that we have including data of 
##D     # children from 0 to 19 years old.
##D     ########
##D     
##D     children <- read.csv("/Users/artemistoumazi/paediatric_data_p3m/children_0_19.csv")
##D     AGE <- children$Age
##D     W <- children$Weight
##D 
##D     W_ad <- 70
##D     Cl_ad <- 3.95
##D 
##D     F_ad <- 0.6
##D     Eg <- 0
##D     Eh <- 0.058
##D     f_abs <- F_ad/((1 - Eh)*(1-Eg))
##D     fu_ad <- 1
##D     perc_CYPh <- data.frame("CYP3A4_5" = 0.7, "CYP1A2" = 0.3)
##D     perc_CYPg <- data.frame("CYP3A4_5" = 1)
##D     perc_alb <- 1
##D     perc_alpha1AG <- 0 
##D 
##D     data_molecule <- list(F_ad, f_abs, Eg, Eh, fu_ad, perc_CYPg, perc_CYPh, 
##D                           perc_alb, perc_alpha1AG)
##D     Clch_mat <- Clch.Mat(AGE, W, Cl_ad, W_ad, data_molecule)
##D 
##D     ####################################
##D     ########## WORKING MODEL ###########
##D     ####################################
##D 
##D     children <- data.frame(children, Clch_mat)
##D 
##D     ########## Children from 2 to 5 years old 
##D     children2_5 <- children[children$Age >= 2 & children$Age <= 5  ,]                          
##D     Cl_ch <-  mean(children2_5$Clch_mat)                    
##D 
##D     # Doses for paediatric using maturation adjustment
##D     dCh_mat_2_5 <- c(30, 45, 55, 70, 85)
##D 
##D     Cl_ad <- 3.95
##D     AUCThomas <- c(20,40, 60)
##D     probaToxThomas <- c(0.1,0.25, 0.55)
##D 
##D 
##D     ################# Non-parametric PAVA estimate ###################
##D 
##D     # data from the publications of toxicity in the erlotinib
##D     pardos_2006 <- rbind(c(100,0/3, 3), c(150, 1/3,3), c(200, 0/3, 3), c(250, 3/6, 6))
##D     thepot_2014 <- rbind(c(100, 0/5, 5), c(150,3/25, 25))
##D     calvo_2007 <- rbind(c(150, 1/25, 25))
##D     raizer_2010 <- rbind(c(150,11/99, 99))
##D     vanDenBent_2009 <- rbind( c(200, 6/54, 54))
##D     sheikh_2012 <- rbind(c(150, 0.544, 307)) 
##D     rocheNTC00531934 <- rbind(c(150, 0.186, 59)) 
##D 
##D 
##D     dataTox <- rbind(pardos_2006, thepot_2014, calvo_2007, raizer_2010, vanDenBent_2009, 
##D                      rocheNTC00531934, sheikh_2012)
##D     dataTox <- data.frame(dataTox)
##D     colnames(dataTox) <- c("doses", "proba", "nbPatients")
##D     nbTox <- dataTox$proba*dataTox$nbPatients
##D     dataTox <- data.frame(dataTox, nbTox)
##D 
##D     data_auc <- data.frame(AUCThomas, probaToxThomas )
##D     dose_children <- dCh_mat_2_5[1:4]
##D     dose_adult <- c(100,150,200, 250)
##D     graph <- TRUE
##D 
##D     skeleton(dose_children, dose_adult, dataTox, data_auc, Cl_ad, Cl_ch, nbSimu = 10, 
##D              graph = TRUE)
## End(Not run)



