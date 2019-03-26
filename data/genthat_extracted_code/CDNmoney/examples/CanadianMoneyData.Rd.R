library(CDNmoney)


### Name: CanadianMoneyData
### Title: Continuity Adjusted Component Data for Canadian Monetary
###   Aggregates
### Aliases: CanadianMoneyData CanadianMoneyData.asof.6Mar2009
###   CanadianMoneyData.asof.5Jun2007 CanadianMoneyData.asof.3Mar2006
###   CanadianMoneyData.asof.28Jan2005 CanadianMoneyData.asof.6Feb2004
###   CanadianMoneyData.asof.26Aug2002 MB2001 MB486 MB487p MB452 MB453
###   MB454 MB472 NonbankCheq MB473 NonbankNonCheq NonbankTerm MB2046
###   MB2047 MB2048 MB2057 MB2058 MB475 MB482 M1p M1total M1real
###   M1PerCapita M1pReal M1pPerCapita currencyReal currencyPerCapita float
###   TMLinterbank MB452adj MB473adj CUadj MV37173 MV41552775p MV41552775
###   MV41552777p MV36818 MV36823 MV41552777 MV36828 MV37243 MV37244
###   MV37245 MV37255 MV37256 MV36830 MV36876 adjM1p adjM1pp NetNonbankCheq
###   V37173 V37243 V37245 V37255 V37256
### Keywords: datasets

### ** Examples

 require("tframe")
 require("tfplot")
########### Calculations to get new monetary aggregates ######
 data("CanadianMoneyData", package="CDNmoney")

M1p  <- tframed(V37173 + MV41552775 + MV41552777 + NetNonbankCheq + adjM1p, 
                names="M1+ (V37258)")

M1pp <-  tframed(CUadj + M1p   + MV36818 + MV36828 + adjM1pp + NonbankNonCheq, 
                 names="gross M1++ (V37259)")

M2   <-  tframed(V37173 + MV41552775  + MV41552777 + MV36818 + MV36828 + MV36823, 
                 names="gross M2 (V41552786)")

M2p  <-  tframed(M2    + NetNonbankCheq + NonbankNonCheq + NonbankTerm +
                          + V37243 + MV37244 + V37245, names="gross M2+ (V41552788)")

M2pp <-  tframed(M2p   + V37255 + V37256, names="gross M2++ (V41552790)")

M3   <-  tframed(M2    + MV36830 + MV36876, names="gross M3 (V41552785)")

######### Plot aggregates #####
 tfplot(tbind(currencyPerCapita, currencyReal))
 tfplot(tbind(M1p, M1pp))
 tfplot(tbind(M2, M2p, M2pp))
 tfplot(M3)

########### Calculations to get old monetary aggregates ######
 data("CanadianMoneyData.asof.3Mar2006", package="CDNmoney")

 #M1gross <-  tframed(MB2001 + MB486 + MB487p + TMLinterbank, names="gross M1 (B2054)")
 M1p     <-  tframed(MB2001 + MB486 + MB487p + MB452 + MB452adj + MB472
   + NonbankCheq, names="M1+ (B2060)")
 M1pp    <-  tframed(CUadj + M1p   + MB453 + MB473 + MB473adj + NonbankNonCheq,
    names="M1++ (B2061)")
 M2      <-  tframed(M1total + MB472 + MB473 + MB452 + MB453 + MB454, names="M2 (B2031)")
 M2p     <-  tframed(M2    + NonbankCheq + NonbankNonCheq + NonbankTerm  
                           + MB2046 + MB2047 + MB2048, names="M2+ (B2037)")
 M2pp    <-  tframed(M2p   + MB2057 + MB2058, names="M2++ (B2059)")
 M3      <-  tframed(M2    + MB475  + MB482, names="M3 (B2030)")

######### Calculations of cpi and pop ######

 #  M1real = M1total * 100/p100000  (CPI - p20 Bank of Canada Weekly Financial
 #	 Statistics, June 1992=100)
 #  M1PerCapita = M1total * 100 /(pop * p100000) # using a quarterly population
 #       series converted to monthly using spline.
 
 # Since M1 was discontinued, this was change to use currency, which is longer.
 # cpi <- 100 * M1total / M1real
 # seriesNames(cpi) <- "CPI"
 
 # popm <- M1total / M1PerCapita
 # seriesNames(popm) <- "Population of Canada"

 # cpi <- 100 * M1p / M1pReal
 # seriesNames(cpi) <- "CPI"

 cpi <- 100 * V37173 / currencyReal
 seriesNames(cpi) <- "CPI"
 
 # popm <- M1p / M1pPerCapita
 # seriesNames(popm) <- "Population of Canada"
 
 popm <- V37173 / currencyPerCapita
 seriesNames(popm) <- "Population of Canada"

######### Plot aggregates #####

 #tfplot(tbind(M1total, M1gross, M1p, M1pp))
 tfplot(tbind(M1p, M1pp))
 tfplot(tbind(M2, M2p, M2pp))
 tfplot(M3)

#### Calculations to get components as used in Gilbert and Pichette ####
 data("CanadianMoneyData.asof.3Mar2006", package="CDNmoney")

z <-tfwindow(tframed(tbind(
     MB2001,
     MB486 + MB452 ,
     NonbankCheq,
     MB472 + MB473 + MB487p,
     MB475,
     NonbankNonCheq + MB454 + NonbankTerm + MB2046 + MB2047 + MB2048 + 
            MB2057 + MB2058 + MB482 + MB453),
     names=c("currency", "personal cheq.", "NonbankCheq", 
             "N-P demand & notice", "N-P term", "Investment")
   ), start=c(1986,1), end=c(2002,4))

MBcomponents <- 1e8 * z /matrix(tfwindow(popm * cpi, start=c(1986,1),
                               end=c(2002,4)),196, 6)
# 1e8 * gives real $ per person
#(MB numbers in millions, CPI in fraction*100, popm in persons.)

tfplot(MBcomponents, graphs.per.page=3)



