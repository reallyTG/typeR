library(mvbutils)


### Name: print
### Title: Print values
### Aliases: print print.cat print.specialprint print.pagertemp
###   print.function print.call print.name print.<- print.( print.{
###   print.if print.for print.while print.default
### Keywords: misc

### ** Examples

## Not run: 
##D # Special methods shown below; basic behaviour of 'print', 'print.default',
##D # and 'print.function' is as for base-R
##D #cat
##D ugly.bugly <- c( 'A rose by any other name', 'would annoy taxonomists')
##D ugly.bugly
##D #[1] "A rose by any other name"                 "would annoy taxonomists"
##D as.cat( ugly.bugly) # calls print.cat--- no clutter
##D #A rose by any other name
##D #would annoy taxonomists
##D # nullprint:
##D biggo <- 1:1000
##D biggo
##D # [1]   1   2   3   4   5   6   7   8   9  10  11  12  13  14  15  16  17  18
##D # [2] 19  20  21  22  23  24  25  26  27  28 etc...
##D oldClass( biggo) <- 'nullprint'
##D biggo # calls print.nullprint
##D # nuthin'
##D # specialprint:
##D x <- matrix( exp( seq( -20, 19, by=2)), 4, 5)
##D attr( x, 'print') <- expression( {
##D     x[] <- sprintf( '%12.2f', x);
##D     class( x) <- 'noquote';
##D     attr( x, 'print') <- NULL;
##D     print( x)
##D   })
##D class( x) <- 'specialprint'
##D x # calls print.specialprint; consistently formatted for once
##D #     [,1]         [,2]         [,3]         [,4]         [,5]
##D #[1,]         0.00         0.00         0.02        54.60    162754.79
##D #[2,]         0.00         0.00         0.14       403.43   1202604.28
##D #[3,]         0.00         0.00         1.00      2980.96   8886110.52
##D #[4,]         0.00         0.00         7.39     22026.47  65659969.14
## End(Not run)



