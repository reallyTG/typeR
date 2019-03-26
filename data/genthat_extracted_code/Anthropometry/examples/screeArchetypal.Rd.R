library(Anthropometry)


### Name: screeArchetypal
### Title: Screeplot of archetypal individuals
### Aliases: screeArchetypal
### Keywords: math

### ** Examples

#COCKPIT DESIGN PROBLEM:
#The following R code allows us to obtain a similar plot regarding Figure 5 
#of the paper Vinue et al. (2015).
USAFSurvey_First25 <- USAFSurvey[1:25, ]
#Variable selection:
variabl_sel <- c(48, 40, 39, 33, 34, 36)
#Changing to inches: 
USAFSurvey_First25_inch <- USAFSurvey_First25[,variabl_sel] / (10 * 2.54)

#Data preprocessing:
USAFSurvey_preproc <- preprocessing(USAFSurvey_First25_inch, TRUE, 0.95, TRUE)

#For reproducing results, seed for randomness:
set.seed(2010) 
#Run archetype algorithm repeatedly from 1 to numArch archetypes:
#This is a toy example. In other situation, choose numArch=10 and numRep=20.
numArch <- 2 ; numRep <- 2
lass <- stepArchetypesRawData(data = USAFSurvey_preproc$data, 
                          numArch=1:numArch, numRep = numRep, 
                          verbose = FALSE)
#To understand the warning messages, see the vignette of the
#archetypes package.                            
  
rss_lass <- matrix(0, nrow = numArch, ncol = numRep)
for(i in 1:numArch){
  for(j in 1:numRep){
    rss_lass[i,j] <- lass[[i]][[j]]$rss
  }
}
(rss_lass_def <- apply(rss_lass, 1, min, na.rm = TRUE))

#Run archetypoids algorithm repeatedly from 1 to numArch archetypes:
for(numArchoid in 1:numArch){
  temp <-  stepArchetypoids(numArchoid, nearest = "cand_ns", 
                            USAFSurvey_preproc$data, lass)
  filename <- paste("res_ns", numArchoid, sep = "")
  assign(filename,temp)
  save(list = c(filename), file = paste(filename, ".RData", sep = "")) 
}   

#Run archetypoids algorithm repeatedly from 1 to numArch archetypes:
for(numArchoid in 1:numArch){
  temp <-  stepArchetypoids(numArchoid, nearest = "cand_alpha", 
                            USAFSurvey_preproc$data, lass)
  filename <- paste("res_alpha", numArchoid, sep = "")
  assign(filename,temp)
  save(list = c(filename), file = paste(filename, ".RData", sep = "")) 
}  

#Run archetypoids algorithm repeatedly from 1 to numArch archetypes:
for(numArchoid in 1:numArch){
  temp <-  stepArchetypoids(numArchoid, nearest = "cand_beta", 
                            USAFSurvey_preproc$data, lass)
  filename <- paste("res_beta", numArchoid, sep = "")
  assign(filename,temp)
  save(list = c(filename), file = paste(filename, ".RData", sep = "")) 
}  

#Numerical and graphical results:
#Cand_ns:
for(i in 1:numArch){
  load(paste("res_ns", i, ".RData", sep = ""))
}
rss_step <- c()
for (i in 1:numArch){
  rss_step[i] <- get(paste("res_ns", i, sep = ""))[[2]]
}
(rss_step_ns <- as.numeric(rss_step))

#Cand_alpha:
for(i in 1:numArch){
  load(paste("res_alpha", i, ".RData", sep = ""))
}
rss_step_which <- c()
for (i in 1:numArch){
  rss_step_which[i] <- get(paste("res_alpha", i, sep = ""))[[2]]
}
(rss_step_alpha <- as.numeric(rss_step_which))

#Cand_beta:
for(i in 1:numArch){
  load(paste("res_beta", i, ".RData", sep = ""))
}
rss_step_which <- c()
for (i in 1:numArch){
  rss_step_which[i] <- get(paste("res_beta", i, sep = ""))[[2]]
}
(rss_step_beta <- as.numeric(rss_step_which))

forYlim <- c(rss_lass_def, rss_step_ns, rss_step_alpha, rss_step_beta)
range(forYlim)
#[1] 0.06387125 0.27395811

#main <- "Aircraft pilots archetypes and archetypoids" 
xlab <- "Archetypes/Archetypoids"
ylab <- "RSS"
screeArchetypal(numArch, rss_lass_def, rss_step_ns, rss_step_alpha, rss_step_beta, 
                c(0,0.5), main = "", xlab, ylab, col = c("red","blue","green3"), 
                TRUE, seq(0,0.5,0.1), FALSE)



