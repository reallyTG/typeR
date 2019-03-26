if(require(tree)) {

library( SplitSoftening )

is.even <- function( n ) { return( 0L == n%%2L ) }

# An alternative implementation of prediction with softsplits
predictSoftsplitsAlt <- function(fit, newdata)
{
   datalen <- nrow(newdata)
   tmp <- list()
   for (ri in nrow(fit):1) { # go over all nodes from last to first
      node <- fit[ri,]
      if (0L==node$ncat) { # the node is a leaf
         tmp[[ri]] <- matrix(node$yval, ncol=ncol(node$yval),
            nrow=datalen, byrow=TRUE)
      }
      if (is.even(ri)) {
         # compute values in the parent node
         pni <- which(fit$childref==ri)[1] # index of the parent node
         parent <- fit[pni,] # parent node record
         # get newdata values of the variable appropriate for the parent's split
         v <- newdata[[as.integer(factor(parent$var, levels=names(newdata)))]]
         lower.sub <- as.integer(parent$ncat==1L)
         lower <- ri+lower.sub
         upper <- ri+1-lower.sub
         if (parent$ncat<2L) {
            # compute probability values
            sval <- rep(NA, datalen) # init probability values
            sval[v<=parent$lb] <- 1
            sval[v>=parent$ub] <- 0
            mv <- v>parent$lb & v<parent$splits
            sval[mv] <- .5+(parent$splits-v[mv])/(2*(parent$splits-parent$lb))
            mv <- v>=parent$splits & v<parent$ub
            sval[mv] <- .5-(parent$splits-v[mv])/(2*(parent$splits-parent$ub))
            # store values computed for the parent node
            tmp[[pni]] <- sval*tmp[[lower]]+(1-sval)*tmp[[upper]]
         } else {
            # split on a categorial variable
            stopifnot( typeof( v ) == "integer" )
            # store values computed for the parent node
            il <- !is.even(floor(parent$lb/2^(as.integer(v)-1)))
            ir <- !is.even(floor(parent$ub/2^(as.integer(v)-1)))
            im <- !il & !ir
            tmp[[pni]] <- il * tmp[[lower]] + ir * tmp[[upper]] + im * matrix(parent$yval, ncol=ncol(parent$yval), nrow=datalen, byrow=TRUE)
         }
         # remove temporary values
         tmp[[lower]] <- NULL
         tmp[[upper]] <- NULL
      }
   }
   return(tmp[[1]])
} 

create.data.gauss2 <- function() {
	rbind( data.frame( matrix( -1 + rnorm( 1000 ), ncol=2 ), Y="neg" ), data.frame( matrix( 1 + rnorm( 1000 ), ncol=2 ), Y="pos" ) )
}

set.softening <- function(model, boundary.dist=1.0) {
	index <- model$ncat %in% c(-1L, 1L)
	model$lb[index] <- model$lb[index] - boundary.dist
	model$ub[index] <- model$ub[index] + boundary.dist
	return( model )
}

do.test <- function(desc, fn) {
	print(desc)
	stopifnot(fn())
}

group1 <- function () {
	set.seed( 12345 )
	d <- create.data.gauss2()
	td <- d[names(d)!="Y"]
	tr <- tree( Y~., d )
	s <- softsplits( tr )

	do.test( "predict train data with zero softening", function() {
		res.tr <- predict( tr, d )
		res.s <- predictSoftsplits( s, d )
		return ( isTRUE(all.equal( c(res.tr), c(res.s) )) )
	} )

	do.test( "predict test data with zero softening", function() {
		res.tr <- predict( tr, td )
		res.s <- predictSoftsplits( s, td )
		return ( isTRUE(all.equal( res.tr, res.s )) )
	} )

	do.test( "predict train data", function() {
		ss <- set.softening(s, .75)
		res.s <- predictSoftsplits( ss, d )
		res.R <- predictSoftsplitsAlt( ss, d )
		return ( isTRUE(all.equal( c(res.s), c(res.R) )) )
	} )

	do.test( "predict another data", function() {
		ss <- set.softening(s, .75)
		td <- create.data.gauss2()
		td <- td[names(td)!="Y"]
		res.s <- predictSoftsplits( ss, td )
		res.R <- predictSoftsplitsAlt( ss, td )
		return ( isTRUE(all.equal( c(res.s), c(res.R) )) )
	} )
}

group1()

}

