library(fbati)


### Name: fbatc
### Title: fbatc
### Aliases: fbatc
### Keywords: interface

### ** Examples

## Not run: 
##D   set.seed(13)
##D 
##D   ## We simulate NO LD HERE, and a completely random trait!
##D   ## Data here is only to show how to use the function
##D 
##D   ###################
##D   ## IGNORE START: ##
##D   ###################
##D 
##D   ##  You can safely ignore how the data is generated,
##D   ##  and just see how to use it afterward.
##D   NUM_FAMILIES <- 500
##D   AFREQ <- c(0.2,0.2)
##D   ped <- as.ped( data.frame( pid = kronecker(1:NUM_FAMILIES,c(1,1,1)),
##D                             id = kronecker( rep(1,NUM_FAMILIES), c(1,2,3) ),
##D                             idfath = kronecker( rep(1,NUM_FAMILIES), c(0,0,1) ),
##D                             idmoth = kronecker( rep(1,NUM_FAMILIES), c(0,0,2) ),
##D                             sex = rep(0,NUM_FAMILIES*3),
##D                             AffectionStatus = kronecker( rep(1,NUM_FAMILIES), c(0,0,2) ),
##D                             m0.a = rep(0,NUM_FAMILIES*3),      ## missing for now
##D                             m0.b = rep(0,NUM_FAMILIES*3),
##D                             m1.a = rep(0,NUM_FAMILIES*3),
##D                             m1.b = rep(0,NUM_FAMILIES*3) ) )
##D   CUR_FAMILY <- 1
##D   while( CUR_FAMILY<=NUM_FAMILIES ) {
##D     ## Indexing: start=father, (start+1)=mother, (start+2)=child
##D     start <- CUR_FAMILY*3-2
##D 
##D     ## Draw the parental genotypes from the population
##D     ped$m0.a[start:(start+1)] <- rbinom( 1, 1, AFREQ[1] ) + 1
##D     ped$m0.b[start:(start+1)] <- rbinom( 1, 1, AFREQ[1] ) + 1
##D     ped$m1.a[start:(start+1)] <- rbinom( 1, 1, AFREQ[2] ) + 1
##D     ped$m1.b[start:(start+1)] <- rbinom( 1, 1, AFREQ[2] ) + 1
##D 
##D     ## Draw the children's genotype from the parents
##D     ma <- rbinom( 1, 1, 0.5 )
##D     mb <- rbinom( 1, 1, 0.5 )
##D     if( rbinom( 1, 1, 0.5 ) == 0 ) {
##D       ped$m0.a[start+2] <- ped$m0.a[start]
##D       ped$m1.a[start+2] <- ped$m1.a[start]
##D     }else{
##D       ped$m0.a[start+2] <- ped$m0.b[start]
##D       ped$m1.a[start+2] <- ped$m1.b[start]
##D     }
##D     if( rbinom( 1, 1, 0.5 ) == 0 ) {
##D       ped$m0.b[start+2] <- ped$m0.a[start+1]
##D       ped$m1.b[start+2] <- ped$m1.a[start+1]
##D     }else{
##D       ped$m0.b[start+2] <- ped$m0.b[start+1]
##D       ped$m1.b[start+2] <- ped$m1.b[start+1]
##D     }
##D 
##D     CUR_FAMILY <- CUR_FAMILY + 1
##D   }
##D 
##D   ## Create a completely random phenotype as well
##D   phe <- as.phe( data.frame( pid=ped$pid, id=ped$id, qtl=rnorm(nrow(ped)) ) )
##D 
##D   ################
##D   ## IGNORE END ##
##D   ################
##D 
##D   ## Look at the first part of the pedigree
##D   print( head( ped ) )
##D   ## Look at the first part of the phenotype
##D   print( head( phe ) )
##D 
##D   ## Binary trait
##D   ## -- fbatc default trait is AffectionStatus
##D   ## -- fbatc default trait type is 'auto'
##D   ## - Test marker m1 conditional on m0
##D   print(  fbatc( ped=ped, markerAnalyze="m1", markerCondition="m0" )  )
##D   ## - Do the test the other way around, m0 conditional on m1
##D   print(  fbatc( ped=ped, markerAnalyze="m0", markerCondition="m1" )  )
##D   ## - Otherwise, we could have done this in one step;
##D   ##    if markerCondition is not specified, each member
##D   ##     of markerAnalyze is used.
##D   print(  fbatc( ped=ped, markerAnalyze=c("m0","m1") )  )
##D 
##D   ## QTL
##D   print(  fbatc( ped=ped, phe=phe, trait="qtl", markerAnalyze="m1", markerCondition="m0" )  )
##D   print(  fbatc( ped=ped, phe=phe, trait="qtl", markerAnalyze="m0", markerCondition="m1" )  )
##D 
##D   ## Additionally, we could write out the data that we
##D   ##  generated to disk so that we can then use it.
##D   write.ped( "simulated", ped ) ## to simulated.ped
##D   write.phe( "simulated", phe ) ## to simulated.phe
## End(Not run)



