library(micromapST)


### Name: micromapST
### Title: Linked Micromap Graphics Package
### Aliases: micromapST micromapST.Version

### ** Examples



######
#   micromapST - Example # 01 - map with no cumulative shading,
#     2 columns of statistics: dot with 95% confidence interval, boxplot
#     sorted in descending order by state rates, using the default
#     border group of "USStatesBG", with default symbols.
####
# load sample data, compute boxplot

data(wflung00and95,wflung00and95US,wflung00cnty,envir=environment()) 

wfboxlist = boxplot(split(wflung00cnty$rate,wflung00cnty$stabr),plot=FALSE)  

# set up 4 column page layout

panelDesc01 <- data.frame(
  type=c("map","id","dotconf","boxplot"),    
  lab1=c("","","State Rate","County Rates"),  
  lab2=c("","","and 95% CI","(suppressed if 1-9 deaths)"), 
  lab3=c("","","Deaths per 100,000","Deaths per 100,000"), 
  col1=c(NA,NA,1,NA),col2=c(NA,NA,3,NA),col3=c(NA,NA,4,NA),     
  refVals=c(NA,NA,wflung00and95US[1,1],NA),   
  refTexts=c(NA,NA,"US Rate 2000-4",NA),       
  panelData= c("","","","wfboxlist")          
  ) 
# set up PDF output file, call package

pdf(file="Ex01-WFLung-2000-2004-State-Dot-County-Box.pdf",width=7.5,height=10)

micromapST(wflung00and95, panelDesc01, sortVar=1, ascend=FALSE,
               title=c("Ex01-White Female Lung Cancer Mortality, 2000-2004", 
                       "State Rates & County Boxplots")
           )  

dev.off()
##End Example 01

######
#   micromapST - Example # 02 - map with cumulative shading 
#                      from top down (mapcum), arrow and bar charts, 
#                      sorted in descending order by starting
#                      value of arrows (1950-69 rates) using default
#                      border group of "USStatesDF".  This 
#                      example also provides custom colors for the 
#                      linked micromaps, highlights, etc.
#   
####
# Load example data from package.

data(wmlung5070,wmlung5070US,envir=environment())  

panelDesc02 <- data.frame(
   type=c("mapcum","id","arrow","bar"),		
   lab1=c("","","Rates in","Percent Change"),       
   lab2=c("","","1950-69 and 1970-94","1950-69 To 1970-94"),  
   lab3=c("MAPCUM","","Deaths per 100,000","Percent"),
   col1=c(NA,NA,"RATEWM_50","PERCENT"), 		
   col2=c(NA,NA,"RATEWM_70",NA)		
 )
 
colorsRgb = matrix(c(                    # the basic 7 colors.
 213,  62,  79,   #region 1: red	    #D53E4F - Rust Red
 252, 141,  89,   #region 2: orange	    #FC8D59 - Brn/Org
 253, 225, 139,   #region 3: green	    #FEE08B - Pale Brn
 153, 213, 148,   #region 4: greenish blue  #99D594 - med Green
  50, 136, 189,   #region 5: lavendar 	    #3288BD - Blue
 255,   0, 255,   #region 6                 #FF00FF - Magenta    
 .00, .00, .00,   #region 7: black for median #000000 - Black
 230, 245, 152,   #non-highlighted foreground #E6F598 - YellowGreen
 255, 174, 185,   # alternate shape upper   #FFAEB9 - Mauve
 191, 239, 255,   # alternate shape lower   #BFEFFF - Cyan
 242, 242, 242,   # lightest grey for non-referenced sub-areas  #F2F2F2
 234, 234, 234),  # lighter grey for background - non-active sub-areas. #EAEAEA
 
  ncol=3,byrow=TRUE)

xcolors = c( grDevices::rgb(colorsRgb[,1],colorsRgb[,2],colorsRgb[,3],
                            maxColorValue=255),
              # set solid colors
            grDevices::rgb(colorsRgb[,1],colorsRgb[,2],colorsRgb[,3],64,
                            maxColorValue=255))   
              # set translucent colors for time series.

# set up reference names for color set
names(xcolors) =c("rustred","orange","lightbrown","mediumgreen", 
                  "blue","magenta", "black","yellowgreen",
                  "mauve","cyan","lightest grey","lighter grey",
                  "l_rustred","l_orange","vlightbrown","lightgreen", 
                  "lightblue","l_black","l_yelgreen","l_mauve",
                  "l_cyan","l_lightest grey","l_lighter grey")       

pdf(file="Ex02-WmLung50-70-Arrow-Bar.pdf",width=7.5,height=10)

micromapST(wmlung5070,panelDesc02,sortVar=1,ascend=FALSE,
        title=c("Ex02-Change in White Male Lung Cancer Mortality Rates",
                   "from 1950-69 to 1970-94-Diff colors"), colors=xcolors
            ) 

dev.off()
##End Example 02

######
#   micromapST - Example # 03 - Time Series Line Plots with Confidence Bands
#     maptail option highlights states from extremes to middle state
#     read in time series data set example using the default border group of "USStatesDF".
####

data(TSdata,envir=environment())  
temprates     <-  data.frame(TSdata[,,2])  

# TSdata structure is array of size c(51,15,4), 
# dimensions = 51 states, 15 years, (year label, point value, low limit, high limit)

panelDesc03   <- data.frame(                    
    type=c("maptail","id","tsconf","dot"),      
    lab1=c("","","Time Series","Female"),  
    lab2=c("","","Annual Rate per 100,000","Most Recent Rate (2010)"),  
    lab3=c("","","Years","Deaths per 100,000"), 
    lab4=c("","","Rate",""),		  
    col1=c(NA,NA,NA,15),        
    panelData =c(NA,NA,"TSdata",NA)
    )
ExTitle       <- c("Ex03-Time Series with Confidence bands",
                    "Annual Female Lung Cancer Mortality Rates, 1996-2010")

pdf(file="Ex03-Time-Series-with-Conf.pdf",width=7.5,height=10)

micromapST(temprates,panelDesc03,sortVar="P15",ascend=FALSE,title=ExTitle)  

dev.off()

# end of example 03


######
#   micromapST - Example 04 - dot followed by a scatter dot columns
#     use same data as Example 3 to compare 1996 & 2010 rates
#     mapmedian option shades states above or below the median (light yellow)
#     using the default border group of "USStatesBG"
#
#   USES data loaded for Example 03 (temprates).
#
####

panelDesc04 <- data.frame(                 
    type=c("mapmedian","id","dot","scatdot"),  
    lab1=c("","","Female Lung Cancer Mortality","Comparison of Rates"),   
    lab2=c("","","Rate in 1996 (Sort Variable)",
                      "in 1996 (x axis) and 2010 (y axis)"),   
    lab3=c("","","Deaths per 100,000","Deaths per 100,000 in 1996"), 
    lab4=c("","","","Rate in 2010"),	
    col1=c(NA,NA,1,1),                 
    col2=c(NA,NA,NA,15)		
    )
ExTitle <- c( "Ex04-Dot Plot for 1996, Scatter Plot Comparing 1996 to 2010",
                    "Female Lung Cancer Mortality Rates")

pdf(file="Ex04-Scatter-Dots.pdf",width=7.5,height=10)
micromapST(temprates,panelDesc04,sortVar=1,ascend=FALSE,title=ExTitle)  

dev.off()

##End Example 04

######
#   micromapST - Example 05 - horizontal stacked (segmented) bars
#     segbar plots the input data, normbar plots percent of total
#     package computes the percents from input data
#     input for the categories for each state must be in consecutive 
#     columns of the input data.frame using the default border group of "USStatesBG"
####

data(statePop2010,envir=environment())

panelDesc05 <- data.frame(                   
    type=c("map","id","segbar","normbar"), 
    lab1=c("","","Stacked Bar","Normalized Stacked Bar"), 
    lab2=c("","","Counts","Percent"),     
    col1=c(NA,NA,"Hisp","Hisp"),                     
    col2=c(NA,NA,"OtherWBH","OtherWBH")		  
    )

pdf(file="Ex05-Stkd-Bar-var-height.pdf",width=7.5,height=10)
micromapST(statePop2010, panelDesc05, sortVar="OtherWBH", ascend=FALSE,
     title=c("Ex05-Stacked Bars: 2010 Census Pop by Race, Sorted by Count Other Race",
             "Cat-L to R: Hispanic, non-Hisp White, Black, Other-sn-varbar"),
     details=list(SNBar.varht=TRUE), axisScale="sn" )  
dev.off()
## End Example 05

######
#
#   micromapST - Example 06 - horizontal stacked (segmented) bars
#     segbar plots the input data, normbar plots percent of total
#     package computes the percents from input data
#     input for the categories for each state must be in consecutive 
#     columns of the input data.frame using the default border group
#     of "USStatesBG".
#
#     Turning off the variable bar height and the midpoint dot features
#     in the horizontal stacked bars (segmented)
#
#  USES data loaded for Example 05 above - statePop2010.
#
####

panelDesc06= data.frame(                   
      type=c("map","id","segbar","normbar"), 
      lab1=c("","","Stacked Bar","Normalized Stacked Bar"), 
      lab2=c("","","Counts","Percent"),     
      col1=c(NA,NA,"Hisp","Hisp"),                     
      col2=c(NA,NA,"OtherWBH","OtherWBH")		  
    )

pdf(file="Ex06-Stkd-Bar-fixedheight-nodot.pdf",width=7.5,height=10)

micromapST(statePop2010,panelDesc06,sortVar=4,ascend=FALSE,
             title=c("Ex7-Stacked Bars: 2010 Census Pop by Race, Sorted by Other Race",
             "Cat-L to R: Hisp, non-Hisp White, Black, Other,ID-diamond"),
             details=list(SNBar.Middle.Dot=FALSE,SNBar.varht=FALSE,Id.Dot.pch=23)
           )  
dev.off()

## End Example 06


######
#   micromapST - Example 07 - centered (diverging) stacked bars
#
#     National 8th grade Math Proficiency NAEP Test Scores Data for 2011
#     source: National Center for Education Statistics, 
#     http://nces.ed.gov/nationsreportcard/naepdata/
#     bar segment values - % in each of 4 categories: 
#           % < Basic, % at Basic, % Proficient, % Advanced
#     using the default border group of "USStatesBG".
####

data(Educ8thData,envir=environment())  

# columns = State abbrev, State name, Avg Score, %s \<basic, 
#           basic, proficient, advanced

panelDesc07 <- data.frame(                 
    type=c("map","id","dot","ctrbar"),
    lab1=c("","","Avg. Scores","Math Proficiency"),         
    lab2=c("","","","<Basic, Basic, Proficient, Advanced"),  
    lab3=c("","","","% to Left of 0           |    % to Right"),  
    col1=c(NA,NA,"avgscore","PctBelowBasic"),col2=c(NA,NA,NA,"PctAdvanced")   
  )
ExTitle <- c("Ex07-Stacked Bars: Educational Progress (NAEP) in Math, 2011, 8th Grade",
             "Centered at Not-Prof vs. Prof")

pdf(file="Ex07-Educ-Centered-Bar.pdf",width=7.5,height=10)

micromapST(Educ8thData,panelDesc07,
             sortVar=3, 
             title=ExTitle)  

dev.off()

### End of example 07

#
#  Example # 08 - Maps Seer Registries using the micromapST function 
#   with the bordGrp = "USSeerBG".  
#

data(Seer18Area,envir=environment())

# set up 4 column page layout

panelDesc08 = data.frame(
  type=c("mapcum","id","dotsignif","arrow")    
  ,lab1=c("","","Rate Trend APC", "Rate Change")  
  ,lab2=c("","","Dot-Signif","2002-06 to 2007-11") 
  ,lab3=c("","","","") 
  ,col1=c(NA,NA,"RateTrendAPC","Rate20022006")
  ,col2=c(NA,NA,"pValue", "Rate20072011")
  ) 

ExTitle       <- c("Ex08 - SeerStat Data - 2002-6 and 2007-11",
                     "Dot with Signif., Arrow and Bar")

pdf(file="Ex08-DotSignificants.pdf",width=7.5,height=10)

micromapST(Seer18Area,panelDesc08,
        sortVar="Rate20022006",ascend=FALSE,
        title=ExTitle,
        rowNames="alias",rowNamesCol='Registry', 
        bordGrp="USSeerBG",
        plotNames="ab")

dev.off()
#
#  Both calls are effectively identical.
#
#### End of examples 08


#####
#   micromapST - Example 09 - A linked micromap of the counties of the state
#      of Kansas using the border group "KansasDF". The KansPopInc data is shown
#      using two dot glypics - current population and average increase per county.
#####

data(KansPopInc,envir=environment())

# set up 4 column page layout

panelDesc09 = data.frame(
  type=c("mapcum","id","dot","dot")    
  ,lab1=c("","","Population", "Average Inc.")  
  ,lab2=c("","","in 2000","per year") 
  ,lab3=c("","","UNITS","") 
  ,col1=c(NA,NA,"Pop","AvgInc")
  ) 

ExTitle       <- c("Ex09 - Kansas Pop data 8.5x14",
                     "Current Pop and Average Inc-scaling=sn")

pdf(file="Ex09-Kansas Population and Inc-8.5x14-sn.pdf",width=7.5,height=13)  
               # legal size page (8.5 x 14) to handle 105 counties.
               
#  use scaling "sn" to clean up x-axis labels.

micromapST(KansPopInc,panelDesc09,
        sortVar=c("AvgInc","Pop"),ascend=FALSE,
        title=ExTitle, 
        axisScale="sn",
        rowNames="full",rowNamesCol='County',
        bordGrp="KansasBG",
        plotNames="ab")

dev.off()        

#
##### Example # 09

#####
#
#  Example # 10 - Counties in Kansas on an 11 x 17 page
#

# set up 4 column page layout

panelDesc10 = data.frame(
  type=c("map","id","dot",        "dot")    
  ,lab1=c("",     "",  "Population", "Average Inc.")  
  ,lab2=c("",     "",  "in 2000",    "per year") 
  ,lab3=c("",     "",  "People",     "") 
  ,col1=c(NA,     NA,  "Pop",        "AvgInc")
  ) 

ExTitle       <- c("Ex10 - Kansas Pop data 11x17",
                     "Current Pop and Average Inc - scaling=e")

pdf(file="Ex10-Kansas Population and Inc-11x17.pdf", width=10, height=16)  
          # tabloid size page (11x17) to handle 105 counties.

#  Use default scaling = "e" and no staggered labels, 
#  Use full county names for data to boundary matching, 
#  but presented abbreviated county names 
#  in "id" glyphic column with large page.

micromapST(KansPopInc, panelDesc10, 
        sortVar=c("AvgInc","Pop"), ascend=FALSE, 
        title=ExTitle,
        rowNames="full", rowNamesCol='County',
        bordGrp="KansasBG",
        plotNames="ab")

dev.off()        
#
#
#### end of # Ex 10


#####
#
#   micromapST - Example 11 - A linked micromap of the counties of the state
#      of New York state using the border group "NewYorkDF". 
#      The pop/inc data is shown using two dot glyphs, an arrow and bar glyph
#      (2010 Population, an arrow showing the change in population from 2000 to 2010, 
#      Population in 2000, and a bar showing the amount of the change.)
#      
#####

data(nyPopData,envir=environment())

nyPopData$Dif00_10 <- nyPopData$Pop_2010 - nyPopData$Pop_2000

# set up 6 column page layout with colSize

panelDesc11 <- data.frame(
  type=c("map","id","dot",           "arrow",        "dot",     "bar")    
  ,lab1=c("",  "",  "Population in", "Increase from","Pop 2005","Incre")  
  ,lab2=c("",  "",  "2010",          "2000",         "",        "2000to2010") 
  ,lab3=c("",  "",  "",              "",             "",        "") 
  ,col1=c(NA,  NA,  "Pop_2010",      "Pop_2000",     "Pop_2000","Dif00_10")
  ,col2=c(NA,  NA,  "",              "Pop_2010",     "",        "")
  ,colSize=c(NA,NA, 15,              20,             5,        20)
  ) 

ExTitle       <- c("Ex11 - New York Population data",
                     "2010 Pop and since 2000-colSize,sn,stag")

pdf(file="Ex11-New York Pop 2010 and Change-sn colSize.pdf", 
     width=7.5, height=10.5) 

micromapST(nyPopData, panelDesc11, 
        sortVar="Pop_2000", ascend=FALSE,
        title=ExTitle,
        rowNames="full",rowNamesCol="Area", 
        axisScale="sn", staggerLab=TRUE,
        bordGrp="NewYorkBG"
      )

dev.off()        
#
#
#### End of Examples 11


#####
#   micromapST - Example 12 - A linked micromap of the counties of 
#      the state of Maryland using the border group "MarylandBG". 
#      The MarylandPopInc data is shown using two dot glypics - current 
#       population and average increase per county.
#      A "maptail" state map is used to show the counties in relationship
#      to the median county as sorted by the 1970 population.
#####

data(mdPopData,envir=environment())

# set up 5 column page layout

panelDesc12 = data.frame(
  type=c("maptail","id","dot","dot","arrow")    
  ,lab1=c("","","Population", "Population","Change")  
  ,lab2=c("","","in 1970","in 2000", "from 1970 to 2000") 
  ,lab3=c("","","","","") 
  ,col1=c(NA,NA,"X1970","X2010","X1970")
  ,col2=c(NA,NA,"","","X2010")
 ) 

ExTitle       <- c("Ex12 - Maryland Population-map",
                      "1970 and 2010 Pop and Change,stag,sn")

pdf(file="Ex12-MD Pop 1970 and 2010 plus change-map.pdf", width=7.5, height=10.5) 

micromapST(mdPopData, panelDesc12, 
        sortVar=2, ascend=FALSE, 
        title=ExTitle,
        rowNames="full", rowNamesCol='County',
        bordGrp="MarylandBG", 
        axisScale="sn", staggerLab=TRUE,
        plotNames="ab")

dev.off()        
#
#
#### End of Example 12

#####
#   micromapST - Example 13 - A linked micromap of the provinces, municipalities,
#      autonomous regions and special administrative regions of China using the 
#      border group of "ChinaDF". The ChinaPopInc data is shown
#      using two dot glypics - current population and average increase per area.
#####

data(cnPopData,envir=environment())

# set up 4 column page layout

panelDesc13 = data.frame(
  type=c("map","id","dot","bar")    
  ,lab1=c("","","Population", "Population")  
  ,lab2=c("","","in 2013","in 2013") 
  ,lab3=c("","","","") 
  ,col1=c(NA,NA,"pop2013","pop2013")
  ) 

ExTitle       <- c("Ex13 - China Population",
                     "in 2013 by area")

pdf(file="Ex13-China 2013 Population.pdf", width=7.5, height=10.5) 

micromapST(cnPopData, panelDesc13, 
        sortVar="pop2013", ascend=FALSE, 
        title=ExTitle,
        rowNames="full", rowNamesCol='area',
        bordGrp="ChinaBG",
        plotNames="full")

dev.off()        
#
#
#### End of Example 13


#####
#   micromapST - Example 14 - A linked micromap of the districts 
#      of the city Seoul South Korea, using the border group of 
#      "SeoulSKoreaBG". The included SeoulPopData dataset provides 
#      population and district area statistics for 2012.  
#      The micromapST generates two glyphics, a sorted dot
#      glyphic based on the population and a bar graph based on the area.
#####

data(SeoulPopData,envir=environment())

# set up 4 column page layout

panelDesc14 = data.frame(
  type=c("map","id","dot","bar")    
  ,lab1=c("","","Population", "Area")  
  ,lab2=c("","","in 2012","in 2012") 
  ,lab3=c("","","","sqkm") 
  ,col1=c(NA,NA,"Pop.2012","Area")
  ) 

ExTitle       <- c("Ex14 - Seoul Population",
                     "in 2012 by district")

pdf(file="Ex14-Seoul 2012 Population.pdf", width=7.5, height=10.5) 

micromapST(SeoulPopData,panelDesc14,
        sortVar=3, ascend=FALSE,               # sort based on the population
        title=ExTitle,
        rowNames="full", rowNamesCol='District',
        bordGrp="SeoulSKoreaBG",
        plotNames="full"
      )

dev.off()        
#
#
#### End of Example 14

#####
#   micromapST - Example 15 - A linked micromap of the counties in the 
#      state of Utah.  The UtahPopData data is shown using two dot glypics
#      - current population and average increase per area.
#####

data(UtahPopData,envir=environment())

#
#  Get population differences from 2011 to 2001 and 1991.
#   Data contains ",".  The comma's must be removed and values are 
#     converted to numbers.
#   If data is factors, need to add "as.character()" function 
#     to the formula below.

UtahPopData2 <- as.data.frame(sapply(UtahPopData, 
                        function(x) gsub(",","",x)),stringsAsFactors=FALSE)

UtahPopData2$Del1101 <- as.numeric(UtahPopData2$X2011) - as.numeric(UtahPopData2$X2001)
UtahPopData2$Del0191 <- as.numeric(UtahPopData2$X2001) - as.numeric(UtahPopData2$X1991)


# set up 5 column page layout

panelDesc15 = data.frame(
  type=c("map","id","dot","arrow","arrow")    
  ,lab1=c("","","Population", "2001-2011","Chg 1991-2001")  
  ,lab2=c("","","in 2011","pop change","pop change") 
  ,lab3=c("","","","","") 
  ,col1=c(NA,NA,"X2011","X2011","X2001")
  ,col2=c(NA,NA,NA,"X2001","X1991")
  ) 

ExTitle       <- c("Ex15 - Utah county population 2011",
                     " and changes last two decades,sn")

pdf(file="Ex15-Utah Population.pdf",width=7.5,height=10.5) 

micromapST(UtahPopData, panelDesc15, 
        sortVar="X2011", ascend=FALSE,
        title=ExTitle,
        rowNames="full",rowNamesCol='County', 
        axisScale="sn",
        bordGrp="UtahBG",
        plotNames="ab"
      )

dev.off()        
#
#
#### End of Example 15

####
#
#  Example 16 - use of state.x77 data table as data source
#     Data does not contain a row for DC, a missing sub-area.
#     Example also uses a smaller then 7.5 x 10 graphic space.
#

data(state,envir=environment())

stateData <- as.data.frame(state.x77)

rownames(stateData) <- state.abb

panelDesc16 <- data.frame(type = c("maptail", "id", "dot"),
                        lab1 = c("", "", "Murder"),
                        lab3 = c("", "", "Murders per 100K Population"),
                        col1 = c(NA, NA, 5))

ExTitle <- c("Ex16 - LM Plot of Murders in the United States",
                      "No DC row entry.")

pdf(file = "Ex16_state.x77_no_DC.pdf", width = 5, height = 9) 

micromapST(stateData, panelDesc16, 
           sortVar = 5, ascend = FALSE,
           title = ExTitle)

dev.off()

#
#  Example 17 - US state map based on data from state.x77 table with
#     DC row added to complete data.frame, but with missing values (NAs).
#     The DC row will be sorted to the bottom of the list size 
#     it does not contain any data.
#
#   Used data and the panelDesc data.frames (stateData and panelDesc16) used
#   in example 16.
#

# add DC as 51st state with missing data "NA" to stateData.  

stateData <- rbind(stateData, DC = rep(NA, 8))   
                  # missing values for DC row.

ExTitle <- c("Ex17 - LM Plot of Murders in the United States",
                  "DC row added with NA, decending.")

pdf(file = "Ex17_state.x77_DCasNA_D.pdf", width = 5, height = 9) 

micromapST(stateData, panelDesc16, 
           sortVar = 5, ascend = FALSE,
           title = ExTitle)

dev.off()

#
#
##### end of example # 17

####
#
#  Example 18 - use of Africa population data as data source
#      Demonstrates support for vertical oriented geographical areas.
#

data(AfricaPopData,envir=environment())

panelDesc18 <- data.frame(type = c("map", "id", "dot",      "dot",          "dot"),
                           lab1 = c("",      "","Population","Percentage Of","Est x2 Time"),
                           lab3 = c("",      "","People",    "Total",        "Years"),
                           col1 = c(NA,      NA,"Projection","PercOf",       "Est2Time"))


pdf(file = "Ex18_Africa Micromap-11x17.pdf", width = 11, height = 17) 

ExTitle <- c("Ex18-Africa Population Data",
               "Sorted by Population on 11x17")

micromapST(AfricaPopData, panelDesc18, 
           sortVar = "Projection", ascend = TRUE,
           title = ExTitle, 
           rowNames = "ab", rowNamesCol = "Abbr",
           bordGrp = "AfricaBG" )

dev.off()

#
#
##### End of Example 18






