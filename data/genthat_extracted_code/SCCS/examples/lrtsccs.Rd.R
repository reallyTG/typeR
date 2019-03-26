library(SCCS)


### Name: lrtsccs
### Title: Likelihood ratio test for SCCS models
### Aliases: lrtsccs
### Keywords: likelihodd ratio test

### ** Examples


 itp.mod1 <- standardsccs(event~mmr+age, indiv=case, astart=sta,aend=end,
                          aevent=itp, adrug=mmr, aedrug=mmr+42, expogrp=c(0,15,29),
                          agegrp=c(427,488,549,610,671), data=itpdat)
                          
 
 itp.mod2 <- standardsccs(event~age, indiv=case, astart=sta,
                         aend=end, aevent=itp, adrug=mmr, aedrug=mmr+42,
                         expogrp=c(0,15,29), agegrp=c(427,488,549,610,671),
                         data=itpdat)
                         
 itp.mod3 <- standardsccs(event~mmr + age, indiv=case, astart=sta,
                          aend=end, aevent=itp, adrug=mmr, aedrug=mmr+42,
                          agegrp=c(427,488,549,610,671), data=itpdat)
                        

# Compare itp.mod1 a model with both age and exposure (mmr) and itpmod2 a model
# with only age effect 

   lrtsccs(itp.mod1,itp.mod2)
   
# Compare itp.mod1 a model with both age and 3 exposure categories and itpmod3 
# a model with age and only one exposure category  

   lrtsccs(itp.mod3,itp.mod1)  # order of the objects doesn't matter
   
   


