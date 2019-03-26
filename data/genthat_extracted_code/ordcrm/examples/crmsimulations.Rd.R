library(ordcrm)


### Name: crmsimulations
### Title: Simulations to Assess operating characteristics of proportional
###   odds model (POM), continuation ratio (CR) Model, and binary CRM
###   Designs
### Aliases: crmsimulations

### ** Examples

#Example 1
#Underlying True POM dosetox
truePO1<-c(-0.4, 0.0011, -1.3, 0.0011, -2.8, 0.0011, -3.9, 0.0011)
#POM Pseudodata
initial.pom.y1<-c(rep(0,45),rep(1,36),rep(2,9),rep(3,8),rep(4,2),rep(0,18),
rep(1,35),rep(2,17),rep(3,24),rep(4,6),rep(0,8),rep(1,24),rep(2,18),rep(3,38),
rep(4,12),rep(0,1),rep(1,4),rep(2,5),rep(3,35),rep(4,55))
initial.pom.d1<-c(rep(200,100),rep(1067,100),rep(1613,100),rep(3000,100))
#POM CRM Design Simulation run 10 times, with a true dosetox model equal to a POM
crmsimulations(startdose = 1060, numbersims = 10, cohortsize = 3, samplesize = 30,
pseudoweights = 3,pseudotox = initial.pom.y1, pseudodose = initial.pom.d1, dosetox = truePO1,
truedosetoxmodeltype = 'POM', design = 'POM', targetDLT = 0.30, discrete = FALSE,
discretedoses = NA, numberdltrule = NA, lowerlimitrule = NA, upperlimitrule = NA,
dltrule = NA, increaserule= NA, minimum = NA, maximum = NA, combine01 = FALSE)

#Example 2
#Underlying true POM dosetox
truePO1<-c(-0.4, 0.0011, -1.3, 0.0011, -2.8, 0.0011, -3.9, 0.0011) #POM 1#
#CR Model Pseudodata with Grades 0 and 1 combined into one category
combine.cr.y1<-c(rep(0,81),rep(1,9),rep(2,8),rep(3,2),
rep(0,55),rep(1,15),rep(2,26),rep(3,4),
rep(0,37),rep(1,13),rep(2,40),rep(3,10),
rep(0,5),rep(1,5),rep(2,35),rep(3,55))
initial.cr.d1<-c(rep(200,100),rep(934,100),rep(1467,100),rep(3000,100))
#CR Model CRM Design Simulation run 10 times, with a true dosetox model equal to a POM
crmsimulations(startdose = 1060, numbersims = 10, cohortsize = 3,
samplesize = 30, pseudoweights = 3,pseudotox = combine.cr.y1,
pseudodose = initial.cr.d1, dosetox = truePO1, truedosetoxmodeltype = 'POM',
design = 'CR', targetDLT = 0.30, discrete = FALSE, discretedoses = NA,
numberdltrule = NA, lowerlimitrule = NA, upperlimitrule = NA, dltrule = NA,
increaserule = NA, minimum = NA, maximum = NA, combine01 = TRUE)

#Example 3
#Underlying True CR dosetox
crmodel1<-c(1.58,-0.0018,-0.45,-0.0018,1.20,-0.0018,3.14,-0.0018) #CR Model 1#
#CRM Pseudodata
initial.crm.y1<-c(rep(0,90),rep(1,10),rep(0,70),rep(1,30),
rep(0,50),rep(1,50),rep(0,10),rep(1,90))
initial.crm.d1<-c(rep(200,100),rep(1060,100),rep(1600,100),rep(3000,100))
#Binary CRM Design Simulation run 10 times, with a true dosetox model equal to a CR
crmsimulations(startdose = 1060, numbersims = 10, cohortsize = 2,
samplesize = 20, pseudoweights = 3,pseudotox = initial.crm.y1,
pseudodose = initial.crm.d1, dosetox = crmodel1, truedosetoxmodeltype = 'CR',
design = 'CRM', targetDLT = 0.30, discrete=TRUE,
discretedoses=c(200,400,800,1200,1800,2500),
numberdltrule = NA, lowerlimitrule = NA, upperlimitrule = NA, dltrule = NA,
increaserule = NA, minimum = NA, maximum = NA, combine01 = FALSE)




