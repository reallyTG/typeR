library(SCCS)


### Name: formatdata
### Title: Formatting data
### Aliases: formatdata

### ** Examples


# MMR vaccine and ITP data

# A single exposure with three risk periods and no age groups included

 itp.dat1 <- formatdata(indiv=case, astart=sta, aend=end,
                      aevent=itp, adrug=mmr, aedrug=mmr+42,
                      expogrp=c(0,15,29), 
                      data=itpdat)

 itp.dat1

# A single exposure with three risk periods and six age groups

 itp.dat2 <- formatdata(indiv=case, astart=sta, aend=end,
                      aevent=itp, adrug=mmr, aedrug=mmr+42,
                      expogrp=c(0,15,29), agegrp=c(427,488,549,610,671),
                      data=itpdat)
 itp.dat2




