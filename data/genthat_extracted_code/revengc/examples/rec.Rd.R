library(revengc)


### Name: rec
### Title: Reverse engineering censored and decoupled data
### Aliases: rec
### Keywords: Poisson negative binomial univariate table frequency table
###   count data censored dispersion truncated contingency

### ** Examples

  # provide two averages
  # seed.matrix defaults to a matrix of ones
  # seed.estimation.method defaults to ipfp
  twoaverages.results<-rec(
     X= 4.4,
     Y = 571.3,
     Xlowerbound = 1,
     Xupperbound = 20,
     Ylowerbound = 520,
     Yupperbound = 620)
  
  
  # provide one average and one table
  # create a censored univariate table
  # seed.matrix defaults to a matrix of ones
  # seed.estimation.method defaults to ipfp
  Y.table = cbind(as.character(c("<7", "7-12", "13-19", ">19")), 
    c(11800,57100,14800,3900))
  combo.results<-rec(X= 2.3,
     Y = Y.table,
     Xlowerbound = 1,
     Xupperbound = 15,
     Ylowerbound = 1,
     Yupperbound = 30)
   
   
  # provide a censored contingency table 
  contingencytable<-matrix(c(6185,9797,16809,11126,6156,3637,908,147,69,4,
                         5408,12748,26506,21486,14018,9165,2658,567,196,78,
                         7403,20444,44370,36285,23576,15750,4715,994,364,136,
                         4793,17376,44065,40751,28900,20404,6557,1296,555,228,
                         2354,11143,32837,33910,26203,19301,6835,1438,618,245,
                         1060,6038,19256,21298,17774,13864,4656,1039,430,178,
                         273,2521,9110,11188,9626,7433,2608,578,196,112,
                         119,1130,4183,5566,5053,3938,1367,318,119,66,
                         33,388,1707,2367,2328,1972,719,171,68,37,
                         38,178,1047,1672,1740,1666,757,193,158,164),
                           nrow=10,ncol=10, byrow=TRUE)
  rowmarginal<-apply(contingencytable,1,sum)
  contingencytable<-cbind(contingencytable, rowmarginal)
  colmarginal<-apply(contingencytable,2,sum)
  contingencytable<-rbind(contingencytable, colmarginal)
  row.names(contingencytable)[row.names(contingencytable)=="colmarginal"]<-""
  contingencytable<-data.frame(c("1","2","3","4","5","6", "7", "8","9","10+", NA),
    contingencytable)
  colnames(contingencytable)<-c(NA,"<20","20-29","30-39","40-49","50-69","70-99",
                                "100-149","150-199","200-299","300+", NA)

  # the contingencytable input could be put in X or Y (opposing argument = NULL)
  # X = rows and Y = columns 
  # seed.matrix default = repeating the cross tabulations in the censored contingency
  ## table for the newly created and compatible uncensored cross tabulations
  # seed.estimation.method defaults to ipfp
  contingencytable.results<-rec(
     X= contingencytable,
     Xlowerbound = 1,
     Xupperbound = 15,
     Ylowerbound = 10,
     Yupperbound = 310)



