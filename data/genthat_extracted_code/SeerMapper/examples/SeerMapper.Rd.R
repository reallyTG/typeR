library(SeerMapper)


### Name: SeerMapper
### Title: Quick Rate Mapper at State, State/County, State/County/Census
###   Tract, or Seer Registry area levels
### Aliases: SeerMapper

### ** Examples


#####
#
#  Generate data.frame of all data for the US States and DC
#

data(USStates_CM_St_Data,envir=environment())
str(USStates_CM_St_Data)

#
#####

#####
#
#  Example # s01 - States Mapping Basic defaults
#
#  In this example rate and p-value data is provided for each state.  
#  The number of categories requested is set to 5.  
#  The "pValue" column in the data is used to hatch states when 
#  the p-value > 0.05.  The defaults on the hatch feature are tuned
#  support hatching of p-value data that is not-significate. 
#
#  Border defaults for state data are = stateB=ALL, seerB=NONE.
#
#  This example uses example s1's data.  All state boundaries are drawn.
#

TT   <- c("Ex-s01 States Mapping Cancer Mortality Rate",
            "all defaults")

pdf("SM-Ex-s01 States Map of Cancer Mortality-defaults.pdf",
     width=10.5,height=8)

SeerMapper(USStates_CM_St_Data,
           mTitle  =TT
        )
dev.off()

#
#  The p-value data in the dataset was assigned 0.02 or 0.2 based on a
#  comparison the state's confidence interval values and the US's rate, 
#  for age adjusted rates for all cancers and cancer deaths for the years
#  2009 to 2013.
#
####

#####
#
#  Example # s02 - States Mapping Basic with Hatching (keep)
#
#  In this example rate and p-value data is provided for each state.  
#  The number of categories requested is set to 5.  
#  The 'pValue' column in the data is used to hatch states when 
#  the data value > 0.05.  The defaults on the hatch feature are tuned
#  support hatching of p-value data that is not-significate. 
#
#  Border defaults for state data are = stateB=ALL, seerB=NONE.
#
#  This example uses example s1's data.  All state boundaries are drawn.
#

TT   <- c("Ex-s02 States Mapping Cancer Mortality Rate",
            "w hatching and defaults")

pdf("SM-Ex-s02 States Map of Cancer Mortality-w hatching.pdf",
      width=10.5,height=8)

SeerMapper(USStates_CM_St_Data,
           hatch   = TRUE,
           mTitle  = TT
        )
        
dev.off()

#
#  The p-value data in the dataset was assigned 0.02 or 0.2 based on a
#  comparison the state's confidence interval values and the US's rate, 
#  for age adjusted rates for all cancers and cancer deaths for the years
#  2009 to 2013.
#
####


######
#
#  Generate Seer Regs data.frame for 17 of the 20 registries and 
#    a smaller Seer Regs data.frame for the original 12 registries
#    All of the registry data.frames serve as partial data sets.
#    The 12 registry data.frame shows the features the best.
#
#  The following script creates the dataset for use in examples sr30-sr41.
#  Since it is not re-created in the code for each examples, this code
#  must be run or copied to the example as needed.
#

data(SeerRegs_CM_Data,envir=environment())   # 17 registries
str(SeerRegs_CM_Data)

# Get US rate for "All_Both" sexes and races.
USRate <- SeerRegs_CM_Data[2,"All_Both"]
cat("USRate:",USRate,"\n")

# strip off first to rows as required
SeerRegs_CM_Data <- SeerRegs_CM_Data[c(-1,-2),]   
                   # this gets ride of Seer Reg and U.S data.

#  Select data for the original Seer 13 Registries without Alaska.
srList <- c("CT", "MI-DET", "GA-ATL", "GA-RUR", 
            "CA-SF", "CA-SJ", "CA-LA", "HI", "IA", 
            "NM", "WA-SEA", "UT")
            
SeerRegs_CM_Data_12 <- SeerRegs_CM_Data[srList,]

#

#####
#
#  Example # sr11 - Seer Registry 17 Mapping (keep)
#
#  Of the 21 NCI Seer Registries, the basic 17 registries are
#     CT, Detroit, GA-Atlanta, GA-Rural, GA-Other, 
#     Hawaii, Iowa, Utah, New Jersey, New Mexico,
#     Calif-San Fran, Calif-San Jose, Calif-LA, Calif-Other (Greater), Kentucky, 
#     Louisiana, and Wash-Seattle-Puget Sound
#  
#  Boundaries are included, but data is rarely available for:
#     Alaska, Arizona, and Oklahome native areas.
#
#  The default stateB and seerB call parameter values for 
#  for Seer Registry data are:  stateB="ALL" and seerB="DATA".  
#  The countyB and tractB parameters are ignored.
#
#
TT   <- c("Ex-sr11 Seer Reg 17 Map-Cancer Mort. Rates All Both",
           "stateB-ALL, seerB-DATA" )

pdf("SM-Ex-sr11 Seer Reg 17 Map stB-A srB-D.pdf",
      width=10.5,height=8)

SeerMapper(SeerRegs_CM_Data,
              idCol   = "Registry",dataCol="All_Both",
              stateB  = "ALL",
              mTitle  = TT
            )
dev.off()

#
####


####
#
#  Create a data.frame for All and Partial Kentucky Counties. 
#

data(Kentucky_CM_Co_Data,envir=environment())
str(Kentucky_CM_Co_Data)

KY_Co_DF <- Kentucky_CM_Co_Data         # start with the fill set of counties.

lKY      <- dim(KY_Co_DF)[1]            # get number of counties
selKY    <- (runif(lKY) <= 0.75 )       # select random 75% of counties
KY_Co_P  <- KY_Co_DF[selKY,]

#
#####

#####
#
#  Example # c30 Kentucky All Co Map w hatching, 
#         default - countyB="DATA", seerB="NONE", stateB="NONE"
#
#  In this example, countyB is set to "STATE", to tell the package
#  to draw all of the county bountaries within any state containing
#  a county with data.
#

TT   <- c("Ex-c30 Kentucky All County Map w hatching",
               "defaults")

pdf("SM-Ex-c30 Kentucky All Co Map w hatching-defaults.pdf",
      width=10.5,height=8)

SeerMapper(KY_Co_DF,
              idCol   ="stcoID",dataCol="AA_Rate",
              hatch   = list(dataCol="pValue"),
              mTitle  = TT
            )

dev.off()

#
####

#####
#
#   Data for the following examples.  2010 census boundaries

data(GA_Dem10_Co_Data,envir=environment())
GA_D_Co_Data  <- GA_Dem10_Co_Data
GA_D_Co_Data$PC.age.65.up <- ( GA_D_Co_Data$age.65.up / GA_D_Co_Data$pop2010 ) * 100
meanPopDens     <- mean(GA_D_Co_Data$popdens)

#####
#
#  Examples c64 use 2010 census demographic data and use the 
#  SeerMapper2010 function call to activate the 2010 boundary data collection.
#

#####
#
#  Example c64 - Georgia County Dem10 Data for Percentage age 65 and up
#
#  The Georgia 2010 demographic county Dem dataset (GA_Dem10_Co_Data) 
#  is used in this example.
#  The percentage (0% to 100%) of individuals in each tract that is 
#  65 year old or older is calculated and mapped.
#

# calculate the percentage of age 65 up vs population

TT   <- c("Ex-c64 Georgia County10 for PC 65 and up",
             "def: countyB='DATA' seerB='NONE' stateB='NONE'")

pdf("SM-Ex-c64 GA Counties10-PC age 65 and up-def.pdf",
     width=8,height=10.5)

SeerMapper2010(GA_D_Co_Data, 
               idCol   = "ID",dataCol="PC.age.65.up",
               categ   = 7,
               mTitle  = TT
           )

dev.off()

#
####

#####
#
#  Example H04 - Hatching of non-p-value type data, line density, 
#       and color  
#
#  Using the Georgia demographic county dataset (GA_Dem_Co_Data) 
#   population density to demonstrate:
#      Hatching of non-p-value type data (popdens), operation set 
#      to "<", value set to mean of all population densities, color 
#      changed to blue, palette changed reds, request 6 categories.
#      

#
#  Example H04 - Hatching of non-p-value type data, line density, 
#       and color  
#

TT   <- c("Ex-H04 Georgia Co w hatching of > mean popdens",
                 "den=15, angle=60")

pdf("SM-Ex-H04 GA Co 2010 hatch-ge mean popdens-d15 a60.pdf",
     width=8,height=10.5)

SeerMapper2010(GA_D_Co_Data, 
            idCol     = "ID",dataCol="popdens",
            categ     = 6,               # use 6 categories
            hatch     = list(col="red", den=15, angle=60,
                         dataCol="popdens",ops=">",value=meanPopDens),
            palColors = "BuGn",
            mTitle    = TT
          )

dev.off()

#
#####

####
#
#  Have data at the census tract level works exactly the same as data 
#  at the county level.  The only exception is supplemental boundary 
#  information datasets may be needed.
#

#
#  Example - c80 - Wash-Balt CSA county level - defaults
#

data(WashBaltMetro_Co_Data)

TT <- c("SM-Ex-c80-Washington-Baltimore Metro","County-Combined Statistics Area-def")

pdf("SM-Ex-c80-WashBalt-County-CSA-def.pdf",  width=10.5,height=8)

SeerMapper(WashBaltMetro_Co_Data,
                  idCol="ID",dataCol="popdens",
                  categ=7,
                  mTitle=TT
                )

dev.off()
#
####


#
#  End of County Examples
#

#######################

###
#
#  To do the same Washington Baltimore Metro area a the census tract level,
#  the data is collected at the census tract level and filtered
#  to just the CSA tracts.
#
#  To cover all of the conditions in the next two examples:
#

#
#  With the SeerMapperEast and SeerMapperWest supplemental 
#  packages loaded, maps can be created for census tracts in any state or 
#  district.
#

####
#
#  County Cancer Mortality data for Washington State (keep)
#
data(WA_Dem_Tr_Data,envir=environment())

WA_D_Data           <- WA_Dem_Tr_Data
WA_D_Data$PCover65  <- WA_Dem_Tr_Data$age.65.up/WA_Dem_Tr_Data$pop2000   #  Percentage 65/pop

 # have to compensate for NA in the saID list (no registry)
isNAsa           <- is.na(WA_D_Data$saID)         
sL               <- !isNAsa & (WA_D_Data$saID    == "WA-SEA")
                      # counties with saID set and == "WA-SEA"

nSL              <- isNAsa | (WA_D_Data$saID    != "WA-SEA")    
                      # counties with saID not set (NA) or != "WA-SEA"

WA_D_Data_Seat   <- WA_D_Data[sL,]  
WA_D_Data_NotSeat<- WA_D_Data[nSL,]  

         # pull out the data for the Washingto-Puget Registry.
lWA            <- dim(WA_D_Data_Seat)[1]        # get number of counties
selectedWA     <- (runif(lWA) <= 0.6 )       # select random 80% of CO in Puget area.
WA_D_Data_Seat_P <- WA_D_Data_Seat[selectedWA,]

lWA            <- dim(WA_D_Data_NotSeat)[1]
selectedNotWA  <- (runif(lWA) <= 0.2 )
WA_D_Data_NotSeat_P<- WA_D_Data_NotSeat[selectedNotWA,]

WA_D_P_Data      <- WA_D_Data_Seat_P
WA_D_P_Data      <- rbind(WA_D_P_Data,WA_D_Data_NotSeat_P)

#
#    Example # tr74 shows percentage of 65 and up over population.
#    Example # tr78 partial data in Washington State - tractB="SEER"
# 

#####
#
#  Example # tr74 Washington All Census Tracts  (keep)
#         tractB=DATA, countyB=NONE seerB=NONE, stateB=NONE (def)
#
TT <- c("Ex-tr74-Washington All Census Tracts","Percentage > 65, defaults")

pdf("SM-Ex-tr74-WA-Dem-All-Census-Tracts-PCgt65-def.pdf", width=10.5,height=8)

SeerMapper(WA_D_Data,
                idCol="ID",dataCol="PCover65",
                mTitle=TT
              )
dev.off()
#
####


#####
#
#  Example # tr78 Washington Partial Tracts
#         tractB=SEER, seerB=NONE, stateB=NONE (def)
#
TT <- c("Ex-tr78 Washington Partial Tracts","tractB=SEER")

pdf("SM-Ex-tr78-WA-Dem-P-Tract-trB-sr.pdf", width=10.5,height=8)

SeerMapper(WA_D_P_Data,
                idCol="ID",dataCol="popdens",
                tractB = "SEER",
                mTitle=TT
              )

dev.off()
#
####

#
#  end of examples
#
#####

  #
  # Reference: Mapping it out, Mark Monnier - benefit of characterization 
  #    and simplification for a more visible map.  
  #
  #    Still need simplification and maintain same area and 
  #    relationships/neigborships.
  #
  #    Purpose of map is to illustrate spatial patterns of the mapped 
  #    variable.  It is important that each area be visible and that 
  #    the spatial relationship be maintain.  It is not important the 
  #    area's shape if maintained.
  #
 



