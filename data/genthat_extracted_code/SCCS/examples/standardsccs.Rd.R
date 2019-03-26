library(SCCS)


### Name: standardsccs
### Title: The standard SCCS method
### Aliases: standardsccs
### Keywords: Parametric

### ** Examples


# Single exposure-related risk period with no age effect

  itp.mod1 <- standardsccs(event~mmr, indiv=case, astart=sta, aend=end,
                        aevent=itp, adrug=mmr, aedrug=mmr+42, data=itpdat)

  itp.mod1

# Single exposure-related risk period and age effect included

  itp.mod2 <- standardsccs(event~mmr+age, indiv=case, astart=sta, aend=end,
                        aevent=itp, adrug=mmr, aedrug=mmr+42,
                        agegrp=c(427,488,549,610,671), data=itpdat)

  itp.mod2

# Multiple risk periods and age effect included  
  
  itp.mod3 <- standardsccs(event~mmr+age, indiv=case, astart=sta, aend=end,
                        aevent=itp, adrug=mmr, aedrug=mmr+42, expogrp=c(0,15,29),
                        agegrp=c(427,488,549,610,671), data=itpdat)

  itp.mod3

# Multiple risk periods, washout periods and age effects

   ## No test: 
ageq <- floor(quantile(hipdat$frac, seq(0.05,0.95,0.05), 
                         names=FALSE))
## End(No test) # Age group 
                                      # cut points
   
   ## No test: 
hip.mod1 <- standardsccs(event~ad+age, indiv=case, astart=sta, aend=end,
                           aevent=frac, adrug=ad, aedrug=endad, expogrp=c(0,15,43),
                           washout=c(1,92,182), agegrp=ageq, data=hipdat)
## End(No test)


# Multiple/repeat exposures of the same exposure type, dataformat="stack" 

   ## No test: 
ageq <- floor(quantile(gidat$bleed[duplicated(gidat$case)==0], 
                seq(0.025,0.975,0.025), names=FALSE))
## End(No test)

   ## No test: 
gi.mod1 <- standardsccs(event~ns+relevel(age,ref=21), indiv=case, astart=sta,
                         aend=end, aevent=bleed, adrug=ns, aedrug=endns,
                         agegrp=ageq, dataformat="stack", data=gidat)
## End(No test)

   ## No test: 
gi.mod1
## End(No test)
   
#  Multiple doses of a vaccine each with different parameter estimates (sameexpopar=F)
  
   
   ageg <- c(57,85,113,141,169,197,225,253,281,309,337) # age group cut points
   
   dtp.mod2 <- standardsccs(event~dtp+age, indiv=case, astart=sta, aend=end,
                           aevent=conv, adrug=cbind(dtp,dtpd2, dtpd3), 
                           aedrug=cbind(dtp+14,dtpd2+14,dtpd3+14), 
                           expogrp=c(0,4,8),agegrp=ageg, dataformat="multi", 
                           sameexpopar=FALSE, data=dtpdat)

   dtp.mod2
   
# Multiple exposure types 

  ## No test: 
ageg <- seq(387,707,20) # Age group cut points
## End(No test)
 ## No test: 
con.mod <- standardsccs(event~hib+mmr+age, indiv=case, astart=sta, aend=end,
                          aevent=conv, adrug=cbind(hib,mmr), aedrug=cbind(hib+14,mmr+14), 
                          expogrp=list(c(0,8), c(0,8)), agegrp=ageg, data=condat)
## End(No test)

  ## No test: 
con.mod
## End(No test)

   
# Multiple doses/episodes of several exposure types, the doses of each exposure type
# have same paramter


   ageg <- c(57,85,113,141,169,197,225,253,281,309,337)   # age group cut points 

   hib.mod1 <- standardsccs(event~dtp+hib+age, indiv=case, astart=sta, 
                            aend=end, aevent=conv, 
                           adrug=list(cbind(dtp, dtpd2,dtpd3),
                                       cbind(hib,hibd2,hibd3)),
                            aedrug=list(cbind(dtp+14,dtpd2+14,dtpd3+14),
                                        cbind(hib+14,hibd2+14,hibd3+14)),
                            expogrp=list(c(0,4,8),c(0,8)),agegrp=ageg, 
                            dataformat="multi", data=hibdat)
                            
   hib.mod1                   


# Multiple doses/episodes of several exposure types, the doses of "dtp" 
# different parameters and the doses of the second exposure hib have
# same paramters


   ## No test: 
ageg <- c(57,85,113,141,169,197,225,253,281,309,337)
## End(No test)
                    # age group cut points 

   ## No test: 
hib.mod2 <- standardsccs(event~dtp+hib+age, 
                                   indiv=case, astart=sta, aend=end,
                        aevent=conv, adrug=list(cbind(dtp,dtpd2,dtpd3), 
                                      cbind(hib,hibd2,hibd3)), 
                        aedrug=list(cbind(dtp+3,dtpd2+3,dtpd3+3),
                                      cbind(hib+7,hibd2+7,hibd3+7)),
                        sameexpopar=c(FALSE,TRUE), agegrp=ageg, 
                        dataformat="multi", data=hibdat)
## End(No test)
   ## No test: 
hib.mod2
## End(No test)

   
# Season included in a model 

   month <- c(0101,0102,0103,0104,0105,0106,0107,0108,0109,0110,0111,0112) 
   # season cutpoints 
   
   int.mod <- standardsccs(event~opv+age+season, indiv=case, astart=sta,
                          aend=end, aevent=intus, adrug=cbind(opv,opvd2),
                          aedrug=cbind(opv+42,opvd2+42), expogrp=c(0,15,29),
                          agegrp=seq(30,330,30), seasongrp=month,dob=dob, 
                          dataformat="multi", data=intdat)
   int.mod



