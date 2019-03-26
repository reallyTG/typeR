library(mvbutils)


### Name: mvbutils.operators
### Title: Utility operators
### Aliases: mvbutils.operators %&% %!in% %**% %except% %grepling%
###   %is.not.a% %is.a% %is.not.an% %is.an% %matching% %not.in%
###   %not.in.range% %perling% %that.match% %that.dont.match% %that.are.in%
###   %without.name% %in.range% %such.that% %SUCH.THAT% %upto% %downto%
###   %where% %where.warn% %<-%
### Keywords: misc

### ** Examples

"a" %&% "b" # "ab"
matrix( 1:4, 2, 2) %**% matrix( 1:2, 2, 1) # c( 7, 10); '%*%' gives matrix result
matrix( 1:2, 2, 1) %**% matrix( 1:4, 2, 2) # c( 5, 11); '%*%' gives error
1:2 %**% matrix( 1:4, 2, 2) # '%*%' gives matrix result
1:5 %!in% 3:4 # c( TRUE, TRUE, FALSE, FALSE, TRUE)
1:5 %not.in% 3:4 # c( TRUE, TRUE, FALSE, FALSE, TRUE)
1:5 %that.are.in% 3:4 # c( 3, 4)
trf <- try( 1+"nonsense")
if( trf %is.not.a% "try-error") cat( "OK\n") else cat( "not OK\n")
1:5 %except% c(2,4,6) # c(1,3,5)
c( alpha=1, beta=2) %without.name% "alpha" # c( beta=2)
1:5 %in.range% c( 2, 4) # c(F,T,T,T,F)
1:5 %not.in.range% c( 2, 4) # c(T,F,F,F,T)
c( "cat", "hat", "dog", "brick") %matching% c( "at", "ic") # cat hat brick
c( "cat", "hat", "dog", "brick") %that.match% c( "at", "ic") # cat hat brick; ...
# ... synonym for '%matching%'
c( "cat", "hat", "dog", "brick") %that.dont.match% c( "at", "ic") # dog; ...
# ... like '%except%' but for regexps
1 %upto% 2 # 1:2
1 %upto% 0 # numeric( 0); use %upto% rather than : in for-loops to avoid unintended errors
1 %downto% 0 # 1:0
1 %downto% 2 # numeric( 0)
ff <- function( which.row) {
    x <- data.frame( a=1:3, b=4:6)
    x %where% (a==which.row)
  }
ff( 2) # data.frame( a=2, b=5)
x <- data.frame( start=1:3, end=c( 4, 5, 0))
x %where.warn% (start < end) # gives warning about row 3
(1:5) %such.that% (.>2) # 3,4,5
listio <- list( a=1,  b=2)
chars <- cq( a, b)
chars %SUCH.THAT% (listio[[.]]==2) # 'b'; %such.that% won't work because [[]] can't handle xtuples
{x;y} %<-% list( 'yes', sqrt(pi))
# x: [1] "yes"
# y: [1] 1.772



