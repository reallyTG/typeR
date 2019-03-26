library(tmod)


### Name: Egambia
### Title: Gene expression in TB patients and Healthy controls
### Aliases: Egambia

### ** Examples

## Not run: 
##D # The data set has been generated as follows:
##D # get the data set from GEO
##D library( GEOquery )
##D gambia <- getGEO( "GSE28623" )[[1]]
##D 
##D # Convert to limma and normalize
##D library( limma )
##D e <- new( "EListRaw", list( E= exprs( gambia ), genes= fData( gambia ), targets= pData( gambia ) ) )
##D e.bg <- backgroundCorrect( e, method= "normexp" )
##D en <- normalizeBetweenArrays( e.bg, method= "q" )
##D en <- avereps( en, ID= en$genes$NAME )
##D en <- en[ en$genes$CONTROL_TYPE == "FALSE", ]
##D en$targets$group <- factor( gsub( " whole blood RNA *", "", en$targets$description ) )
##D 
##D # Fill in Entrez Gene IDs
##D library( org.Hs.eg.db )
##D en$genes$EG <- ""
##D sel <- en$genes$REFSEQ %in% ls( org.Hs.egREFSEQ2EG )
##D en$genes$EG[sel] <- mget( as.character( en$genes$REFSEQ[sel] ), org.Hs.egREFSEQ2EG )
##D 
##D # Filter by IQR and missing EG's
##D iqrs <- apply( en$E, 1, IQR )
##D en2 <- en[ iqrs > quantile( iqrs, 0.75 ) & en$genes$EG != "", ]
##D 
##D # Select 10 random samples from NID and TB groups
##D en2 <- en2[ , c( sample( which( en2$targets$group == "NID" ), 10 ), 
##D                  sample( which( en2$targets$group == "TB" ), 10 ) ) ]
##D colnames( en2$E ) <- en2$targets$group
##D Egambia <- cbind( en2$genes[ , c( "GENE_SYMBOL", "GENE_NAME", "EG" ) ], en2$E )
## End(Not run)



