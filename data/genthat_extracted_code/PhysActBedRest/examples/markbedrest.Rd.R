library(PhysActBedRest)


### Name: markbedrest
### Title: Bedrest Marking, Universal
### Aliases: markbedrest

### ** Examples

data(zPhysActBedRest)


##  Example 1:  
## Not run: wr_ad_lb1499_ts = read.csv("wr_ad_lb1499_ts.csv")
    wr_ad_lb1499_slp = markbedrest(wr_ad_lb1499_ts, age="ad", loc="wr"
    , EC=FALSE)

##	Example 2:  
##  Create a folder in the working director called "marked" 
##  wa_ps_V811043 = read.csv("wa_ps_V811043_Count.csv")
##  tstmp <- chron(date = as.character(wa_ps_V811043$Date), 
##  time = wa_ps_V811043$Time, format = c("m/d/y", "h:m:s"))  
##  wa_ps_V811043_ts = data.frame(tstmp, wa_ps_V811043)

    wa_ps_V811043_slp = markbedrest(wa_ps_V811043_ts,
    TS = "tstmp",
    cts = "Counts",
##  rstdr = "marked",
    rstfl = "wa_ps_V811043_sum",
    TH = 30,
    wd = 50,
    nvm = 10,
    per = 60,    
    nmin = 60,
    nmax = 480)



