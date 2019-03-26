
test_hypergeom.test <- function(){

    createTestMessage <- function( table, alt, pm=NULL, misc=NULL ){ 
        paste0( "Test case: ", table, ", Alternative: ", alt, ifelse( is.null(pm), paste0(", pval.method=", pm), "" ), ifelse( is.null(misc), paste0(", and ", misc), "" ) ) 
    }
    
    checkSpeed <- function( speed.ht, speed.ft, msg=NULL ){ 
        d <- speed.ht["elapsed"] - speed.ft["elapsed"] 
        if( d < 0 ){ cat(msg, " 'hypergeom.test' faster than 'fisher.test'(",d,")\n"); }
        else{ cat(msg, "NO GAIN OF SPEED (",d,")\n") }
    }
    
    NAME_PVALUE_HYPERGEOMTEST_LITERATURE <- "hyp"
    NAME_PROBABILITY_OF_OBSERVED_TABLE <- "poot"

    zelterman2006models_Table1.1 <- function(){
        ##########
        ## example from Zelterman (2006), Table 1.1, p. 12 (same as Table 2.4, p. 31)
        ##########

        LST <- list()
        dmn <- list(Tumor=c('y', 'n'), Exposition=c('y', 'n'))
        CT <- matrix(c(4,12,5,74), nrow=2, dimnames=dmn)
        LST[['ct']] <- CT
        LST[["chisq"]] <- pchisq(c(4.267360, 5.408285), df=1, lower.tail=FALSE) #p-value=c(0.039, 0.02)
        LST[[NAME_PVALUE_HYPERGEOMTEST_LITERATURE]] <- c( less=0.9938, greater=0.0411, two.sided=0.0411 ) # zelterman2006models, p. 24    
        LST[[NAME_PROBABILITY_OF_OBSERVED_TABLE]] <- -1

    return(LST)    
    }
    zelterman2006models_Table1.2 <- function(){
        ##########
        ## example from Zelterman (2006), Table 1.2, p. 13
        ##########

        LST <- list()
        dmn <- list(A=c('F', 'U'), B=c('F', 'U'), C=c('F', 'U'))
        CT <- array(c(6,16,2,4,2,4,6,6), dim=c(2,2,2), dimnames=dmn)
        LST[['ct']] <- CT
        loglin(CT, margin=list(1,2))
        LST[[NAME_PVALUE_HYPERGEOMTEST_LITERATURE]] <- c( both=0.0253 ) # zelterman2006models, p. 44    
        LST[[NAME_PROBABILITY_OF_OBSERVED_TABLE]] <- 3.88E-5
        
    return(LST)    
    }
    # zelterman2006_Table1.3 <- function(){
    # 	##########
    # 	## example from Zelterman (2006), Table 1.3, p. 14
    # 	##########
    # 
    # 	LST <- list()
    #     dmn <- list(A=c('F', 'U'), B=c('F', 'U'), C=c('F', 'U'))
    #     CT <- array(c(6,16,2,4,2,4,6,6), dim=c(2,2,2), dimnames=dmn)
    #     LST[['CT']] <- CT
    #     loglin(CT, margin=list(1,2))
    #     LST[["chisq"]] <- pchisq(c(4.267360, 5.408285), df=1, lower.tail=FALSE) #p-value=c(0.039, 0.02)
    # return(LST)    
    # }
    zelterman2006models_AppendixB <- function(){
        ##########
        ## example from Zelterman (2006), Appendix B, p. 266
        ##########

        LST <- list()
        dmn <- list(A=c('F', 'U'), B=c('F', 'U'), C=c('F', 'U'))
        CT <- array(c(13, 16,12,6,15,9,10,8), dim=c(2,2,2), dimnames=dmn)
        LST[['ct']] <- CT
        loglin(CT, margin=list(1,2))
        LST[[NAME_PVALUE_HYPERGEOMTEST_LITERATURE]] <- c( both=0.5923 ) # zelterman2006models, p. 266    
        LST[[NAME_PROBABILITY_OF_OBSERVED_TABLE]] <- 0.421661E-03
        
    return(LST)    
    }
    agresti1992exact_Table1 <- function(){
        ##########
        ## example from Agresti (1992), Table 1
        ## Fisher's tea tasting experiment
        # Chi-squared based tests are underestimating p-value
        ##########

        LST <- list()
        dmn <- list('Malformation'=c('a', 'p'), Alcohol=c('0', '1', '2', '3', '6'))
        CT <- matrix(c(17066, 14464, 788, 126, 37, 48,38,5,1,1), nrow=2, byrow=TRUE, dimnames=dmn)
        LST[['ct']] <- CT
        out.ll <- loglin(CT, margin=list(1,2))
        LST[["chisq"]] <- pchisq(c(out.ll[[1]], out.ll[[2]]), df=1, lower.tail=FALSE) #pvalue=0.15
        LST[[NAME_PVALUE_HYPERGEOMTEST_LITERATURE]] <- c(two.sided=0.0333); #the original P-value is given as c(two.sided=0.034), but never reproduced
    return(LST)
    }
    
    agresti1992exact_Table2 <- function(){
        ##########
        ## example from Agresti (1992), Table 2, p. 135(6)
        ## Fisher's tea tasting experiment
        # Chi-squared based tests are underestimating p-value
        ##########

        LST <- list()
        dmn <- list('poured first'=c('m', 't'), guess=c('m', 't'))
        CT <- matrix(c(3,1,1,3), nrow=2, dimnames=dmn)
        LST[["ct"]] <- CT
        out.ll <- loglin(CT, margin=list(1,2))
        LST[["chisq"]] <- pchisq(c(out.ll[[1]], out.ll[[2]]), df=1, lower.tail=FALSE) #pvalue=0.15
        LST[[NAME_PVALUE_HYPERGEOMTEST_LITERATURE]] <- c(greater=0.24286) # https://brainder.org/2015/08/23/the-lady-tasting-tea-and-fishers-exact-test/
    return(LST)
    }

#     agresti1992exact_Table4 <- function(){
#         ##########
#         ## example from Agresti (1992), Table 4, p. 139(10)
#         ##########
# 
#         LST <- list()
#         dmn <- list('race'=c('b', 'w'), prom=c('J', 't'))
#         CT <- matrix(c(3,1,1,3), nrow=2, dimnames=dmn)
#         LST[["ct"]] <- CT
#         out.ll <- loglin(CT, margin=list(1,2))
#         LST[["chisq"]] <- pchisq(c(out.ll[[1]], out.ll[[2]]), df=1, lower.tail=FALSE) #pvalue=0.15
#         LST[["fisheR"]] <- fisher.test(CT)
#         LST[[NAME_PVALUE_HYPERGEOMTEST_LITERATURE]] <- 0
#     return(LST)
#     }

    
    halperin1977 <- function(){
        ##########
        ## example from Halperin (1977), Table 1, Example A
        ## toy example
        ## hier kommen andere Werte raus als bei Halperin (???)
        ##########
        LST <- list()

        CT <- array(c(200, 10, 30, 40, 10, 10, 30, 800), dim=c(2,2,2), dimnames=list(A=c('0', '1'), B=c('0', '1'), C=c('0', '1')))
        LST[["CT"]] <- CT
    return(LST)
    }


    
    
    if( require(RUnit) ){
    
        cat("\n")
    
        TAB <- "zelterman2006models_Table1.1";
        .aux <- do.call(TAB, list())
        for(ALT in names(.aux[[NAME_PVALUE_HYPERGEOMTEST_LITERATURE]])){
            for( PM in c("fisheR", "minimum.likelihood") ){
                .res <- hypergeom.test( .aux[["ct"]], alternative=ALT, pval.method=PM )
                checkEqualsNumeric( round(.res$p.value, 4), .aux[[NAME_PVALUE_HYPERGEOMTEST_LITERATURE]][ALT], msg=paste( TAB, ALT, PM, NULL ) )
            }
            speed.ht <- system.time({ .res <- hypergeom.test( .aux[["ct"]], alternative=ALT, pval.method="fisheR" ) })
            speed.ft <- system.time({ .ft <- fisher.test( .aux[["ct"]], alternative=ALT ) })
            checkEqualsNumeric( .res$p.value, .ft$p.value, msg=paste( TAB, ALT, "compare to 'fisher.test'" ) )
            checkSpeed( speed.ht, speed.ft )
         }
  
        
        
#         TAB <- "zelterman2006models_Table1.2";
#         .aux <- do.call(TAB, list())
#         CT <- apply(.aux[['ct']], 1:3, as.integer)
#         margins <- hypergea::getMargins( CT )
#         prob.obs <- hypergea:::.getProbObs( margins, CT, N=as.integer(sum(CT)), dm=as.integer(dim(CT)) )
#     # 	print(CT)
#     # 	print(prob.obs)
#         checkEqualsNumeric( round(prob.obs, 7), .aux[[NAME_PROBABILITY_OF_OBSERVED_TABLE]], msg=paste( TAB, "", NULL, NULL ) )
#         
#         counts <- hypergea:::.getNumberOfTables( x=CT, nthreads=2 )
#         print(counts)
#        prob <- hypergea:::.getProbabilities( x=CT, nthreads=2 )
#         print(prob)
# 
#         for(ALT in names(.aux[[NAME_PVALUE_HYPERGEOMTEST_LITERATURE]])){
#             for( PM in c("minimum.likelihood") ){
#                 .res <- hypergeom.test( .aux[["ct"]], alternative=ALT, pval.method=PM )
#                 print(.res)
#                 checkEqualsNumeric( round(.res$p.value, 4), .aux[[NAME_PVALUE_HYPERGEOMTEST_LITERATURE]][ALT], msg=paste( TAB, ALT, PM, NULL ) )
#             }
#         }
        
        
        
        TAB <- "zelterman2006models_AppendixB";
        .aux <- do.call(TAB, list())
        CT <- apply(.aux[['ct']], 1:3, as.integer)
        margins <- hypergea::getMargins( CT )
        prob.obs <- hypergea:::.getProbObs( margins, CT, N=as.integer(sum(CT)), dm=as.integer(dim(CT)) )
 #    	print(CT); print(prob.obs)
        checkEqualsNumeric( round(prob.obs, 9), .aux[[NAME_PROBABILITY_OF_OBSERVED_TABLE]], msg=paste( TAB, "", NULL, NULL ) )
        
        counts <- hypergea:::.getNumberOfTables( x=CT, nthreads=2 ); prob <- hypergea:::.getProbabilities( x=CT, nthreads=2 )
#        print(counts); print(prob, digits=22)
        for(ALT in names(.aux[[NAME_PVALUE_HYPERGEOMTEST_LITERATURE]])){
            for( PM in c("fisheR", "minimum.likelihood") ){
                .res <- hypergeom.test( .aux[["ct"]], alternative=ALT, pval.method=PM )
                checkEqualsNumeric( round(.res$p.value, 4), .aux[[NAME_PVALUE_HYPERGEOMTEST_LITERATURE]][ALT], msg=paste( TAB, ALT, PM, NULL ) )
            }
        }

        
#         TAB <- "agresti1992exact_Table1";
#         .aux <- do.call(TAB, list())
#         CT <- apply(.aux[['ct']], 1:2, as.integer)
#         margins <- hypergea::getMargins( CT )
#         prob.obs <- hypergea:::.getProbObs( margins, CT, N=as.integer(sum(CT)), dm=as.integer(dim(CT)) )
#     	print(CT); print(prob.obs)
# #         checkEqualsNumeric( round(prob.obs, 9), .aux[[NAME_PROBABILITY_OF_OBSERVED_TABLE]], msg=paste( TAB, "", NULL, NULL ) )
#         
#         counts <- hypergea:::.getNumberOfTables( x=CT, nthreads=1 ); prob <- hypergea:::.getProbabilities( x=CT, nthreads=1 )
#          print(counts); print(prob, digits=22)
#         for(ALT in names(.aux[[NAME_PVALUE_HYPERGEOMTEST_LITERATURE]])){
#             for( PM in c("minimum.likelihood") ){
#                 .res <- hypergeom.test( .aux[["ct"]], alternative=ALT, pval.method=PM )
#                 checkEqualsNumeric( round(.res$p.value, 4), .aux[[NAME_PVALUE_HYPERGEOMTEST_LITERATURE]][ALT], msg=paste( TAB, ALT, PM, NULL ) )
#             }
#             MSG <- paste( TAB, ALT, "compare to 'fisher.test'" )
#             speed.ht <- system.time({ .res <- hypergeom.test( .aux[["ct"]], alternative=ALT, pval.method="fisheR" ) })
#             speed.ft <- system.time({ .ft <- fisher.test( .aux[["ct"]], alternative=ALT ) })
#             print(.ft)
#             checkEqualsNumeric( .res$p.value, .ft$p.value, msg=MSG )
#             checkSpeed( speed.ht, speed.ft, MSG )
#         }
## ---> slightly different P-value (delta=0.002), fisheR not implemented yet

        
        TAB <- "agresti1992exact_Table2";
        .aux <- do.call(TAB, list())
         CT <- apply(.aux[['ct']], 1:2, as.integer)
#       counts <- hypergea:::.getNumberOfTables( x=CT, nthreads=1 ); prob <- hypergea:::.getProbabilities( x=CT, nthreads=1 )
#        print(counts); print(prob, digits=22)
        for(ALT in names(.aux[[NAME_PVALUE_HYPERGEOMTEST_LITERATURE]])){
            for( PM in c("minimum.likelihood") ){
                .res <- hypergeom.test( .aux[["ct"]], alternative=ALT, pval.method=PM )
                checkEqualsNumeric( round(.res$p.value, 5), .aux[[NAME_PVALUE_HYPERGEOMTEST_LITERATURE]][ALT], msg=paste( TAB, ALT, PM, NULL ) )
            }
            MSG <- paste( TAB, ALT, "compare to 'fisher.test'" )
            speed.ht <- system.time({ .res <- hypergeom.test( .aux[["ct"]], alternative=ALT, pval.method="fisheR" ) })
            speed.ft <- system.time({ .ft <- fisher.test( .aux[["ct"]], alternative=ALT ) })
            checkEqualsNumeric( .res$p.value, .ft$p.value, msg=MSG )
            checkSpeed( speed.ht, speed.ft, MSG )
        }

        
    } # FI require
} 

foo <- function(){
options(width=10000)
library(RUnit)
source("createRpackage.R")
library(hypergea)
testsuite_hypergeom.test <- defineTestSuite( "hypergeom.test", dirs=file.path("."), testFileRegexp="^test_+.*\\.R", testFuncRegexp="^test_+" )
testResult <- runTestSuite(testsuite_hypergeom.test)
printTextProtocol(testResult)

}
