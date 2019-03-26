library(BIFIEsurvey)


### Name: BIFIE.univar.test
### Title: Analysis of Variance and Effect Sizes for Univariate Statistics
### Aliases: BIFIE.univar.test summary.BIFIE.univar.test
### Keywords: Descriptive statistics summary

### ** Examples

#############################################################################
# EXAMPLE 1: Imputed TIMSS dataset - One grouping variable
#############################################################################

data(data.timss1)
data(data.timssrep)

# create BIFIE.dat object
bdat <- BIFIEsurvey::BIFIE.data( data.list=data.timss1, wgt=data.timss1[[1]]$TOTWGT,
           wgtrep=data.timssrep[, -1 ] )

#**** Model 1: 3 variables splitted by book
res1 <- BIFIEsurvey::BIFIE.univar( bdat, vars=c("ASMMAT", "ASSSCI","scsci"),
                    group="books")
summary(res1)
# analysis of variance
tres1 <- BIFIEsurvey::BIFIE.univar.test(res1)
summary(tres1)

#**** Model 2: One variable splitted by gender
res2 <- BIFIEsurvey::BIFIE.univar( bdat, vars=c("ASMMAT"), group="female" )
summary(res2)
# analysis of variance
tres2 <- BIFIEsurvey::BIFIE.univar.test(res2)
summary(tres2)

## Not run: 
##D #**** Model 3: Univariate statistic: math
##D res3 <- BIFIEsurvey::BIFIE.univar( bdat, vars=c("ASMMAT") )
##D summary(res3)
##D tres3 <- BIFIEsurvey::BIFIE.univar.test(res3)
##D 
##D #############################################################################
##D # EXAMPLE 2: Imputed TIMSS dataset - Two grouping variables
##D #############################################################################
##D 
##D data(data.timss1)
##D data(data.timssrep)
##D 
##D # create BIFIE.dat object
##D bdat <- BIFIEsurvey::BIFIE.data( data.list=data.timss1, wgt=data.timss1[[1]]$TOTWGT,
##D                   wgtrep=data.timssrep[, -1 ] )
##D 
##D #**** Model 1: 3 variables splitted by book and female
##D res1 <- BIFIEsurvey::BIFIE.univar(bdat, vars=c("ASMMAT", "ASSSCI","scsci"),
##D                   group=c("books","female"))
##D summary(res1)
##D 
##D # analysis of variance
##D tres1 <- BIFIEsurvey::BIFIE.univar.test(res1)
##D summary(tres1)
##D 
##D # extract data frame with Cohens d statistic
##D dstat <- tres1$stat.dstat
##D 
##D # extract d values for gender comparisons with same value of books
##D # -> 'books' refers to the first variable
##D ind <- which(
##D   unlist( lapply( strsplit( dstat$groupval1, "#"), FUN=function(vv){vv[1]}) )==
##D   unlist( lapply( strsplit( dstat$groupval2, "#"), FUN=function(vv){vv[1]}) )
##D         )
##D dstat[ ind, ]
## End(Not run)



